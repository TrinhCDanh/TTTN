<?php
/**
 * Created by PhpStorm.
 * User: Thai Duc
 * Date: 06-Apr-18
 * Time: 12:08 AM
 */
?>

@extends('admin.master')
@section('content')
        <div class="row">
            <div class="col-md-8">
                    <h2>Danh sách phiếu giao hàng của khách hàng : {{$bill->customer->name}} </h2>
                <h4> ID phiếu giao hàng : {{$bill->id}}</h4>
                <h4> Tổng giá trị phiếu giao hàng : {{ $bill->total }} đ</h4>
                <h4>Ghi chú {{ $bill->note }}</h4>
                <h4>Trạng thái: {{ (empty($bill->check_order)) ? "Đã nhận" : "Chưa"}}</h4>

            </div>
            <div class="col-md-4">
                <h3><a href="{{URL::route('admin.bill.listbill')}}"> <<< Trở lại danh sách đơn hàng </a></h3>
            </div>
        </div>
        <hr/>
{{--        <form action="{{route('admin.cart.getBillDetail',$deliveryNotes['0']->billID)}}" method="POST">--}}
            {{--<input type="hidden" name="_token" value="{!! csrf_token() !!}">--}}
            {{--<input type="hidden" name="billID" value="{{$deliveryNotes['0']->billID}}">--}}
            <div class="row">
                <div class="col-md-11 col-sm-12 col-xs-12">
                @include('admin.blocks.error')
                <!-- Advanced Tables -->
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th style="text-align: center">ID</th>
                                    <th style="text-align: center">Tên người nhận</th>
                                    <th style="text-align: center">Địa chỉ</th>
                                    {{--<th style="text-align: center">Hình ảnh sản phẩmn</th>--}}
                                    <th style="text-align: center">SĐT</th>
                                    <th style="text-align: center">Ngày giao</th>
                                    <th>Xem chi tiet</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($deliveryNotes as $item)
                                    <tr>
                                        <td>{{$item->id}}</td>
                                        <td>{{$item->recipient_name}}</td>
                                        <td>{{$item->recipient_address}}</td>
                                        <td>{{$item->phone_number}}</td>
                                        <td>{{$item->created_at}}</td>
                                        <td><a href="{{URL::route('admin.bill.delivery-note.getDetail',$item->id)}}">Chi tiết</a></td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!--End Advanced Tables -->
                    </div>
                </div>
            </div>
        {{--</form>--}}
        <a href="{{URL::route('admin.bill.delivery-note.getAdd',$bill->id)}}">  Thêm phiếu giao hàng mới cho đơn hàng</a>

@endsection
