@extends('admin.master')
@section('content')
    <div class="row">
        <div class="col-md-12">
            <h2>Danh sách nhà sản xuất</h2>
            <h5>Danh sách nhà sản xuất, xoá, sửa nhà sản xuất... </h5>

        </div>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    Danh sách nhà sản xuất.
                </div>
                <div class="panel-body">
                    <div class="table-responsive">

                        <!-- DO DL vao day  -->
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <td>Mã NSX</td>
                                <td>Tên </td>
                                <td>Địa chỉ</td>
                                <td>Số điện thoại</td>
                                <td>Xóa</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($manufacturers as $item)
                                <tr>
                                    <td><a href="{{route('admin.manufacturer.getEdit',$item->id)}}" >{{$item->id}}</a></td>
                                    <td><a href="{{route('admin.manufacturer.getEdit',$item->id)}}" >{{$item->name}}</a></td>
                                    <td>{{$item->address}}</td>
                                    <td>{{$item->phone_number}}</td>
                                    <td><a onclick="return confirmDelete('Bạn có chắc muốn xóa không?');" href="{{route('admin.manufacturer.getDelete',$item->id)}}">Xóa</a></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                        <!-- /. het thuc do DL  -->
                    </div>
                </div>
            </div>
            <!--End Advanced Tables -->
        </div>
    </div>
    <!-- /. ROW  -->
@endsection