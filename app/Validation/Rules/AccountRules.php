<?php 
namespace App\Validation\Rules;

class AccountRules 
{
    public function rules($id){
        return [
            'email' => 'trim|required|max_length[20]|min_length[6]|is_unique[account.email,id,'. $id .']',
        ];
    }
}