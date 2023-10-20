<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\SupplierPaymentTerms;
use App\Http\Requests\V1\StoreSupplierPaymentTermsRequest;
use App\Http\Requests\V1\UpdateSupplierPaymentTermsRequest;
use App\Http\Resources\V1\SupplierPaymentTermsResource;
use App\Http\Resources\V1\SupplierPaymentTermsCollection;

class SupplierPaymentTermsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new SupplierPaymentTermsCollection(SupplierPaymentTerms::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreSupplierPaymentTermsRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSupplierPaymentTermsRequest $request)
    {
        return new SupplierPaymentTermsResource(
            SupplierPaymentTerms::create($request->all())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SupplierPaymentTerms  $supplierPaymentTerms
     * @return \Illuminate\Http\Response
     */
    public function show(SupplierPaymentTerms $supplierPaymentTerms)
    {
        return new SupplierPaymentTermsResource($supplierPaymentTerms);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateSupplierPaymentTermsRequest  $request
     * @param  \App\Models\SupplierPaymentTerms  $supplierPaymentTerms
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSupplierPaymentTermsRequest $request, SupplierPaymentTerms $supplierPaymentTerms)
    {
        $supplierPaymentTerms = SupplierPaymentTerms::find($request->id);
        $supplierPaymentTerms->termName = $request->termName;
        $supplierPaymentTerms->dueDays = $request->dueDays;
        $supplierPaymentTerms->discountPercentage = $request->discountPercentage;
        $result = $supplierPaymentTerms->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SupplierPaymentTerms  $supplierPaymentTerms
     * @return \Illuminate\Http\Response
     */
    public function destroy(SupplierPaymentTerms $supplierPaymentTerms)
    {
        //
    }

    public function delete(int $id){
        $user=SupplierPaymentTerms::find($id);
        $user->delete();
    }
}
