<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\SupplierInvoice;
use App\Http\Requests\V1\StoreSupplierInvoiceRequest;
use App\Http\Requests\V1\UpdateSupplierInvoiceRequest;
use App\Http\Resources\V1\SupplierInvoiceResource;
use App\Http\Resources\V1\SupplierInvoiceCollection;

class SupplierInvoiceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new SupplierInvoiceCollection(SupplierInvoice::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreSupplierInvoiceRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSupplierInvoiceRequest $request)
    {
        return new SupplierInvoiceResource(
            SupplierInvoice::create($request->all())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SupplierInvoice  $supplierInvoice
     * @return \Illuminate\Http\Response
     */
    public function show(SupplierInvoice $supplierInvoice)
    {
        return new SupplierInvoiceResource($supplierInvoice);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateSupplierInvoiceRequest  $request
     * @param  \App\Models\SupplierInvoice  $supplierInvoice
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSupplierInvoiceRequest $request, SupplierInvoice $supplierInvoice)
    {
        $supplierInvoice = SupplierInvoice::find($request->id);
        $supplierInvoice->invoiceNumber = $request->invoiceNumber;
        $supplierInvoice->invoiceDate = $request->invoiceDate;
        $supplierInvoice->totalAmount = $request->totalAmount;
        $supplierInvoice->status = $request->status;
        $result = $supplierInvoice->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SupplierInvoice  $supplierInvoice
     * @return \Illuminate\Http\Response
     */
    public function destroy(SupplierInvoice $supplierInvoice)
    {
        //
    }

    public function delete(int $id){
        $user=SupplierInvoice::find($id);
        $user->delete();
    }
}
