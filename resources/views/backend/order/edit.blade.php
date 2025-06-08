@extends('backend.layouts.master')

@section('title','Order Detail')

@section('main-content')
<div class="card">
  <h5 class="card-header">Sửa đơn hàng</h5>
  <div class="card-body">
    <form action="{{route('order.update',$order->id)}}" method="POST">
      @csrf
      @method('PATCH')
      <div class="form-group">
        <label for="status">Trạng thái :</label>
        <select name="status" id="status" class="form-control">
          <option value="new" {{($order->status=='delivered' || $order->status=="process" || $order->status=="cancel") ? 'disabled' : ''}}  {{(($order->status=='new')? 'selected' : '')}}>Mới</option>
          <option value="process" {{($order->status=='delivered'|| $order->status=="cancel") ? 'disabled' : ''}}  {{(($order->status=='process')? 'selected' : '')}}>Đang xử lí</option>
          <option value="delivered" {{($order->status=="cancel") ? 'disabled' : ''}}  {{(($order->status=='delivered')? 'selected' : '')}}>Đã vận chuyển</option>
          <option value="cancel" {{($order->status=='delivered') ? 'disabled' : ''}}  {{(($order->status=='cancel')? 'selected' : '')}}>Hủy bỏ</option>
        </select>
      </div>

      <div class="form-group payment-status" style="display: none;">
        <label for="payment_status">Trạng thái thanh toán :</label>
        <select name="payment_status" id="payment_status" class="form-control">
          <option value="paid" {{($order->payment_status=='paid')? 'selected' : ''}}>Đã thanh toán</option>
          <option value="unpaid" {{($order->payment_status=='unpaid')? 'selected' : ''}}>Chưa thanh toán</option>
        </select>
      </div>

      <button type="submit" class="btn btn-primary">Cập nhật</button>
    </form>
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

@push('scripts')
<script>
    $(document).ready(function() {
        // Show/hide payment status based on order status
        function togglePaymentStatus() {
            if($('#status').val() === 'delivered') {
                $('.payment-status').show();
            } else {
                $('.payment-status').hide();
            }
        }

        // Initial check
        togglePaymentStatus();

        // Check on status change
        $('#status').change(function() {
            togglePaymentStatus();
        });
    });
</script>
@endpush
