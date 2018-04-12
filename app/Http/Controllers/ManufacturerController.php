<?php
/**
 * Created by PhpStorm.
 * User: Thai Duc
 * Date: 05-Apr-18
 * Time: 10:15 PM
 */

namespace App\Http\Controllers;

use App\Bill;
use App\Http\Requests\ProductRequest;
use Illuminate\Support\Facades\Input;
use App\Manufacturer;

class ManufacturerController extends Controller
{
    public function getListBill()
    {
        $bills = Bill::all();
        return view('admin.manufacturer.listbill',compact('bills'));
    }
    public function getList()
    {
        $manufacturers = Manufacturer::orderBy('id', 'DESC')->get();
        return view('admin.manufacturer.list', compact('manufacturers'));
    }

    public function getAdd()
    {
        return view('admin.manufacturer.add');
    }

    public function postAdd(ManufacturerRequest $request)
    {
        $type = new Manufacturer();
        $type->name = $request->txtName;
        $type->description = $request->txtDescription;

        if ($request->hasFile('fImages')) {
            $file = $request->file('fImages');

            $fileExtensions = $file->getClientOriginalExtension();
            if (!$this->checkExtension($fileExtensions)) {
                return redirect()->reload('admin.manufacturer.getAdd')->with('failed', 'Chỉ được chọn file có đuôi jpg,png,jpeg');
            }

            $fileName = str_random(8) . "_" . $file->getClientOriginalName();
            while (file_exists("template/image/Manufacturer/" . $fileName)) {
                $fileName = str_random(8) . "_" . $file->getClientOriginalName();
            }
            $file->move('template/image/Manufacturer/', $fileName);
            $type->image = $fileName;
        }

        $type->save();
        return redirect()->route('admin.manufacturer.list')->with(['flash_message' => 'Thêm thành công']);
    }

    public function getDelete($id)
    {
        $Manufacturer = Manufacturer::find($id);

        $getAllProduct = Product::where('id_type',$Manufacturer->id)->count();
        if($getAllProduct > 0){
            return redirect()->route('admin.manufacturer.list')->with(['flash_message_fail' => 'Đã có sản phẩm trong loại sản phẩm này! Không thể xóa']);
        }

        $Manufacturer->delete();
        return redirect()->route('admin.manufacturer.list')->with(['flash_message' => 'Xóa thành công']);
    }

    public function getEdit($id)
    {
        $manufacturer = Manufacturer::find($id);
        return view('admin.manufacturer.edit', compact('manufacturer'));
    }

    public function postEdit(Request $request,$id)
    {
        $this->validate($request,
            ['txtName' => 'required'],
            ['txtName.required' => "Vui lòng nhập tên thể loại"]
        );

        $type = Manufacturer::find($id);
        $type->name = $request->txtName;
        $type->description = $request->txtDescription;

        if ($request->hasFile('fImages')) {
            $file = $request->file('fImages');

            $fileExtensions = $file->getClientOriginalExtension();
            if (!$this->checkExtension($fileExtensions)) {
                return redirect()->back()->with('failed', 'Chỉ được chọn file có đuôi jpg,png,jpeg');
            }

            $fileName = str_random(8) . "_" . $file->getClientOriginalName();
            while (file_exists("template/image/Manufacturer/" . $fileName)) {
                $fileName = str_random(8) . "_" . $file->getClientOriginalName();
            }
            $file->move('template/image/Manufacturer/', $fileName);

            if(file_exists("template/image/Manufacturer/" . $type->image)){
                unlink("template/image/Manufacturer/" . $type->image);
            }

            $type->image = $fileName;
        }

        $type->save();
        return redirect()->back()->with(['flash_message' => 'Sửa thành công']);
    }

    private function checkExtension($fileExtensions)
    {
        $arr = array('jpg', 'png', 'jpeg', 'JPG', 'PNG', 'JPEG');
        if (in_array($fileExtensions, $arr)) {
            return true;
        }
        return false;
    }

    public static function getNameByTypeId($id)
    {
        $type = Manufacturer::find($id);
        return $type->name;
    }

}