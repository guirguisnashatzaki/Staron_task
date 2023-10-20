<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\CustomerPaymentsTerm;
use App\Http\Requests\V1\StoreCustomerPaymentsTermRequest;
use App\Http\Requests\V1\UpdateCustomerPaymentsTermRequest;
use App\Http\Resources\V1\CustomerPaymentsTermResource;
use App\Http\Resources\V1\CustomerPaymentsTermCollection;

class CustomerPaymentsTermController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new CustomerPaymentsTermCollection(CustomerPaymentsTerm::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreCustomerPaymentsTermRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreCustomerPaymentsTermRequest $request)
    {
        return new CustomerPaymentsTermResource(
            CustomerPaymentsTerm::create($request->all())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CustomerPaymentsTerm  $customerPaymentsTerm
     * @return \Illuminate\Http\Response
     */
    public function show(CustomerPaymentsTerm $customerPaymentsTerm)
    {
        return new CustomerPaymentsTermResource($customerPaymentsTerm);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateCustomerPaymentsTermRequest  $request
     * @param  \App\Models\CustomerPaymentsTerm  $customerPaymentsTerm
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateCustomerPaymentsTermRequest $request, CustomerPaymentsTerm $customerPaymentsTerm)
    {
        $customerPaymentsTerm = CustomerPaymentsTerm::find($request->id);
        $customerPaymentsTerm->termName = $request->termName;
        $customerPaymentsTerm->dueDays = $request->dueDays;
        $customerPaymentsTerm->discountPercentage = $request->discountPercentage;
        $result = $customerPaymentsTerm->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CustomerPaymentsTerm  $customerPaymentsTerm
     * @return \Illuminate\Http\Response
     */
    public function destroy(CustomerPaymentsTerm $customerPaymentsTerm)
    {
        //
    }

    public function delete(int $id){
        $user=CustomerPaymentsTerm::find($id);
        $user->delete();
    }
}
