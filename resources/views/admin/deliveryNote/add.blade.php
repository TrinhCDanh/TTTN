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
                <form action="{{route('admin.bill.delivery-note.postAdd',$bill->id)}}" method="POST"
                      enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Địa chỉ người nhận</label>
                                <input class="form-control" name="recipient_address" required
                                       value="{!! old('recipient_address') !!}"/>
                            </div>
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input class="form-control" name="phone_number" required
                                       value="{!! old('phone_number') !!}"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tên người nhận</label>
                                <input class="form-control" name="recipient_name" required
                                       value="{!! old('recipient_name') !!}"/>
                            </div>
                            <div class="form-group">
                                <label>Ghi chú</label>
                                <input class="form-control" name="note" value="{!! old('note') !!}"/>
                            </div>
                        </div>
                    </div>
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
                                <td>Số lượng giao lần này</td>
                                {{--<td>Xóa</td>--}}
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($bill->bill as $item)
                                @php $quantityDagiao = \App\Http\Controllers\DeliveryNoteController::getNumofProductDaGiao($item->product->id,$bill->id); @endphp
                                <tr>
                                    <td>
                                        <a href="{{route('admin.bill.delivery-note.list',$item->id)}}">{{$item->product->id}}</a>
                                    </td>
                                    <td>
                                        <a href="{{route('admin.bill.delivery-note.list',$item->name)}}">{{$item->product->name }}</a>
                                    </td>
                                    <td>{{$item->product->price}}</td>
                                    <td>{{ $item->quantity }}</td>
                                    <td>{{$quantityDagiao or 0 }}</td>
                                    <td>{{ $item->quantity - $quantityDagiao}}</td>
                                    <td>
                                        @if($item->quantity - $quantityDagiao > 0)
                                            <input min="0" max="{{ $item->quantity - $quantityDagiao }}" type="number"
                                                   name="quantity[]">
                                            <input type="hidden" name="productId[]" value="{{$item->product->id}}">
                                        @endif
                                    </td>
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
