<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\V1\AccountController;
use App\Http\Controllers\Api\V1\CustomerAccountController;
use App\Http\Controllers\Api\V1\CustomerInvoiceController;
use App\Http\Controllers\Api\V1\CustomerPaymentsTermController;
use App\Http\Controllers\Api\V1\JournalEntryController;
use App\Http\Controllers\Api\V1\SupplierAccountController;
use App\Http\Controllers\Api\V1\SupplierInvoiceController;
use App\Http\Controllers\Api\V1\PeriodClosingController;
use App\Http\Controllers\Api\V1\SupplierPaymentTermsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// api/v1

Route::group(['prefix'=>'v1','namespace'=>'App\Http\Controllers\Api\V1'],function(){
    Route::apiResource('accounts',AccountController::class);
    Route::apiResource('journal_entries',JournalEntryController::class);
    Route::apiResource('customer_accounts',CustomerAccountController::class);
    Route::apiResource('customer_payments_terms',CustomerPaymentsTermController::class);
    Route::apiResource('customer_invoices',CustomerInvoiceController::class);
    Route::apiResource('supplier_accounts',SupplierAccountController::class);
    Route::apiResource('supplier_payment_terms',SupplierPaymentTermsController::class);
    Route::apiResource('supplier_invoices',SupplierInvoiceController::class);
    Route::apiResource('periodClosing',PeriodClosingController::class);
    Route::put('updateaccount/{id}',[AccountController::class,'update']);
    Route::put('updateCustomer/{id}',[CustomerAccountController::class,'update']);
    Route::put('updateCustomerInvoice/{id}',[CustomerInvoiceController::class,'update']);
    Route::put('updateCutomerPaymentsTerm/{id}',[CustomerPaymentsTermController::class,'update']);
    Route::put('updateJournalEntry/{id}',[JournalEntryController::class,'update']);
    Route::put('updateSupplier/{id}',[SupplierAccountController::class,'update']);
    Route::put('updateSupplierInvoice/{id}',[SupplierInvoiceController::class,'update']);
    Route::put('updateSupplierPaymentTerms/{id}',[SupplierPaymentTermsController::class,'update']);
    Route::put('updatePeriodClosing/{id}',[PeriodClosingController::class,'update']);
    Route::delete('delCusAcc/{id}',[CustomerAccountController::class,'delete']);
    Route::delete('delCusIn/{id}',[CustomerInvoiceController::class,'delete']);
    Route::delete('delCusPay/{id}',[CustomerPaymentsTermController::class,'delete']);
    Route::delete('delJour/{id}',[JournalEntryController::class,'delete']);
    Route::delete('delAcc/{id}',[AccountController::class,'delete']);
    Route::delete('delSup/{id}',[SupplierAccountController::class,'delete']);
    Route::delete('delSupIn/{id}',[SupplierInvoiceController::class,'delete']);
    Route::delete('delSupPay/{id}',[SupplierPaymentTermsController::class,'delete']);
    Route::delete('delPerClo/{id}',[PeriodClosingController::class,'delete']);
    Route::get('journalEntries/{entryId}',[JournalEntryController::class,'getOneEntry']);
    Route::get('/trialBalance',[JournalEntryController::class,'trialBalance']);
    //Route::apiResource('chartOfAccounts',[AccountController::class]);
});