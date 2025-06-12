@extends('frontend.layouts.master')

@section('title','Thanh toán MoMo')

@section('main-content')
<div class="container text-center" style="padding:40px 0;">
    <h2>Đang chuyển hướng đến trang thanh toán MoMo...</h2>
    <p>Nếu không được chuyển tự động, vui lòng <a id="momo-link" href="#">bấm vào đây</a>.</p>
</div>
<script>
    var phone = @json(config('momo.phone', env('MOMO_PHONE', '0901234567')));
    var amount = @json($amount);
    var order_code = @json($order_code);
    var momoUrl = `https://nhantien.momo.vn/${phone}?amount=${amount}&comment=${order_code}`;
    document.getElementById('momo-link').href = momoUrl;
    setTimeout(function(){ window.location.href = momoUrl; }, 1000);
</script>
@endsection 