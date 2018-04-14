<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeliveryNote extends Model
{
    protected $table = 'delivery_notes';
    protected $fillable = ['id', 'recipient_address', 'recipient_name', 'phone_number', 'note','created_by','bill_id', 'customer_id'];

    public function bill() {
        return $this->belongsTo('App\Bill','bill_id','id');
    }

    public function user() {
        return $this->belongsTo('App\User','customer_id','id'); // this is my comment
    }

    public function DeliveryNoteDetails() {
        return $this->hasMany('App\DeliveryNoteDetail','delivery_notes_id','id'); // this is my comment
    }

}
