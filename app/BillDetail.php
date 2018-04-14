<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BillDetail extends Model
{
    protected $table = 'bill_details';
    protected $fillable = ['id', 'product_id', 'bill_id', 'quantity', 'unit_price'];

    public function product() {
    	return $this->belongsTo('App\Product');
    }

    public function bill() {
    	return $this->belongsTo('App\Bill','bill_id','id');
    }
}
