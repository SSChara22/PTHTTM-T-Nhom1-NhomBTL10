@extends('user.layouts.master')

@section('title','Order Detail')

@section('main-content')
<div class="card">
<h5 class="card-header">Đơn hàng      <a href="{{route('order.pdf',$order->id)}}" class=" btn btn-sm btn-primary shadow-sm float-right"><i class="fas fa-download fa-sm text-white-50"></i> Generate PDF</a>
  </h5>
  <div class="card-body">
    @if($order)
    <table class="table table-striped table-hover">
      <thead>
        <tr>
            <th>STT</th>
            <th>Mã đơn hàng</th>
            <th>Tên</th>
            <th>Email</th>
            <th>Số lượng</th>
            <th>Phụ phí</th>
            <th>Tổng tiền</th>
            <th>Trạng thái</th>
            <th>Hành động</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td>{{$order->id}}</td>
            <td>{{$order->order_number}}</td>
            <td>{{$order->first_name}} {{$order->last_name}}</td>
            <td>{{$order->email}}</td>
            <td>{{$order->quantity}}</td>
            <td>{{$order->shipping->price}}đ</td>
            <td>{{number_format($order->total_amount,2)}}đ</td>
            <td>
                @if($order->status=='new')
                  <span class="badge badge-primary">{{$order->status}}</span>
                @elseif($order->status=='process')
                  <span class="badge badge-warning">{{$order->status}}</span>
                @elseif($order->status=='delivered')
                  <span class="badge badge-success">{{$order->status}}</span>
                @else
                  <span class="badge badge-danger">{{$order->status}}</span>
                @endif
            </td>
            <td>
                <!-- Đã xoá form xoá đơn hàng -->
            </td>

        </tr>
      </tbody>
    </table>

    <section class="confirmation_part section_padding">
      <div class="order_boxes">
        <div class="row">
          <div class="col-lg-6 col-lx-4">
            <div class="order-info">
              <h4 class="text-center pb-4">Thông tin đơn hàng</h4>
              <table class="table">
                    <tr class="">
                        <td>Số đơn hàng</td>
                        <td> : {{$order->order_number}}</td>
                    </tr>
                    <tr>
                        <td>Ngày tạo đơn</td>
                        <td> : {{$order->created_at->format('D d M, Y')}} at {{$order->created_at->format('g : i a')}} </td>
                    </tr>
                    <tr>
                        <td>Số lượng</td>
                        <td> : {{$order->quantity}}</td>
                    </tr>
                    <tr>
                        <td>Trạng thái đơn</td>
                        <td> : {{$order->status}}</td>
                    </tr>
                    <tr>
                      @php
                          $shipping_charge=DB::table('shippings')->where('id',$order->shipping_id)->pluck('price');
                      @endphp
                        <td>Phí ship</td>
                        <td> :{{$order->shipping->price}}đ</td>
                    </tr>
                    <tr>
                        <td>Tổng tiền</td>
                        <td> : {{number_format($order->total_amount,2)}}đ</td>
                    </tr>
                    <tr>
                      <td>Phương thức thanh toán</td>
                      <td> : @if($order->payment_method=='cod') Tiền mặt @else Paypal @endif</td>
                    </tr>
                    <tr>
                        <td>Trạng thái thanh toán</td>
                        <td> : {{$order->payment_status}}</td>
                    </tr>
                    @if($order->status == 'delivered' && $order->payment_status == 'paid' && !$order->return)
                    <tr>
                        <td colspan="2">
                            <a href="{{route('user.order.return.create', $order->id)}}" class="btn btn-warning">Yêu cầu trả hàng</a>
                        </td>
                    </tr>
                    @endif
                    @if($order->return)
                    <tr>
                        <td>Trạng thái yêu cầu trả hàng</td>
                        <td> : 
                            @if($order->return->status == 'pending')
                                <span class="badge badge-warning">Đang chờ xử lý</span>
                            @elseif($order->return->status == 'approved')
                                <span class="badge badge-success">Đã được duyệt</span>
                            @else
                                <span class="badge badge-danger">Đã bị từ chối</span>
                            @endif
                        </td>
                    </tr>
                    @if($order->return->admin_note)
                    <tr>
                        <td>Ghi chú từ admin</td>
                        <td> : {{$order->return->admin_note}}</td>
                    </tr>
                    @endif
                    @endif
              </table>
            </div>
          </div>

          <div class="col-lg-6 col-lx-4">
            <div class="shipping-info">
              <h4 class="text-center pb-4">Thông tin vận chuyển</h4>
              <table class="table">
                    <tr class="">
                        <td>Tên</td>
                        <td> : {{$order->first_name}} {{$order->last_name}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td> : {{$order->email}}</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td> : {{$order->phone}}</td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td> : {{$order->address1}}, {{$order->address2}}</td>
                    </tr>
                    <tr>
                        <td>Quốc gia</td>
                        <td> : {{$order->country}}</td>
                    </tr>
                    <tr>
                        <td>Mã bưu điện</td>
                        <td> : {{$order->post_code}}</td>
                    </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </section>
    @endif

  </div>
</div>
@endsection

@push('styles')
<style>
    .order-info,.shipping-info{
        background:#ECECEC;
        padding:20px;
    }
    .order-info h4,.shipping-info h4{
        text-decoration: underline;
    }

</style>
@endpush
