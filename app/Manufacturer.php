<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Manufacturer extends Model
{
    protected $table = 'manufacturers';
    protected $fillable = ['id', 'phone_number', 'address', 'name'];

    public function Product() {
        return $this->hasMany('App\Product','manufacturer_id','id');
    }

}
