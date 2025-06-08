@extends('admin.layouts.master')

@section('title','Chi tiết yêu cầu trả hàng')

@section('main-content')
<div class="card">
    <h5 class="card-header">Chi tiết yêu cầu trả hàng #{{ $return->id }}</h5>
    <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                <h6>Thông tin đơn hàng</h6>
                <table class="table table-bordered">
                    <tr>
                        <th>Mã đơn hàng</th>
                        <td>{{ $return->order->order_number }}</td>
                    </tr>
                    <tr>
                        <th>Người đặt hàng</th>
                        <td>{{ $return->order->user->name }}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>{{ $return->order->user->email }}</td>
                    </tr>
                    <tr>
                        <th>Trạng thái đơn hàng</th>
                        <td>{{ $return->order->status }}</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-6">
                <h6>Thông tin yêu cầu trả hàng</h6>
                <table class="table table-bordered">
                    <tr>
                        <th>Lý do trả hàng</th>
                        <td>{{ $return->reason }}</td>
                    </tr>
                    <tr>
                        <th>Mô tả</th>
                        <td>{{ $return->description }}</td>
                    </tr>
                    <tr>
                        <th>Phương thức hoàn tiền</th>
                        <td>{{ $return->refund_method }}</td>
                    </tr>
                    @if($return->refund_method == 'bank_transfer')
                        <tr>
                            <th>Ngân hàng</th>
                            <td>{{ $return->bank_name }}</td>
                        </tr>
                        <tr>
                            <th>Số tài khoản</th>
                            <td>{{ $return->bank_account }}</td>
                        </tr>
                    @endif
                    <tr>
                        <th>Trạng thái</th>
                        <td>
                            @switch($return->status)
                                @case('pending')
                                    <span class="badge badge-warning">Chờ xử lý</span>
                                    @break
                                @case('approved')
                                    <span class="badge badge-success">Đã duyệt</span>
                                    @break
                                @case('rejected')
                                    <span class="badge badge-danger">Từ chối</span>
                                    @break
                                @case('completed')
                                    <span class="badge badge-info">Hoàn thành</span>
                                    @break
                            @endswitch
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        @if($return->evidence_image)
            <div class="row mt-4">
                <div class="col-12">
                    <h6>Hình ảnh minh chứng</h6>
                    <img src="{{ asset($return->evidence_image) }}" alt="Evidence" class="img-fluid" style="max-width: 500px;">
                </div>
            </div>
        @endif

        @if($return->status == 'pending')
            <div class="row mt-4">
                <div class="col-12">
                    <form action="{{ route('admin.returns.update-status', $return->id) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="form-group">
                            <label for="status">Cập nhật trạng thái</label>
                            <select name="status" id="status" class="form-control @error('status') is-invalid @enderror">
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
                            <textarea name="admin_note" id="admin_note" rows="3" class="form-control @error('admin_note') is-invalid @enderror"></textarea>
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
                <div class="col-12">
                    <h6>Ghi chú của admin</h6>
                    <p>{{ $return->admin_note }}</p>
                </div>
            </div>
        @endif
    </div>
</div>
@endsection 