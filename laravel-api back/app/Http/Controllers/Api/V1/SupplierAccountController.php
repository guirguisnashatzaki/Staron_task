<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\SupplierAccount;
use App\Http\Requests\V1\StoreSupplierAccountRequest;
use App\Http\Requests\V1\UpdateSupplierAccountRequest;
use App\Http\Resources\V1\SupplierAccountResource;
use App\Http\Resources\V1\SupplierAccountCollection;

class SupplierAccountController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new SupplierAccountCollection(SupplierAccount::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreSupplierAccountRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreSupplierAccountRequest $request)
    {
        return new SupplierAccountResource(
            SupplierAccount::create($request->all())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\SupplierAccount  $supplierAccount
     * @return \Illuminate\Http\Response
     */
    public function show(SupplierAccount $supplierAccount)
    {
        return new SupplierAccountResource($supplierAccount);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateSupplierAccountRequest  $request
     * @param  \App\Models\SupplierAccount  $supplierAccount
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateSupplierAccountRequest $request, SupplierAccount $supplierAccount)
    {
        $supplierAccount = SupplierAccount::find($request->id);
        $supplierAccount->accountName = $request->accountName;
        $supplierAccount->accountNumber = $request->accountNumber;
        $supplierAccount->contactName = $request->contactName;
        $supplierAccount->email = $request->email;
        $supplierAccount->phone = $request->phone;
        $supplierAccount->address = $request->address;
        $result = $supplierAccount->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\SupplierAccount  $supplierAccount
     * @return \Illuminate\Http\Response
     */
    public function destroy(SupplierAccount $supplierAccount)
    {
        //
    }

    public function delete(int $id){
        $user=SupplierAccount::find($id);
        $user->delete();
    }
}
