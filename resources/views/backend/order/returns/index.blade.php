@extends('backend.layouts.master')

@section('title','Quản lý yêu cầu trả hàng')

@section('main-content')
<div class="card">
    <h5 class="card-header">Danh sách yêu cầu trả hàng</h5>
    <div class="card-body">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Mã đơn hàng</th>
                    <th>Khách hàng</th>
                    <th>Lý do</th>
                    <th>Phương thức hoàn tiền</th>
                    <th>Trạng thái</th>
                    <th>Ngày tạo</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                @foreach($returns as $return)
                <tr>
                    <td>{{$return->id}}</td>
                    <td>{{$return->order->order_number}}</td>
                    <td>{{$return->order->first_name}} {{$return->order->last_name}}</td>
                    <td>{{$return->reason}}</td>
                    <td>
                        @if($return->refund_method == 'bank_transfer')
                            Chuyển khoản
                        @elseif($return->refund_method == 'cash')
                            Tiền mặt
                        @else
                            Tín dụng cửa hàng
                        @endif
                    </td>
                    <td>
                        @if($return->status == 'pending')
                            <span class="badge badge-warning">Đang chờ</span>
                        @elseif($return->status == 'approved')
                            <span class="badge badge-success">Đã duyệt</span>
                        @else
                            <span class="badge badge-danger">Đã từ chối</span>
                        @endif
                    </td>
                    <td>{{$return->created_at->format('d/m/Y H:i')}}</td>
                    <td>
                        <a href="{{route('admin.returns.show', $return->id)}}" class="btn btn-primary btn-sm float-left mr-1" style="height:30px; width:30px;border-radius:50%" data-toggle="tooltip" title="Xem chi tiết" data-placement="bottom"><i class="fas fa-eye"></i></a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
        <span style="float:right">{{$returns->links()}}</span>
    </div>
</div>
@endsection 