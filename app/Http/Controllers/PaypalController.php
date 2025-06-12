<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Product;
use DB;
use App\Models\Order;
use App\Services\PayPalService;
use PayPalCheckoutSdk\Orders\OrdersCreateRequest;
use PayPalCheckoutSdk\Orders\OrdersCaptureRequest;

class PaypalController extends Controller
{
    public function createOrder(PayPalService $paypal)
    {
        // Lấy thông tin giỏ hàng và tổng tiền thực tế ở đây nếu cần
        $request = new OrdersCreateRequest();
        $request->prefer('return=representation');
        $request->body = [
            "intent" => "CAPTURE",
            "purchase_units" => [[
                "amount" => [
                    "currency_code" => "USD",
                    "value" => "10.00" // Thay bằng tổng tiền thực tế
                ]
            ]],
            "application_context" => [
                "cancel_url" => route('paypal.cancel'),
                "return_url" => route('paypal.success')
            ]
        ];

        $client = $paypal->client();
        $response = $client->execute($request);

        foreach ($response->result->links as $link) {
            if ($link->rel == 'approve') {
                return redirect($link->href);
            }
        }
        return redirect()->back()->with('error', 'Không lấy được link thanh toán PayPal.');
    }

    public function success(Request $request, PayPalService $paypal)
    {
        $token = $request->query('token');
        if (!$token) {
            return redirect()->route('home')->with('error', 'Không tìm thấy token thanh toán.');
        }
        $client = $paypal->client();
        $captureRequest = new OrdersCaptureRequest($token);
        $captureRequest->prefer('return=representation');
        $response = $client->execute($captureRequest);
        // Xử lý lưu đơn hàng, cập nhật trạng thái tại đây
        return redirect()->route('home')->with('success', 'Thanh toán PayPal thành công!');
    }

    public function cancel()
    {
        return redirect()->route('home')->with('error', 'Bạn đã hủy thanh toán PayPal.');
    }
}
