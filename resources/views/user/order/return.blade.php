@extends('user.layouts.master')

@section('title','Yêu cầu trả hàng')

@section('main-content')
<div class="card">
    <h5 class="card-header">Yêu cầu trả hàng</h5>
    <div class="card-body">
        <form action="{{ route('user.order.return.store', $order->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group">
                <label for="reason">Lý do trả hàng <span class="text-danger">*</span></label>
                <select name="reason" id="reason" class="form-control @error('reason') is-invalid @enderror">
                    <option value="">Chọn lý do trả hàng</option>
                    <option value="wrong_size">Sai kích thước</option>
                    <option value="wrong_color">Sai màu sắc</option>
                    <option value="defective">Sản phẩm bị lỗi</option>
                    <option value="not_as_described">Không đúng như mô tả</option>
                    <option value="damaged">Sản phẩm bị hư hỏng</option>
                    <option value="other">Lý do khác</option>
                </select>
                @error('reason')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="description">Mô tả chi tiết</label>
                <textarea name="description" id="description" rows="4" class="form-control @error('description') is-invalid @enderror" placeholder="Mô tả chi tiết lý do trả hàng..."></textarea>
                @error('description')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="evidence_image">Hình ảnh minh chứng</label>
                <input type="file" name="evidence_image" id="evidence_image" class="form-control @error('evidence_image') is-invalid @enderror">
                <small class="form-text text-muted">Tải lên hình ảnh minh chứng (nếu có)</small>
                @error('evidence_image')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>

            <div class="form-group">
                <label for="refund_method">Phương thức hoàn tiền <span class="text-danger">*</span></label>
                <select name="refund_method" id="refund_method" class="form-control @error('refund_method') is-invalid @enderror">
                    <option value="">Chọn phương thức hoàn tiền</option>
                    <option value="bank_transfer">Chuyển khoản ngân hàng</option>
                    <option value="cash">Tiền mặt</option>
                    <option value="store_credit">Tín dụng cửa hàng</option>
                </select>
                @error('refund_method')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>

            <div id="bank_details" style="display: none;">
                <div class="form-group">
                    <label for="bank_name">Tên ngân hàng</label>
                    <input type="text" name="bank_name" id="bank_name" class="form-control @error('bank_name') is-invalid @enderror">
                    @error('bank_name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>

                <div class="form-group">
                    <label for="bank_account">Số tài khoản</label>
                    <input type="text" name="bank_account" id="bank_account" class="form-control @error('bank_account') is-invalid @enderror">
                    @error('bank_account')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Gửi yêu cầu</button>
        </form>
    </div>
</div>
@endsection

@push('scripts')
<script>
    $(document).ready(function() {
        $('#refund_method').change(function() {
            if ($(this).val() === 'bank_transfer') {
                $('#bank_details').show();
            } else {
                $('#bank_details').hide();
            }
        });
    });
</script>
@endpush 