@extends('admin.master')
@section('controller', 'Quản lý thông tin khách hàng')
@section('action', 'Danh sách')
@section('content')
<!-- /.col-lg-12 -->
<table class="table table-striped table-bordered table-hover" id="dataTables-example">
    <thead>
        <tr align="center">
            <th>ID</th>
            <th>Tên khách hàng</th>
            <th>Email</th>
            <th>Giới tính</th>
            <th>Xem</th>
        </tr>
    </thead>
    <tbody>
        <?php $i = 1; ?>
        @foreach($data as $item)
        <tr>
            <td>{!! $i !!}</td>
            <td>{!! $item["name"] !!}</td>
            <td>{!! $item["email"] !!}</td>
            <td>{{ $item['gender']==0  ? 'Nữ' : 'Nam' }}</td>
            <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{!! URL::route('admin.customer.getView', $item['id']) !!}">View</a></td>
        </tr>
        <?php $i++; ?>
        @endforeach
    </tbody>
</table>

@endsection()
