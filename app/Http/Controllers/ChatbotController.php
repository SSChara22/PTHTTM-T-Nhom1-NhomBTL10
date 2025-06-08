<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\Product;

class ChatbotController extends Controller
{
    public function ask(Request $request)
    {
        $question = $request->input('message');
        $apiKey = 'AIzaSyB5xDwJCFmwunekzPaij8G7-MLkTWhspc0'; // Đã có key thực tế

        // Tìm sản phẩm liên quan theo từ khóa trong câu hỏi
        $keywords = explode(' ', $question);
        $products = Product::where('status', 'active')
            ->where(function($q) use ($keywords) {
                foreach ($keywords as $word) {
                    $q->orWhere('title', 'like', "%$word%")
                      ->orWhere('summary', 'like', "%$word%")
                      ->orWhere('description', 'like', "%$word%")
                      ->orWhere('slug', 'like', "%$word%")
                      ;
                }
            })
            ->limit(5)
            ->get();

        $productInfo = "";
        if ($products->count()) {
            $productInfo = "\nDưới đây là một số sản phẩm phù hợp trong kho hàng của shop:\n";
            foreach ($products as $prod) {
                $productInfo .= "- Tên: {$prod->title}, Giá: " . number_format($prod->price,0,',','.') . "đ, Tóm tắt: " . strip_tags($prod->summary) . "\n";
            }
            $productInfo .= "\nNếu khách hỏi về sản phẩm, hãy ưu tiên gợi ý các sản phẩm này nếu phù hợp.";
        }

        $prompt = $question . $productInfo;

        $response = Http::withHeaders([
            'Content-Type' => 'application/json',
            'x-goog-api-key' => $apiKey,
        ])->post('https://generativelanguage.googleapis.com/v1/models/gemini-1.5-flash:generateContent', [
            'contents' => [
                [
                    'role' => 'user',
                    'parts' => [
                        ['text' => $prompt]
                    ]
                ]
            ]
        ]);

        \Log::info('Gemini response', ['data' => $response->json()]);

        $data = $response->json();
        $answer = 'Xin lỗi, tôi chưa có câu trả lời phù hợp.';
        if (isset($data['candidates'][0]['content']['parts'][0]['text'])) {
            $answer = $data['candidates'][0]['content']['parts'][0]['text'];
        } elseif (isset($data['error'])) {
            $answer = 'Lỗi: ' . ($data['error']['message'] ?? 'Không xác định');
        }

        return response()->json(['answer' => $answer]);
    }
} 