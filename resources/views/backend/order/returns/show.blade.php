@extends('backend.layouts.master')

@section('title','Chi tiết yêu cầu trả hàng')

@section('main-content')
<div class="card">
    <h5 class="card-header">Chi tiết yêu cầu trả hàng</h5>
    <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                <h6>Thông tin đơn hàng</h6>
                <table class="table">
                    <tr>
                        <td>Mã đơn hàng</td>
                        <td>: {{$return->order->order_number}}</td>
                    </tr>
                    <tr>
                        <td>Khách hàng</td>
                        <td>: {{$return->order->first_name}} {{$return->order->last_name}}</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>: {{$return->order->email}}</td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td>: {{$return->order->phone}}</td>
                    </tr>
                    <tr>
                        <td>Tổng tiền</td>
                        <td>: {{number_format($return->order->total_amount,2)}}đ</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6">
                <h6>Thông tin yêu cầu trả hàng</h6>
                <table class="table">
                    <tr>
                        <td>Lý do trả hàng</td>
                        <td>: {{$return->reason}}</td>
                    </tr>
                    <tr>
                        <td>Mô tả</td>
                        <td>: {{$return->description}}</td>
                    </tr>
                    <tr>
                        <td>Phương thức hoàn tiền</td>
                        <td>: 
                            @if($return->refund_method == 'bank_transfer')
                                Chuyển khoản
                            @elseif($return->refund_method == 'cash')
                                Tiền mặt
                            @else
                                Tín dụng cửa hàng
                            @endif
                        </td>
                    </tr>
                    @if($return->refund_method == 'bank_transfer')
                    <tr>
                        <td>Ngân hàng</td>
                        <td>: {{$return->bank_name}}</td>
                    </tr>
                    <tr>
                        <td>Số tài khoản</td>
                        <td>: {{$return->bank_account}}</td>
                    </tr>
                    @endif
                    <tr>
                        <td>Trạng thái</td>
                        <td>: 
                            @if($return->status == 'pending')
                                <span class="badge badge-warning">Đang chờ</span>
                            @elseif($return->status == 'approved')
                                <span class="badge badge-success">Đã duyệt</span>
                            @else
                                <span class="badge badge-danger">Đã từ chối</span>
                            @endif
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        @if($return->evidence_image)
        <div class="row mt-4">
            <div class="col-md-12">
                <h6>Hình ảnh minh chứng</h6>
                <img src="{{asset('storage/'.$return->evidence_image)}}" alt="Evidence" class="img-fluid" style="max-width: 300px;">
            </div>
        </div>
        @endif

        @if($return->status == 'pending')
        <div class="row mt-4">
            <div class="col-md-12">
                <form action="{{route('admin.returns.update-status', $return->id)}}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="status">Cập nhật trạng thái</label>
                        <select name="status" id="status" class="form-control @error('status') is-invalid @enderror">
                            <option value="">Chọn trạng thái</option>
                            <option value="approved">Duyệt yêu cầu</option>
                            <option value="rejected">Từ chối yêu cầu</option>
                        </select>
                        @error('status')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="admin_note">Ghi chú</label>
                        <textarea name="admin_note" id="admin_note" rows="3" class="form-control @error('admin_note') is-invalid @enderror" placeholder="Nhập ghi chú..."></textarea>
                        @error('admin_note')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                </form>
            </div>
        </div>
        @endif

        @if($return->admin_note)
        <div class="row mt-4">
            <div class="col-md-12">
                <h6>Ghi chú của admin</h6>
                <p>{{$return->admin_note}}</p>
            </div>
        </div>
        @endif
    </div>
</div>
@endsection 