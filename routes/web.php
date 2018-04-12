<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
	$product = DB::table('products')->select('id', 'name', 'image', 'price', 'alias')->orderBy('id', 'DESC')->skip(0)->take(4)->get();
	$product_rd = DB::table('products')->select('id', 'name', 'image', 'price', 'alias')->inRandomOrder()->limit(4)->get();
    return view('user.pages.home', compact('product', 'product_rd'));
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::group(['middleware' => 'web'], function() {
	Route::group(['prefix'=>'admin', 'middleware' => 'auth'], function() {
		Route::group(['prefix'=>'cate'], function() {
			// Quản lý loại hàng hóa
			Route::get('list', ['as'=>'admin.cate.list', 'uses'=>'CateController@getList']);
			Route::get('add', ['as'=>'admin.cate.getAdd', 'uses'=>'CateController@getAdd']);
			Route::post('add', ['as'=>'admin.cate.postAdd', 'uses'=>'CateController@postAdd']);
			Route::get('delete/{id}', ['as'=>'admin.cate.getDelete', 'uses'=>'CateController@getDelete']);
			Route::get('edit/{id}', ['as'=>'admin.cate.getEdit', 'uses'=>'CateController@getEdit']);
			Route::post('edit/{id}', ['as'=>'admin.cate.postEdit', 'uses'=>'CateController@postEdit']);
		});
		Route::group(['prefix'=>'product'], function() {
			// Quản lý thông tin hàng hóa
			Route::get('list', ['as'=>'admin.product.list', 'uses'=>'ProductController@getList']);
			Route::get('add', ['as'=>'admin.product.getAdd', 'uses'=>'ProductController@getAdd']);
			Route::post('add', ['as'=>'admin.product.postAdd', 'uses'=>'ProductController@postAdd']);
			Route::get('delete/{id}', ['as'=>'admin.product.getDelete', 'uses'=>'ProductController@getDelete']);
			Route::get('edit/{id}', ['as'=>'admin.product.getEdit', 'uses'=>'ProductController@getEdit']);
			Route::post('edit/{id}', ['as'=>'admin.product.postEdit', 'uses'=>'ProductController@postEdit']);
			Route::get('delimg/{id}', ['as'=>'admin.product.getDelImg', 'uses'=>'ProductController@getDelImg']);
		});
		Route::group(['prefix'=>'user'], function() {
			// Quản lý nhân viên
			Route::get('list', ['as'=>'admin.user.list', 'uses'=>'UserController@getList']);
			Route::get('add', ['as'=>'admin.user.getAdd', 'uses'=>'UserController@getAdd']);
			Route::post('add', ['as'=>'admin.user.postAdd', 'uses'=>'UserController@postAdd']);
			Route::get('delete/{id}', ['as'=>'admin.user.getDelete', 'uses'=>'UserController@getDelete']);
			Route::get('edit/{id}', ['as'=>'admin.user.getEdit', 'uses'=>'UserController@getEdit']);
			Route::post('edit/{id}', ['as'=>'admin.user.postEdit', 'uses'=>'UserController@postEdit']);
		});

        Route::group(['prefix'=>'manufacturer'], function() {
            Route::get('list', ['as'=>'admin.manufacturer.list', 'uses'=>'ManufacturerController@getList']);
            Route::get('add', ['as'=>'admin.manufacturer.getAdd', 'uses'=>'ManufacturerController@getAdd']);
            Route::post('add', ['as'=>'admin.manufacturer.postAdd', 'uses'=>'ManufacturerController@postAdd']);
            Route::get('delete/{id}', ['as'=>'admin.manufacturer.getDelete', 'uses'=>'ManufacturerController@getDelete']);
            Route::get('edit/{id}', ['as'=>'admin.manufacturer.getEdit', 'uses'=>'ManufacturerController@getEdit']);
            Route::post('edit/{id}', ['as'=>'admin.manufacturer.postEdit', 'uses'=>'ManufacturerController@postEdit']);
        });


		Route::group(['prefix'=>'bill'], function() {
			// Quản lý phiếu đặt hàng
			Route::get('list', ['as'=>'admin.bill.list', 'uses'=>'BillController@getList']);
			Route::get('view/{id}', ['as'=>'admin.bill.getView', 'uses'=>'BillController@getView']);
			Route::get('check-order/{id}', ['as'=>'admin.bill.checkorder', 'uses'=>'BillController@checkOrder']);

                Route::get('listbill', ['as'=>'admin.bill.listbill', 'uses'=>'DeliveryNoteController@getListBill']);

            Route::group(['prefix'=>'delivery-note'], function() {
                Route::get('list/{idBill}', ['as'=>'admin.bill.delivery-note.list', 'uses'=>'DeliveryNoteController@getList']);
                Route::get('add/{idBill}', ['as'=>'admin.bill.delivery-note.getAdd', 'uses'=>'DeliveryNoteController@getAdd']);
                Route::post('add', ['as'=>'admin.bill.delivery-note.postAdd', 'uses'=>'DeliveryNoteController@postAdd']);

                Route::get('detail/{idDeliveryNote}', ['as'=>'admin.bill.delivery-note.getDetail', 'uses'=>'DeliveryNoteController@getDetail']);

                Route::get('delete/{id}', ['as'=>'admin.bill.delivery-note.getDelete', 'uses'=>'DeliveryNoteController@getDelete']);
                Route::get('edit/{id}', ['as'=>'admin.bill.delivery-note.getEdit', 'uses'=>'DeliveryNoteController@getEdit']);
                Route::post('edit/{id}', ['as'=>'admin.bill.delivery-note.postEdit', 'uses'=>'DeliveryNoteController@postEdit']);


            });
		});
		Route::group(['prefix'=>'customer'], function() {
			// Quản lý khách hàng
			Route::get('list', ['as'=>'admin.customer.list', 'uses'=>'CustomerController@getList']);
			Route::get('view/{id}', ['as'=>'admin.customer.getView', 'uses'=>'CustomerController@getView']);
		});
	});
});

/*Route::group(['prefix'=>'auth'], function() {
	Route::get('login', ['as' => 'auth.login.getLogin', 'uses' => 'Auth\LoginController@getLogin']);
	Route::post('login', ['as' => 'auth.login.postLogin', 'uses' => 'Auth\LoginController@postLogin']);
});*/

Route::get('loai-san-pham/{id}/{tenloai}', ['as'=>'loaisanpham', 'uses'=>'ShowController@loaisanpham']);
Route::get('chi-tiet-san-pham/{id}/{tensanpham}', ['as'=>'chitietsanpham', 'uses'=>'ShowController@chitietsanpham']);

// Dang loi
Route::get('lien-he', ['as'=>'getLienhe', 'uses'=>'ShowController@getLienhe']);
Route::post('lien-he', ['as'=>'postLienhe', 'uses'=>'ShowController@postLienhe']);


// Quản lý đặt hàng
Route::get('mua-hang/{id}/{tensanpham}', ['as'=>'muahang', 'uses'=>'DathangController@muahang']);
Route::get('gio-hang', ['as'=>'giohang', 'uses'=>'DathangController@giohang']);
Route::get('xoa-san-pham/{id}', ['as'=>'xoasanpham', 'uses'=>'DathangController@xoasanpham']);
Route::get('cap-nhat/{id}/{qty}', ['as'=>'capnhat', 'uses'=>'DathangController@capnhat']);
Route::get('dat-hang', ['as'=>'dathang', 'uses'=>'DathangController@dathang']);
Route::post('mua-hang', ['as'=>'muahang', 'uses'=>'BillController@saveBill']);
//Route::get('loai-san-pham/{id}/{tenloai}', ['as'=>'loaisanpham', 'uses'=>'HomeController@loaisanpham']);

Route::post('tim-kiem', ['as'=>'timkiem', 'uses'=>'ShowController@timkiem']);
Route::get('gioi-thieu', ['as'=>'gioithieu', function() {
	return view('user.pages.about');
}]);




