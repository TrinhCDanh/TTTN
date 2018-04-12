<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;
use DB, Mail, Cart, Request;
use App\Product;

class DathangController extends Controller
{
    // Khách hàng thêm sản phẩm vào giỏ hàng
    public function muahang($id) {
        $product_buy = DB::table('products')->where('id', $id)->first();
        Cart::add(['id'=>$id, 'name'=>$product_buy->name, 'qty'=>1, 'price'=>$product_buy->price, 'options'=> ['img'=>$product_buy->image]]);
        return redirect()->route('giohang');
    }

    // Khách hàng xem giỏ hàng của mình hiện có những sản phẩm nào
    public function giohang() {
        $content = Cart::content()->toArray();
        $total = Cart::total();
        return view('user.pages.giohang', compact('content', 'total'));
    }

    // Xóa sản phẩm ra khỏi giỏ hàng
    public function xoasanpham($id) {
        Cart::remove($id);
        return redirect()->route('giohang');
    }

    // Cập nhật lại số lượng sản phẩm cần mua
    public function capnhat() {
        if (Request::ajax()) {
            $id = Request::get('id');
            $qty = Request::get('qty');
            Cart::update($id, $qty);
            echo "oke";
        }
    }

    // Xem lại sản phẩm trong giỏ hàng và nhập thông tin trước khi đặt mua
    public function dathang() {
        $content = Cart::content()->toArray();
        $total = Cart::total();
        $tax = Cart::tax();
        return view('user.pages.dathang', compact('content', 'total', 'tax'));
    }
}
