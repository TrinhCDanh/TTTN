@extends('admin.master')
@section('controller', 'Quản lý thông tin khách hàng')
@section('action', 'View')
@section('content')
<!-- /.col-lg-12 -->
<div class="col-lg-12" style="padding-bottom:20px">
    <h3>Thông tin khách hàng</h3>
    <table class="table table-bordered">
        <tr>
            <th>Tên khách hàng:</th>
            <td>{{ $customer['name'] }}</td>
        </tr>
        <tr>
            <th>Giới tính:</th>
            <td>{{ $customer['gender']==0  ? 'Nữ' : 'Nam' }}</td>
        </tr>
        <tr>
            <th>Email:</th>
            <td>{{ $customer['email'] }}</td>
        </tr>
        <tr>
            <th>Địa chỉ giao hàng:</th>
            <td>{{ $customer['address'] }}</td>
        </tr>
        <tr>
            <th>Điện thoại:</th>
            <td>{{ $customer['phone'] }}</td>
        </tr>
    </table>
</div>
@endsection()