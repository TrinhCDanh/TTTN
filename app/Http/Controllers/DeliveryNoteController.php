<?php
/**
 * Created by PhpStorm.
 * User: Thai Duc
 * Date: 06-Apr-18
 * Time: 12:03 AM
 */

namespace App\Http\Controllers;

use App\Bill;
use App\DeliveryNote;
use App\Http\Requests\ProductRequest;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class DeliveryNoteController extends Controller
{
    public function getListBill()
    {
        $bills = Bill::all();
        return view('admin.deliveryNote.listbill',compact('bills'));
    }

    public function getList($idBill){
        $deliveryNotes = DeliveryNote::where('bill_id',$idBill)->get();
        $bill = Bill::find($idBill);
        return view('admin.deliveryNote.delivery-notes',compact('deliveryNotes','bill'));
    }

    public function getAdd($idBill){
        $bill = Bill::find($idBill);
        $products = DB::select("		
            SELECT p.*, bd.quantity as totalquantity, dnd.quantity, (bd.quantity - dnd.quantity) as shortage
            FROM bills b
            LEFT JOIN bill_details bd ON b.id = bd.bill_id
            LEFT JOIN products p ON bd.product_id = p.id
            LEFT JOIN delivery_note_details dnd ON p.id = dnd.product_id
            WHERE b.id = ? ", [$idBill]);
        return view('admin.deliveryNote.add',compact('bill','products'));
    }

    public function getDetail($idDeliveryNote){
        $products = DB::select("		
            select p.name,p.price , dn.recipient_address, dn.recipient_name , dn.id,dn.phone_number
            from delivery_notes dn
            left join delivery_note_details dnd on dn.id = dnd.delivery_notes_id
            left join products p on p.id = dnd.product_id
            where dn.id = ? ", [$idDeliveryNote]);
        return view('admin.deliveryNote.detail',compact('products'));
    }
}