<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MomoController extends Controller
{
    public function createPayment(Request $request)
    {
        $order_code = session('order_id') ?? 'Mã đơn hàng';
        $amount = session('amount') ?? 10000;
        $phone = config('momo.phone', env('MOMO_PHONE', '0878704790'));
        // Nội dung QR động theo chuẩn MoMo: 2|99|phone|amount|order_code
        $qr_content = "2|99|$phone|$amount|$order_code";
        $qr_url = "https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=" . urlencode($qr_content);
        return view('frontend.pages.momo_qr', compact('order_code', 'amount', 'qr_url'));
    }

    public function success(Request $request)
    {
        // Xử lý khi thanh toán thành công từ MoMo
        // $request->all() sẽ có các tham số trả về
        return redirect()->route('home')->with('success', 'Thanh toán MoMo thành công!');
    }

    public function ipn(Request $request)
    {
        // Xử lý callback từ MoMo server (IPN)
        // $request->all() sẽ có các tham số trả về
        // Thường dùng để xác nhận đơn hàng ở backend
        return response()->json(['message' => 'IPN received'], 200);
    }
} 