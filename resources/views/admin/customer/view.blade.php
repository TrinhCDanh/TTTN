@extends('admin.master')
@section('controller', 'Customer')
@section('action', 'View')
@section('content')
<!-- /.col-lg-12 -->
<div class="col-lg-12" style="padding-bottom:20px">
    <h3>Customer Infomation</h3>
    <table class="table table-bordered">
        <tr>
            <th>Name:</th>
            <td>{{ $customer['name'] }}</td>
        </tr>
        <tr>
            <th>Gender:</th>
            <td>{{ $customer['gender']==0  ? 'Famale' : 'Male' }}</td>
        </tr>
        <tr>
            <th>Email:</th>
            <td>{{ $customer['email'] }}</td>
        </tr>
        <tr>
            <th>Address:</th>
            <td>{{ $customer['address'] }}</td>
        </tr>
        <tr>
            <th>Phone:</th>
            <td>{{ $customer['phone'] }}</td>
        </tr>
    </table>
</div>
@endsection()