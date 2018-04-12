<?php
/**
 * Created by PhpStorm.
 * User: Thai Duc
 * Date: 05-Apr-18
 * Time: 11:38 PM
 */
?>

@extends('admin.master')
@section('content')
    <div class="row">
        <div class="col-md-12">
            <h2>Danh sách đơn đặt hàng</h2>
        </div>
    </div>
    <hr/>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Danh sách đơn đặt hàng
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <td>ID</td>
                                <td>Người đặt</td>
                                <td>Ngày đặt</td>
                                <td>Tổng tiền</td>
                                <td>Trạng thái</td>
                                <td>Xóa</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($bills as $item)
                                <tr>
                                    <td><a href="{{route('admin.bill.delivery-note.list',$item->id)}}">{{$item->id}}</a>
                                    </td>
                                    <td><a href="{{route('admin.bill.delivery-note.list',$item->id)}}">{{$item->customer->name }}</a>
                                    </td>
                                    <td>{{$item->date_order}}</td>
                                    <td>{{$item->total}}</td>
                                    <td>{{ ($item->check_order == 1) ? 'Đã nhận' : 'Chưa' }}</td>
                                    <td><a onclick="return confirmDelete('Bạn có chắc muốn xóa không?');"
                                           href="{{route('admin.manufacturer.getDelete',$item->id)}}">Xóa</a></td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection