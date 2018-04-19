@extends('admin.master')
@section('controller', 'Loại hàng hóa')
@section('action', 'List')
@section('content')
<!-- /.col-lg-12 -->
<table class="table table-striped table-bordered table-hover" id="dataTables-example">
    <thead>
        <tr align="center">
            <th>ID</th>
            <th>Tên loại</th>
            <th>Category Parent</th>
            <th>Xóa</th>
            <th>Sửa</th>
        </tr>
    </thead>
    <tbody>
        <?php $i = 1; ?>
        @foreach($data as $item)
        <tr class="odd gradeX" align="center">
            <td>{!! $i !!}</td>
            <td>{!! $item["name"] !!}</td>
            <td>
                <?php
                    if ($item["parent_id"] == 0)
                        echo "None";
                    else {
                       $parent = DB::table('cates')->where('id', $item["parent_id"])->first();
                        echo $parent->name;
                    }
                ?>
            </td>
            <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a onclick="return xacnhanxoa('are you sure')" href="{!! URL::route('admin.cate.getDelete', $item['id']) !!}"> Delete</a></td>
            <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{!! URL::route('admin.cate.getEdit', $item['id']) !!}">Edit</a></td>
        </tr>
        <?php $i++; ?>
        @endforeach
    </tbody>
</table>

@endsection()
