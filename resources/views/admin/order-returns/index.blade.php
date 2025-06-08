@extends('admin.layouts.master')

@section('title','Quản lý yêu cầu trả hàng')

@section('main-content')
<div class="card">
    <h5 class="card-header">Danh sách yêu cầu trả hàng</h5>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Mã đơn hàng</th>
                        <th>Người dùng</th>
                        <th>Lý do</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($returns as $return)
                        <tr>
                            <td>{{ $return->id }}</td>
                            <td>{{ $return->order->order_number }}</td>
                            <td>{{ $return->order->user->name }}</td>
                            <td>{{ $return->reason }}</td>
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
                            <td>{{ $return->created_at->format('d/m/Y H:i') }}</td>
                            <td>
                                <a href="{{ route('admin.returns.show', $return->id) }}" class="btn btn-primary btn-sm">
                                    <i class="fa fa-eye"></i> Chi tiết
                                </a>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center mt-4">
            {{ $returns->links() }}
        </div>
    </div>
</div>
@endsection 