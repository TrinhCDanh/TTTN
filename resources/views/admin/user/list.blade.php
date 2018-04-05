@extends('admin.master')
@section('controller', 'User')
@section('action', 'List')
@section('content')
<!-- /.col-lg-12 -->
<table class="table table-striped table-bordered table-hover" id="dataTables-example">
    <thead>
        <tr align="center">
            <th>ID</th>
            <th>Họ Tên</th>
            <th>Email</th>
            <!-- <th>Level</th> -->
            <th>Xóa</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        <?php $i = 1; ?>
        @foreach($user as $item_user)
        @if($item_user['id']!=Auth::user()->id)
        <tr class="odd gradeX" align="center">
            <td>{!! $i !!}</td>
            <td>{!! $item_user['username'] !!}</td>
            <td>{!! $item_user['email'] !!}</td>
            
            <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="{!! URL::route('admin.user.getDelete', $item_user['id']) !!}"> Xóa</a></td>
            <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{!! URL::route('admin.user.getEdit', $item_user['id']) !!}">Sửa</a></td>
        </tr>
        <?php $i++; ?>
        @endif
        @endforeach
    </tbody>
</table>
@endsection()
