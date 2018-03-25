<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\Product;

class CustomerController extends Controller
{
    public function getList() {
        $data = Customer::select('id','name', 'email', 'gender')->get()->toArray();
        return view('admin.customer.list', compact('data'));
    }

    public function getView($id) {
        $customer = Customer::findOrFail($id)->toArray();
        return view('admin.customer.view', compact('customer'));
    }
}
