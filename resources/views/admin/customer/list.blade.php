@extends('admin.master')
@section('controller', 'Customer')
@section('action', 'List')
@section('content')
<!-- /.col-lg-12 -->
<table class="table table-striped table-bordered table-hover" id="dataTables-example">
    <thead>
        <tr align="center">
            <th>ID</th>
            <th>Customer name</th>
            <th>Customer email</th>
            <th>Gender</th>
            <th>View</th>
        </tr>
    </thead>
    <tbody>
        <?php $i = 1; ?>
        @foreach($data as $item)
        <tr>
            <td>{!! $i !!}</td>
            <td>{!! $item["name"] !!}</td>
            <td>{!! $item["email"] !!}</td>
            <td>{{ $item['gender']==0  ? 'Famale' : 'Male' }}</td>
            <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{!! URL::route('admin.customer.getView', $item['id']) !!}">View</a></td>
        </tr>
        <?php $i++; ?>
        @endforeach
    </tbody>
</table>

@endsection()
