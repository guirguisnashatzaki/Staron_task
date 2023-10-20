<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use App\Models\PeriodClosing;
use App\Http\Requests\V1\StorePeriodClosingRequest;
use App\Http\Requests\V1\UpdatePeriodClosingRequest;
use App\Http\Resources\V1\PeriodClosingCollection;
use App\Http\Resources\V1\PeriodClosingResource;

class PeriodClosingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $accounts = PeriodClosing::all();

        return new PeriodClosingCollection($accounts);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StorePeriodClosingRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StorePeriodClosingRequest $request)
    {
        return new PeriodClosingResource(
            PeriodClosing::create($request->all())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\PeriodClosing  $periodClosing
     * @return \Illuminate\Http\Response
     */
    public function show(PeriodClosing $periodClosing)
    {
        return new PeriodClosingResource($periodClosing);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\PeriodClosing  $periodClosing
     * @return \Illuminate\Http\Response
     */
    public function edit(PeriodClosing $periodClosing)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdatePeriodClosingRequest  $request
     * @param  \App\Models\PeriodClosing  $periodClosing
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePeriodClosingRequest $request, PeriodClosing $periodClosing)
    {
        $periodClosing = PeriodClosing::find($request->id);
        $periodClosing->startDate = $request->startDate;
        $periodClosing->status = $request->status;
        $periodClosing->endDate = $request->endDate;
        $result = $periodClosing->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\PeriodClosing  $periodClosing
     * @return \Illuminate\Http\Response
     */
    public function destroy(PeriodClosing $periodClosing)
    {
        //
    }

    public function delete(int $id){
        $user=PeriodClosing::find($id);
        $user->delete();
    }
}
