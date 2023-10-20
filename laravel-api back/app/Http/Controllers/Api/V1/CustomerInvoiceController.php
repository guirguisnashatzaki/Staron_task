<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\CustomerInvoice;
use App\Http\Requests\V1\StoreCustomerInvoiceRequest;
use App\Http\Requests\V1\UpdateCustomerInvoiceRequest;
use App\Http\Resources\V1\CustomerInvoiceCollection;
use App\Http\Resources\V1\CustomerInvoiceResource;

class CustomerInvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new CustomerInvoiceCollection(CustomerInvoice::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreCustomerInvoiceRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCustomerInvoiceRequest $request)
    {
        return new CustomerInvoiceResource(
            CustomerInvoice::create($request->all())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CustomerInvoice  $customerInvoice
     * @return \Illuminate\Http\Response
     */
    public function show(CustomerInvoice $customerInvoice)
    {
        return new CustomerInvoiceResource($customerInvoice);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCustomerInvoiceRequest  $request
     * @param  \App\Models\CustomerInvoice  $customerInvoice
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCustomerInvoiceRequest $request, CustomerInvoice $customerInvoice)
    {
        $customerInvoice = CustomerInvoice::find($request->id);
        $customerInvoice->invoiceNumber = $request->invoiceNumber;
        $customerInvoice->invoiceDate = $request->invoiceDate;
        $customerInvoice->totalAmount = $request->totalAmount;
        $customerInvoice->status = $request->status;
        $customerInvoice->dueDate = $request->dueDate;
        $result = $customerInvoice->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CustomerInvoice  $customerInvoice
     * @return \Illuminate\Http\Response
     */
    public function destroy(CustomerInvoice $customerInvoice)
    {
        //
    }


    public function delete(int $id){
        $user=CustomerInvoice::find($id);
        $user->delete();
    }
}
