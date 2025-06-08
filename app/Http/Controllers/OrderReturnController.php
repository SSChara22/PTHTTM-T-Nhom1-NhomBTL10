<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderReturn;
use Illuminate\Support\Facades\Storage;

class OrderReturnController extends Controller
{
    public function create($order_id)
    {
        $order = Order::findOrFail($order_id);
        
        // Check if order is eligible for return
        if ($order->status !== 'delivered' || $order->payment_status !== 'paid') {
            return redirect()->back()->with('error', 'Đơn hàng không đủ điều kiện để trả hàng');
        }

        // Check if return request already exists
        if ($order->return) {
            return redirect()->back()->with('error', 'Yêu cầu trả hàng đã tồn tại');
        }

        return view('user.order.return', compact('order'));
    }

    public function store(Request $request, $order_id)
    {
        $order = Order::findOrFail($order_id);

        $request->validate([
            'reason' => 'required|string',
            'description' => 'nullable|string',
            'evidence_image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
            'refund_method' => 'required|in:bank_transfer,cash,store_credit',
            'bank_account' => 'required_if:refund_method,bank_transfer',
            'bank_name' => 'required_if:refund_method,bank_transfer',
        ]);

        $data = $request->all();

        // Handle evidence image upload
        if ($request->hasFile('evidence_image')) {
            $image = $request->file('evidence_image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();
            $image->storeAs('public/returns', $imageName);
            $data['evidence_image'] = 'returns/' . $imageName;
        }

        $data['order_id'] = $order_id;
        $data['status'] = 'pending';

        OrderReturn::create($data);

        return redirect()->route('user.order.show', $order_id)
            ->with('success', 'Yêu cầu trả hàng đã được gửi thành công');
    }

    public function index()
    {
        $returns = OrderReturn::with('order')->latest()->paginate(10);
        return view('backend.order.returns.index', compact('returns'));
    }

    public function show($id)
    {
        $return = OrderReturn::with('order')->findOrFail($id);
        return view('backend.order.returns.show', compact('return'));
    }

    public function updateStatus(Request $request, $id)
    {
        $return = OrderReturn::findOrFail($id);
        
        $request->validate([
            'status' => 'required|in:approved,rejected',
            'admin_note' => 'required|string'
        ]);

        $return->update([
            'status' => $request->status,
            'admin_note' => $request->admin_note
        ]);

        // If approved, update order status
        if ($request->status === 'approved') {
            $return->order->update(['status' => 'returned']);
        }

        return redirect()->route('admin.returns.index')
            ->with('success', 'Cập nhật trạng thái yêu cầu trả hàng thành công');
    }
} 