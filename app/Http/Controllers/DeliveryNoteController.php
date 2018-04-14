<?php
/**
 * Created by PhpStorm.
 * User: Thai Duc
 * Date: 06-Apr-18
 * Time: 12:03 AM
 */

namespace App\Http\Controllers;

use App\Bill;
use App\BillDetail;
use App\DeliveryNote;
use App\DeliveryNoteDetail;
use App\Http\Requests\ProductRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
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
//        $deliveryNotes = DeliveryNote::where('bill_id',$idBill)->get();
        $bill = Bill::find($idBill);
        return view('admin.deliveryNote.delivery-notes',compact('bill'));
    }

    public function getAdd($idBill){
        $bill = Bill::find($idBill);
        $products = DB::select("		
            select p.name, sum(dnd.quantity) as quantity,p.price, b.id, p.id as productId
            from products p 
            LEFT JOIN delivery_note_details dnd on p.id = dnd.product_id
            LEFT JOIN delivery_notes dn on dn.id = dnd.delivery_notes_id
            LEFT JOIN bills b on b.id = dn.bill_id
            where b.id = ?
            group by dnd.product_id,p.name,b.id
           ", [$idBill]);

        return view('admin.deliveryNote.add',compact('bill','products'));
    }

    public function postAdd(Request $request, $id){

        $deliveryNote = new DeliveryNote();
        $deliveryNote->recipient_address = $request->recipient_address;
        $deliveryNote->phone_number = $request->phone_number;
        $deliveryNote->recipient_name = $request->recipient_name;
        $deliveryNote->note = $request->note;
        $deliveryNote->created_by = Auth::id();
        $deliveryNote->bill_id = $id;
        $deliveryNote->save();

        $total = count($request->quantity);
        $arrQuantity = $request->quantity;
        $arrId = $request->productId;
        for($i = 0; $i < $total; $i++)
        {
            if(!empty($arrQuantity[$i])){
                $deliveryNoteDetail = new DeliveryNoteDetail();
                $deliveryNoteDetail->quantity = $arrQuantity[$i];
                $deliveryNoteDetail->product_id = $arrId[$i];
                $deliveryNoteDetail->unit = 1;
                $deliveryNoteDetail->delivery_notes_id = $deliveryNote->id;
                $deliveryNoteDetail->save();
            }
        }
        return redirect()->back()->with(['flash_message' => 'Thêm thành công']);
    }

    public function getDetail($idDeliveryNote){
//        $products = DB::select("
//            select p.name,p.price , dn.recipient_address, dn.recipient_name , dn.id,dn.phone_number, dnd.quantity
//            from delivery_notes dn
//            left join delivery_note_details dnd on dn.id = dnd.delivery_notes_id
//            left join products p on p.id = dnd.product_id
//            where dn.id = ? ", [$idDeliveryNote]);
        $deliveryNote  = DeliveryNote::find($idDeliveryNote);
//        dd($deliveryNote->DeliveryNoteDetails);
        return view('admin.deliveryNote.detail',compact('deliveryNote'));
    }

    public static function getNumofProductDaGiao($productId,$billId){
//        $billDetail = DeliveryNoteDetail::where('product_id',$productId)->where('bill_id',$billId)->first();
        $products = DB::select("		
            select sum(dnd.quantity) as quantity
            from bills b 
            LEFT JOIN delivery_notes dn on b.id = dn.bill_id
            LEFT JOIN delivery_note_details dnd on dn.id = dnd.delivery_notes_id
            LEFT JOIN products p on p.id = dnd.product_id
            where b.id = ? and p.id = ?
            group by p.id
           ", [$billId,$productId]);
        if(empty($products)) {
            return 0;
        }
        return $products[0]->quantity;
    }
}