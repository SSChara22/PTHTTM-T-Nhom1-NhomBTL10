<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Cart;
use Session;
use Auth;

class MomoController extends Controller
{
    public function processPayment(Request $request)
    {
        // Lấy thông tin đơn hàng từ session
        $order_id = Session::get('order_id');
        $amount = Session::get('amount');
        $order_code = Session::get('order_code');

        if(!$order_id || !$amount || !$order_code) {
            return redirect()->route('home')->with('error', 'Không tìm thấy thông tin đơn hàng!');
        }

        // Cập nhật thông tin đơn hàng
        $order = Order::find($order_id);
        if($order) {
            $order->payment_method = 'momo';
            $order->status = 'processing';
            $order->save();
        }

        // Lấy số điện thoại MoMo từ config
        $phone = config('momo.phone', env('MOMO_PHONE', '0901234567'));

        // Tạo URL thanh toán MoMo
        $momoUrl = "https://nhantien.momo.vn/{$phone}?amount={$amount}&comment={$order_code}";

        // Chuyển hướng sang trang thanh toán MoMo
        return redirect($momoUrl);
    }

    public function success(Request $request)
    {
        // Xử lý khi thanh toán thành công
        return redirect()->route('home')->with('success', 'Thanh toán thành công!');
    }

    public function cancel(Request $request)
    {
        // Xử lý khi thanh toán bị hủy
        return redirect()->route('home')->with('error', 'Thanh toán bị hủy!');
    }
} 