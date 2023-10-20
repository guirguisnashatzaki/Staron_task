<?php

namespace App\Http\Requests\V1;

use Illuminate\Foundation\Http\FormRequest;

class UpdateJournalEntryRequest extends FormRequest
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
                'date' => ['required'],
                'accountId' => ['required'],
                'debit' => ['required'],
                'credit'=> ['required'],
                'description' => ['required']
            ];
        }else{
            return [
                'date' => ['required'],
                'accountId' => ['required'],
                'debit' => ['required'],
                'credit'=> ['required'],
                'description' => ['required']
            ];
        }
    }
}
