<?php
/**
 * Created by PhpStorm.
 * User: Thai Duc
 * Date: 06-Apr-18
 * Time: 1:44 AM
 */
?>
@extends('admin.master')
@section('content')

<div class="row">
    <div class="col-md-12">
        <h2>Chi tiết phiếu giao hàng {{ $deliveryNote->id }}</h2>
    </div>
    <div class="col-md-12">
        <p>Người nhận : {{ $deliveryNote->recipient_name }}</p>
        <p>Nơi nhận : {{ $deliveryNote->recipient_address }}</p>
        <p>Số điện thoại : {{ $deliveryNote->phone_number }}   </p>
    </div>
</div>
<hr>

<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12 ">
        @include('admin.blocks.error')
        <div class="panel-body">
            <form action="" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="_token" value="{!! csrf_token() !!}">

                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                        <tr>
                            <td>ID</td>
                            <td>Tên sản phẩm</td>
                            <td>Giá</td>
                            <td>số lượng</td>
                            {{--<td>Xóa</td>--}}
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($deliveryNote->DeliveryNoteDetails as $item)
                            <tr>
                                <td>{{$item->product->id}}</td>
                                <td>{{$item->product->name }}</td>
                                <td>{{$item->product->price}}</td>
                                <td>{{$item->quantity}}</td>
                                {{--<td><a onclick="return confirmDelete('Bạn có chắc muốn xóa không?');"href="{{route('admin.manufacturer.getDelete',$item->id)}}">Xóa</a></td>--}}
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection  