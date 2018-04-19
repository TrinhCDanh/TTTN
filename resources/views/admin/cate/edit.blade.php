@extends('admin.master')
@section('controller', 'Loại hàng hóa')
@section('action', 'Cập nhật loại hàng hóa')
@section('content')
<!-- /.col-lg-12 -->
<div class="col-lg-7" style="padding-bottom:120px">
    @include('admin.blocks.error')
    <form action="{!! route('admin.cate.postEdit', $data['id']) !!}" method="POST">
        <input type="hidden" name="_token" value="{!! csrf_token() !!}" >
        <div class="form-group">
            <label>Category Parent</label>
            <select class="form-control" name="sltParent">
                <option value="0">Please Choose Category</option>
                <?php cate_parent($parent,0,"",$data["parent_id"]); ?>
            </select>
        </div>
        <div class="form-group">
            <label>Tên loại hàng</label>
            <input class="form-control" name="txtCateName" placeholder="Please Enter Category Name" value="{!! old('txtCateName', isset($data) ? $data['name'] : null) !!}" />
        </div>
        <div class="form-group">
            <label>Order</label>
            <input class="form-control" name="txtOrder" placeholder="Please Enter Category Order" value="{!! old('txtOrder', isset($data) ? $data['order'] : null) !!}"/>
        </div>
        <div class="form-group">
            <label>Từ khóa</label>
            <input class="form-control" name="txtKeywords" placeholder="Please Enter Category Keywords" value="{!! old('txtKeywords', isset($data) ? $data['keywords'] : null) !!}"/>
        </div>
        <div class="form-group">
            <label>Mô tả</label>
            <textarea class="form-control" name="txtDescription" rows="3">{!! old('txtDescription', isset($data) ? $data['description'] : null) !!}</textarea>
        </div>
        <button type="submit" class="btn btn-default">Category Edit</button>
        <button type="reset" class="btn btn-default">Reset</button>
    <form>
</div>
@endsection()