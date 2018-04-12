
@extends('admin.master');
@section('content')
<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
        <h2>Sửa thông tin nhà sản xuất</h2>
    </div>
</div>
<hr>

<div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10 col-sm-12 col-xs-12 ">
        @include('admin.blocks.error')
        <div class="panel-body">
            <form action="{{route('admin.manufacturer.getEdit',$manufacturer->id)}}" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                <div class="form-group">
                    <label>Tên nhà sản xuất</label>
                    <input style="height: auto" value="{!! old('txtName',isset($manufacturer)? $manufacturer->name : "") !!}" type="text" class="form-control" name="txtName" />
                </div>
                <div class="form-group">
                    <label>Địa chỉ</label>
                    <input style="height: auto" value="{!! old('txtName',isset($manufacturer)? $manufacturer->address : "") !!}" type="text" class="form-control" name="txtAddress" />
                </div>
                <div class="form-group">
                    <label> Số điện thoại</label>
                    <input style="height: auto" value="{!! old('txtName',isset($manufacturer)? $manufacturer->phone_number : "") !!}" type="text" class="form-control" name="txtPhoneNumber" />
                </div>
                <button type="submit" name="btnEdit" class="btn btn-default"> Sửa</button>
            </form>
        </div>
    </div>
</div>


@endsection