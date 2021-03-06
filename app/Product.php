<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'products';
    protected $fillable = ['name', 'alias', 'price', 'unit', 'intro', 'content', 'image', 'keywords', 'description', 'user_id', 'cate_id','manufacturer_id'];

    //public $timestamps = false;

    public function cate() {
    	return $this->belongsTo('App\Cate');
    }

    public function user() {
    	return $this->belongsTo('App\User');
    }

    public function pimages() {
    	return $this->hasMany('App\ProductImages');
    }

    public function bill_detail() {
    	return $this->hasMany('App\BillDetail');
    }

    public function DeliveryNoteDetails() {
        return $this->hasMany('App\DeliveryNoteDetail','product_id','id');
    }

    public function Manufacturer(){
        return $this->belongsTo('App\Manufacturer','manufacturer_id','id');
    }
}
