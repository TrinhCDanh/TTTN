@extends('user.master')
@section('description', 'Product Page')
@section('content')
  <section id="product" style="margin-top: 20px">
    <div class="container">
      <!-- Product Details-->
      <div class="row">
       <!-- Left Image-->
        <div class="col-lg-5">
          <ul class="thumbnails mainimage">
            <li>
              <a  rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4" class="thumbnail cloud-zoom" href="{!! asset('resources/uploads/'.$product_detail->image) !!}">
                <img src="{!! asset('resources/uploads/'.$product_detail->image) !!}" alt="" title="">
              </a>
            </li>
            @foreach($image as $item_img)
            <li>
              <a  rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4" class="thumbnail cloud-zoom" href="{!! asset('resources/uploads/detail/'.$item_img->image) !!}">
                <img  src="{!! asset('resources/uploads/detail/'.$item_img->image) !!}" alt="" title="">
              </a>
            </li>
            @endforeach

          </ul>
          <span>Mouse move on Image to zoom</span>
          <ul class="thumbnails mainimage">
            <li class="producthtumb">
              <a class="thumbnail" >
                <img  src="{!! asset('resources/uploads/'.$product_detail->image) !!}" alt="" title="">
              </a>
            </li>
            @foreach($image as $item_img)
            <li class="producthtumb">
              <a class="thumbnail" >
                <img  src="{!! asset('resources/uploads/detail/'.$item_img->image) !!}" alt="" title="">
              </a>
            </li>
            @endforeach

          </ul>
        </div>
         <!-- Right Details-->
        <div class="col-lg-7">
          <div class="row">
            <div class="col-lg-12">
              <h1 class="productname"><span class="bgnone">{!! $product_detail->name !!}</span></h1>
              <div class="productprice">
                <div class="productpageprice" style="font-size: 24px">
                  <span class="spiral" ></span>{!! number_format($product_detail->price,0,",",".") !!} <span>VNĐ {!! $product_detail->unit !!}</span></div>
                <!-- <ul class="rate">
                  <li class="on"></li>
                  <li class="on"></li>
                  <li class="on"></li>
                  <li class="off"></li>
                  <li class="off"></li>
                </ul> -->
              </div>
              <div class="productcontent">
                <div class="productintro">
                  <div class="well">
                    <b>{!! $product_detail->intro !!}</b>
                    <br>
                    {!! $product_detail->content !!}
                  </div>
                </div>
              </div>

              <ul class="productpagecart">
                <li><a class="cart" href="{!! url('mua-hang', [$product_detail->id, $product_detail->alias]) !!}">MUA HÀNG</a>
                </li>
                <li><a class="wish" href="#" >Yêu thích</a>
                </li>
                <li><a class="comare" href="#" >So sánh</a>
                </li>
              </ul>
         <!-- Product Description tab & comments-->
         <div class="productdesc">
                <ul class="nav nav-tabs" id="myTab">
                  <li class="active"><a href="#description">Mô tả</a>
                  </li>
                  <!-- <li><a href="#specification">Specification</a>
                  </li>
                  <li><a href="#review">Review</a>
                  </li> -->
                  <li><a href="#producttag">Tags</a>
                  </li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
                    {!! $product_detail->description !!}<br>
                  </div>
                  <!-- <div class="tab-pane " id="specification">
                    <ul class="productinfo">
                      <li>
                        <span class="productinfoleft"> Product Code:</span> Product 16 </li>
                      <li>
                        <span class="productinfoleft"> Reward Points:</span> 60 </li>
                      <li>
                        <span class="productinfoleft"> Availability: </span> In Stock </li>
                      <li>
                        <span class="productinfoleft"> Old Price: </span> $500.00 </li>
                      <li>
                        <span class="productinfoleft"> Ex Tax: </span> $500.00 </li>
                      <li>
                        <span class="productinfoleft"> Ex Tax: </span> $500.00 </li>
                      <li>
                        <span class="productinfoleft"> Product Code:</span> Product 16 </li>
                      <li>
                        <span class="productinfoleft"> Reward Points:</span> 60 </li>
                    </ul>
                  </div> -->
                  <!-- <div class="tab-pane" id="review">
                    <h3>Write a Review</h3>
                    <form class="form-vertical">
                      <fieldset>
                        <div class="control-group">
                          <label class="control-label">Text input</label>
                          <div class="controls">
                            <input type="text" class="col-lg-3">
                          </div>
                        </div>
                        <div class="control-group">
                          <label class="control-label">Textarea</label>
                          <div class="controls">
                            <textarea rows="3"  class="col-lg-3"></textarea>
                          </div>
                        </div>
                      </fieldset>
                      <input type="submit" class="btn btn-orange" value="continue">
                    </form>
                  </div> -->
                  <div class="tab-pane" id="producttag">
                    <p> Danh mục từ khóa <br>
                      <br>
                    </p>
                    <ul class="tags">
                      <li><a href="#"><i class="icon-tag"></i> {!! $product_detail->keywords !!}</a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--  Related Products-->
  <section id="related" class="row">
    <div class="container">
      <h1 class="heading1"><span class="maintext">Hàng cùng loại</span><span class="subtext"> See Our Most featured Products</span></h1>
      <ul class="thumbnails">
        @foreach($product_cate as $item_pro_cate)
        <li class="col-lg-3 col-sm-3">
          <a class="prdocutname" href="{{ URL('chi-tiet-san-pham', [$item_pro_cate->id, $item_pro_cate->alias]) }}">{!! $item_pro_cate->name !!}</a>
          <div class="thumbnail">
            <span class="sale tooltip-test">Sale</span>
            <a href="#"><img alt="" src="{!! asset('resources/uploads/'.$item_pro_cate->image) !!}"></a>
            <div class="shortlinks">
              <a class="details" href="#">DETAILS</a>
              <a class="wishlist" href="#">WISHLIST</a>
              <a class="compare" href="#">COMPARE</a>
            </div>
            <div class="pricetag">
              <span class="spiral"></span><a href="#" class="productcart">MUA HÀNG</a>
              <div class="price">
                <div class="pricenew">{!! $item_pro_cate->price !!}</div>
                <div class="priceold">$5000.00</div>
              </div>
            </div>
          </div>
        </li>
        @endforeach

      </ul>
    </div>
  </section>
  <!-- Popular Brands-->
  {{--  <section id="popularbrands" class="container">
    <h1 class="heading1"><span class="maintext">Popular Brands</span><span class="subtext"> See Our  Popular Brands</span></h1>
    <div class="brandcarousalrelative">
      <ul id="brandcarousal">
        <li><img src="img/brand1.jpg" alt="" title=""/></li>
        <li><img src="img/brand2.jpg" alt="" title=""/></li>
        <li><img src="img/brand3.jpg" alt="" title=""/></li>
        <li><img src="img/brand4.jpg" alt="" title=""/></li>
        <li><img src="img/brand1.jpg" alt="" title=""/></li>
        <li><img src="img/brand2.jpg" alt="" title=""/></li>
        <li><img src="img/brand3.jpg" alt="" title=""/></li>
        <li><img src="img/brand4.jpg" alt="" title=""/></li>
        <li><img src="img/brand1.jpg" alt="" title=""/></li>
        <li><img src="img/brand2.jpg" alt="" title=""/></li>
        <li><img src="img/brand3.jpg" alt="" title=""/></li>
        <li><img src="img/brand4.jpg" alt="" title=""/></li>
      </ul>
      <div class="clearfix"></div>
      <a id="prev" class="prev" href="#">&lt;</a>
      <a id="next" class="next" href="#">&gt;</a>
    </div>
  </section>  --}}
@endsection