<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateSupplierInvoiceRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        $method = $this->method();

        if($method == 'PUT'){
            return [
                'supplierId'=> ['required'],
                'invoiceNumber'=> ['required'],
                'invoiceDate'=> ['required'],
                'totalAmount'=> ['required'],
                'status'=> ['required'],
                'dueDate'=>['required']
            ];
        }else{
            return [
                'supplierId'=> ['required'],
                'invoiceNumber'=> ['required'],
                'invoiceDate'=> ['required'],
                'totalAmount'=> ['required'],
                'status'=> ['required'],
            ];
        }
    }
}
