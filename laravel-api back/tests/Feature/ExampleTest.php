<?php

namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class MyTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_the_accounts_returns_a_successful_response_get()
    {
        $response = $this->getJson('api/v1/accounts');

        $response->assertStatus(200);
    }

    public function test_the_accounts_returns_a_successful_response_post()
    {
        $response = $this->postJson('api/v1/accounts',[
            'accountNumber' => 1,
            'accountName' => 'wqdf',
            'accountType' => 'sfas',
            'normalSide' => 'asfa',
            'balance' => 12
        ]);

        $response->assertStatus(201);
    }
    public function test_the_accounts_returns_a_successful_response_put()
    {
        $response = $this->putJson('api/v1/updateaccount/2',[
            'accountNumber' => 1,
            'accountName' => 'wqdf',
            'accountType' => 'sfas',
            'normalSide' => 'asfa',
            'balance' => 12
        ]);

        $response->assertStatus(200);
    }
    public function test_the_accounts_returns_a_successful_response_delete()
    {
        $response = $this->deleteJson('api/v1/delAcc/4');

        $response->assertStatus(500);
    }

    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_trial_balance()
    {
        $response = $this->getJson('api/v1/trialBalance');

        $response->assertStatus(200);
    }

    //period closing
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_the_period_returns_a_successful_response_get()
    {
        $response = $this->getJson('api/v1/periodClosing');

        $response->assertStatus(200);
    }

    public function test_the_period_returns_a_successful_response_post()
    {
        $response = $this->postJson('api/v1/periodClosing',[
            'startDate' => 'das',
            'endDate' => 'wqdf',
            'status' => 'sfas',
        ]);

        $response->assertStatus(201);
    }
    public function test_the_period_returns_a_successful_response_put()
    {
        $response = $this->putJson('api/v1/updatePeriodClosing/2',[
            'startDate' => 'das',
            'endDate' => 'wqdf',
            'status' => 'sfas',
        ]);

        $response->assertStatus(200);
    }
    public function test_the_period_returns_a_successful_response_delete()
    {
        $response = $this->deleteJson('api/v1/delPerClo/4');

        $response->assertStatus(500);
    }


    //Journal Entry
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_the_Journal_returns_a_successful_response_get()
    {
        $response = $this->getJson('api/v1/journal_entries');

        $response->assertStatus(200);
    }

    public function test_the_Journal_returns_a_successful_response_post()
    {
        $response = $this->postJson('api/v1/journal_entries',[
            'date' => 'das',
            'accountId' => 1,
            'debit' => 5,
            'credit' => 8,
            'description' =>"adas"
        ]);

        $response->assertStatus(201);
    }
    public function test_the_Journal_returns_a_successful_response_put()
    {
        $response = $this->putJson('api/v1/updateJournalEntry/2',[
            'date' => 'das',
            'accountId' => 1,
            'debit' => 5,
            'credit' => 8,
            'description' =>"adas"
        ]);

        $response->assertStatus(200);
    }
    public function test_the_Journal_returns_a_successful_response_delete()
    {
        $response = $this->deleteJson('api/v1/delJour/4');

        $response->assertStatus(500);
    }


    //Customer Account
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_customer_account_get()
    {
        $response = $this->getJson('api/v1/customer_accounts');

        $response->assertStatus(200);
    }

    public function test_customer_account_post()
    {
        $response = $this->postJson('api/v1/customer_accounts',[
            'accountNumber' => 85,
            'accountName' => "da",
            'contactName' => "as",
            'email' => "e",
            'phone' =>"adas",
            'address' => "adfa"
        ]);

        $response->assertStatus(201);
    }
    public function test_customer_account_put()
    {
        $response = $this->putJson('api/v1/updateCustomer/2',[
            'accountNumber' => 85,
            'accountName' => "da",
            'contactName' => "as",
            'email' => "e",
            'phone' =>"adas",
            'address' => "adfa"
        ]);

        $response->assertStatus(200);
    }
    public function test_customer_account_delete()
    {
        $response = $this->deleteJson('api/v1/delCusAcc/4');

        $response->assertStatus(500);
    }

    //Cutomer invoice
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_customer_invoice_get()
    {
        $response = $this->getJson('api/v1/customer_invoices');

        $response->assertStatus(200);
    }

    public function test_customer_invoice_post()
    {
        $response = $this->postJson('api/v1/customer_invoices',[
            'customerId' => 1,
            'invoiceNumber' => 1,
            'invoiceDate' => "as",
            'totalAmount' => 52,
            'status' =>"adas",
            'dueDate' => "adfa"
        ]);

        $response->assertStatus(201);
    }
    public function test_customer_invoice_put()
    {
        $response = $this->putJson('api/v1/updateCustomerInvoice/1',[
            'customerId' => 1,
            'invoiceNumber' => 1,
            'invoiceDate' => "as",
            'totalAmount' => 52,
            'status' =>"adas",
            'dueDate' => "adfa"
        ]);

        $response->assertStatus(200);
    }
    public function test_customer_invoice_delete()
    {
        $response = $this->deleteJson('api/v1/delCusIn/4');

        $response->assertStatus(500);
    }

    //Cutomer payment
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_customer_payment_get()
    {
        $response = $this->getJson('api/v1/customer_payments_terms');

        $response->assertStatus(200);
    }

    public function test_customer_payment_post()
    {
        $response = $this->postJson('api/v1/customer_payments_terms',[
            'termName' => "as",
            'dueDays' =>8,
            'discountPercentage' => 52,
        ]);

        $response->assertStatus(201);
    }
    public function test_customer_payment_put()
    {
        $response = $this->putJson('api/v1/updateCutomerPaymentsTerm/1',[
            'termName' => "as",
            'dueDays' =>5,
            'discountPercentage' => 52,
        ]);

        $response->assertStatus(200);
    }
    public function test_customer_payment_delete()
    {
        $response = $this->deleteJson('api/v1/delCusPay/4');

        $response->assertStatus(500);
    }





    //Supplier Account
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_supplier_account_get()
    {
        $response = $this->getJson('api/v1/supplier_accounts');

        $response->assertStatus(200);
    }

    public function test_supplier_account_post()
    {
        $response = $this->postJson('api/v1/supplier_accounts',[
            'accountNumber' => 85,
            'accountName' => "da",
            'contactName' => "as",
            'email' => "e",
            'phone' =>"adas",
            'address' => "adfa"
        ]);

        $response->assertStatus(201);
    }
    public function test_supplier_account_put()
    {
        $response = $this->putJson('api/v1/updateSupplier/2',[
            'accountNumber' => 85,
            'accountName' => "da",
            'contactName' => "as",
            'email' => "e",
            'phone' =>"adas",
            'address' => "adfa"
        ]);

        $response->assertStatus(200);
    }
    public function test_supplier_account_delete()
    {
        $response = $this->deleteJson('api/v1/delSup/4');

        $response->assertStatus(500);
    }

    //Supplier invoice
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_Supplier_invoice_get()
    {
        $response = $this->getJson('api/v1/supplier_invoices');

        $response->assertStatus(200);
    }

    public function test_Supplier_invoice_post()
    {
        $response = $this->postJson('api/v1/supplier_invoices',[
            'supplierId' =>1,
            'customerId' => 1,
            'invoiceNumber' => 1,
            'invoiceDate' => "as",
            'totalAmount' => 52,
            'status' =>"adas",
            'dueDate' => "adfa"
        ]);

        $response->assertStatus(201);
    }
    public function test_Supplier_invoice_put()
    {
        $response = $this->putJson('api/v1/updateSupplierInvoice/1',[
            'supplierId' =>1,
            'customerId' => 1,
            'invoiceNumber' => 12,
            'invoiceDate' => "as",
            'totalAmount' => 52,
            'status' =>"adas",
            'dueDate' => "adfa"
        ]);

        $response->assertStatus(500);
    }
    public function test_Supplier_invoice_delete()
    {
        $response = $this->deleteJson('api/v1/delSupIn/4');

        $response->assertStatus(500);
    }

    //Supplier payment
    /**
     * A basic test example.
     *
     * @return void
     */
    public function test_Supplier_payment_get()
    {
        $response = $this->getJson('api/v1/supplier_payment_terms');

        $response->assertStatus(200);
    }

    public function test_Supplier_payment_post()
    {
        $response = $this->postJson('api/v1/supplier_payment_terms',[
            'termName' => "as",
            'dueDays' =>8,
            'discountPercentage' => 52,
        ]);

        $response->assertStatus(201);
    }
    public function test_Supplier_payment_put()
    {
        $response = $this->putJson('api/v1/updateSupplierPaymentTerms/1',[
            'termName' => "as",
            'dueDays' =>5,
            'discountPercentage' => 52,
        ]);

        $response->assertStatus(200);
    }
    public function test_Supplier_payment_delete()
    {
        $response = $this->deleteJson('api/v1/delSupPay/4');

        $response->assertStatus(500);
    }
}
