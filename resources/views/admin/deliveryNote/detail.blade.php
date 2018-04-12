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
        <h2>Chi tiết phiếu giao hàng {{ $products['0']->id }}</h2>
    </div>
    <div class="col-md-12">
        <p>Người nhận : {{ $products['0']->recipient_name }}</p>
        <p>Nơi nhận : {{ $products['0']->recipient_address }}</p>
        <p>Số điện thoại : {{ $products['0']->phone_number }}</p>
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
                            {{--<td>Xóa</td>--}}
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($products as $item)
                            <tr>
                                <td>{{$item->id}}</td>
                                <td>{{$item->name }}</td>
                                <td>{{$item->price}}</td>
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
@endsection