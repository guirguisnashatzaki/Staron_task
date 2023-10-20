<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\CustomerAccount;
use App\Http\Requests\V1\StoreCustomerAccountRequest;
use App\Http\Requests\V1\UpdateCustomerAccountRequest;
use App\Http\Resources\V1\CustomerAccountCollection;
use App\Http\Resources\V1\CustomerAccountResource;

class CustomerAccountController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new CustomerAccountCollection(CustomerAccount::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreCustomerAccountRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCustomerAccountRequest $request)
    {
        return new CustomerAccountResource(CustomerAccount::create($request->all()));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CustomerAccount  $customerAccount
     * @return \Illuminate\Http\Response
     */
    public function show(CustomerAccount $customerAccount)
    {
        return new CustomerAccountResource($customerAccount);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCustomerAccountRequest  $request
     * @param  \App\Models\CustomerAccount  $customerAccount
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCustomerAccountRequest $request, CustomerAccount $customerAccount)
    {
        $customer = CustomerAccount::find($request->id);
        $customer->accountName = $request->accountName;
        $customer->accountNumber = $request->accountNumber;
        $customer->contactName = $request->contactName;
        $customer->email = $request->email;
        $customer->phone = $request->phone;
        $customer->address = $request->address;
        $result = $customer->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CustomerAccount  $customerAccount
     * @return \Illuminate\Http\Response
     */
    public function destroy(CustomerAccount $customerAccount)
    {
        //
    }

    public function delete(int $id){
        $user=CustomerAccount::find($id);
        $user->delete();
    }
}
