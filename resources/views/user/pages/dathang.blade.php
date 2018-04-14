@extends('user.master')
@section('description', 'Checkout')
@section('content')
  <section id="product">
    <div class="container">
    <!--  breadcrumb -->
      <ul class="breadcrumb">
        <li>
          <a href="{{ URL('/') }}"">Trang chủ</a>
          <span class="divider">/</span>
        </li>
        <li class="active">Đặt hàng</li>
      </ul>
      <div class="row">
        <!-- Account Login-->
        <div class="col-lg-9">
          <h1 class="heading1"><span class="maintext">Đặt hàng</span><span class="subtext">Vui lòng thực hiện các bước sau</span></h1>
          <div class="thong-bao">
            @if (Session::has('flash_message'))
                <div class="alert alert-{!! Session::get('level_message') !!}">
                    {!! Session::get('flash_message') !!}
                </div>
            @endif
          </div>
          <div class="checkoutsteptitle">Bước 1: Xác nhận đơn hàng<a class="modify">Modify</a>
          </div>
          <div class="checkoutstep">
            <div class="cart-info">
              <table class="table table-striped table-bordered">
                <tr>
                  <th class="image">Hình</th>
                  <th class="name">Tên hàng hóa</th>
                  <th class="quantity">Số lượng</th>
                  {{-- <th class="action">Action</th> --}}
                  <th class="price">Giá</th>
                  <th class="total">Tổng</th>
                </tr>
                <form method="POST" action="">
                  <input type="hidden" name="_token" value="{!! csrf_token() !!}" >
                    @foreach($content as $item)
                    <tr>
                      <td class="image"><a href="#"><img title="product" alt="product" src="{!! asset('resources/uploads/'.$item['options']['img']) !!}" height="50" width="50"></a></td>
                      <td  class="name"><a href="#">{!! $item["name"] !!}</a></td>
                      <td class="quantity" style="text-align: center;">{{-- <input class="col-lg-1 qty" type="text" size="1" value="{!! $item['qty'] !!}" name="quantity[40]"> --}}{!! $item['qty'] !!}

                       </td>
                       {{-- <td class="total">
                          <a href="#" class="updatecart" id="{!! $item['rowId'] !!}">
                              <img class="tooltip-test" data-original-title="Update" src="{!! asset('public/user/img/update.png')!!}" alt="">
                          </a>
                          <a href="{!! url('xoa-san-pham', $item['rowId']) !!}">
                              <img class="tooltip-test" data-original-title="Remove"  src="{!! asset('public/user/img/remove.png')!!}" alt="">
                          </a>
                      </td> --}}


                      <td class="price">{!! number_format($item["price"],0,",",".") !!}</td>
                      <td class="total">{!! number_format($item["price"]*$item["qty"],0,",",".") !!}</td>

                    </tr>
                    @endforeach
                </form>
              </table>
            </div>
            <div class="row">

                <div class="col-lg-4 pull-right">
                  <table class="table table-striped table-bordered ">
                    <tbody>
                      <tr>
                        <td><span class="extra bold">VAT (17.5%) :</span></td>
                        <td><span class="bold">{{$tax}}</span></td>
                      </tr>
                      <tr>
                        <td><span class="extra bold totalamout">Tổng cộng :</span></td>
                        <td><span class="bold totalamout">{{$total}}</span></td>
                      </tr>
                    </tbody>
                  </table>
                <a href="{{ url('/') }}" type="submit" class="btn btn-orange pull-right mr10">Tiếp tục mua hàng</a>
                </div>

            </div>
          </div>
          <div class="checkoutsteptitle">Bước 2: Nhập thông tin<a class="modify">Modify</a>
          </div>
          <div class="checkoutstep">
            <div class="row">
              <form class="form-horizontal" action="{!! route('muahang') !!}" method="POST">
                <input type="hidden" name="_token" value="{!! csrf_token() !!}" >
                <fieldset>
                  <div class="col-lg-6">
                    <div class="control-group">
                      <label class="control-label" >Tên<span class="red">*</span></label>
                      <div class="controls">
                        <input type="text" value="" name="txtName" required>
                      </div>
                    </div>
                    <div class="control-group" style="margin: 15px 0">
                      <label class="control-label">Giới tính<span class="red">*</span></label>
                      <div class="controls">
                        <label class="radio-inline">
                            <input name="rdoGender" value="0" checked="" type="radio">Nữ
                        </label>
                        <label class="radio-inline">
                            <input name="rdoGender" value="1" type="radio">Nam
                        </label>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" >E-Mail<span class="red">*</span></label>
                      <div class="controls">
                        <input type="email" value="" name="txtEmail" required>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" >Địa chỉ<span class="red">*</span></label>
                      <div class="controls">
                        <input type="text" value="" name="txtAddress" required>
                      </div>
                    </div>
                    <div class="control-group">
                      <label class="control-label" >SĐT<span class="red">*</span></label>
                      <div class="controls">
                        <input type="text" value="" name="txtPhone" required>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="control-group">
                      <label class="control-label" >Ghi chú (nếu có)</label>
                      <div class="controls">
                        <textarea name="txtNote" id="" cols="30" rows="10"></textarea>
                      </div>
                    </div>
                    {{-- <div class="control-group" style="margin: 15px 0">
                      <label class="control-label">Payment<span class="red">*</span></label>
                      <div class="controls">
                        <label class="radio-inline">
                            <input name="rdoGender" value="0" checked="" type="radio">COD
                        </label>
                        <label class="radio-inline">
                            <input name="rdoGender" value="1" type="radio">Tiền mặt
                        </label>
                      </div>
                    </div> --}}
                  </div>
                </fieldset>
                <button type="submit" class="btn btn-orange pull-right">Đặt hàng</button>
              </form>
            </div>

          </div>

        </div>
        <!-- Sidebar Start-->
        <div class="col-lg-3">
          <aside>
            <div class="sidewidt">
              <h2 class="heading2"><span>Các bước đặt hàng</span></h2>
              <ul class="nav nav-list categories">
                <li>
                  <a href="#">Xác nhận đơn hàng</a>
                </li>
                <li>
                  <a href="#">Nhập thông tin</a>
                </li>
              </ul>
            </div>
          </aside>
        </div>
        <!-- Sidebar End-->
      </div>
    </div>
  </section>
@endsection