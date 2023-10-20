<?php

namespace App\Http\Controllers\Api\V1;
use App\Http\Controllers\Controller;
use App\Models\JournalEntry;
use App\Http\Requests\V1\StoreJournalEntryRequest;
use App\Http\Requests\V1\UpdateJournalEntryRequest;
use App\Http\Resources\V1\JournalEntryResource;
use App\Http\Resources\V1\JournalEntryCollection;
use App\Models\TrialBalanceObject;

class JournalEntryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return new JournalEntryCollection(JournalEntry::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreJournalEntryRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreJournalEntryRequest $request)
    {
        return new JournalEntryResource(
            JournalEntry::create($request->all())
        );
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\JournalEntry  $journalEntry
     * @return \Illuminate\Http\Response
     */
    public function show(JournalEntry $journalEntry)
    {
        return new JournalEntryResource($journalEntry);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateJournalEntryRequest  $request
     * @param  \App\Models\JournalEntry  $journalEntry
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateJournalEntryRequest $request, JournalEntry $journalEntry)
    {
        $journalEntry = JournalEntry::find($request->id);
        $journalEntry->date = $request->date;
        $journalEntry->debit = $request->debit;
        $journalEntry->credit = $request->credit;
        $journalEntry->description = $request->description;
        $result = $journalEntry->save();
        if($result){
            return "done";
        }else{
            return "no";
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\JournalEntry  $journalEntry
     * @return \Illuminate\Http\Response
     */
    public function destroy(JournalEntry $journalEntry)
    {
        //
    }

    public function delete(int $id){
        $user=JournalEntry::find($id);
        $user->delete();
    }

    public function getOneEntry(int $id){
        return JournalEntry::find($id);
    }

    public function trialBalance(){
        $journalEntries = JournalEntry::all();
        $totalDebits = 0;
        $totalCredits = 0;
        foreach($journalEntries as $entry){
            $totalCredits = $totalCredits + $entry->credit;
            $totalDebits = $totalDebits + $entry->debit;
        }
        $trialBalanceObject = new TrialBalanceObject();
        $trialBalanceObject->set_tc($totalCredits);
        $trialBalanceObject->set_td($totalDebits);
        return json_encode($trialBalanceObject);
    }
}
