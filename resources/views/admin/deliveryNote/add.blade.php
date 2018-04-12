
@extends('admin.master')
@section('content')


<div class="row">
    <div class="col-md-10">
        <h2>Thêm phiếu giao hàng cho đơn hàng {{$bill->name}}</h2>
    </div>
</div>
<hr>

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 ">
        @include('admin.blocks.error')
        <div class="panel-body">
            <form action="{{route('admin.bill.delivery-note.postAdd')}}" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="_token" value="{!! csrf_token() !!}">

                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>Tên sản phẩm</td>
                            <td>Giá</td>
                            <td>Số lượng sản phẩm đặt</td>
                            <td>Số lượng sản phẩm đã giao</td>
                            <td>Số lượng sản phẩm còn thiếu</td>
                            <td>Giao</td>
                            <td>Số lượng giao lần này</td>
                            {{--<td>Xóa</td>--}}
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($products as $item)
                            <tr>
                                <td><a href="{{route('admin.bill.delivery-note.list',$item->id)}}">{{$item->id}}</a>
                                </td>
                                <td><a href="{{route('admin.bill.delivery-note.list',$item->name)}}">{{$item->name }}</a></td>
                                <td>{{$item->price}}</td>
                                <td>{{$item->totalquantity}}</td>
                                <td>{{$item->quantity}}</td>
                                <td>{{$item->shortage}}</td>
                                <td><input type="checkbox" id="{{$item->id}}"></td>
                                <td><input type="number" disabled></td>
                                {{--<td><a onclick="return confirmDelete('Bạn có chắc muốn xóa không?');"href="{{route('admin.manufacturer.getDelete',$item->id)}}">Xóa</a></td>--}}
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <button type="submit" name="btnAdd" class="btn btn-default"> Thêm</button>
                <button type="reset" class="btn btn-default">Làm mới</button>
            </form>
        </div>
    </div>
</div>
@endsection

@section('sub-javascript')

@endsection