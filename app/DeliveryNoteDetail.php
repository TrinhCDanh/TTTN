<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DeliveryNoteDetail extends Model
{
    protected $table = 'delivery_note_details';
    protected $fillable = ['id', 'quantity', 'unit', 'product_id', 'delivery_notes_id'];

    public function Product() {
        return $this->belongsTo('App\Product','product_id','id');
    }

    public function DeliveryNote() {
        return $this->belongsTo('App\DeliveryNote','delivery_notes_id','id');
    }
}
