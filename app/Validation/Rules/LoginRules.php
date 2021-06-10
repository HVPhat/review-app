<?php 
namespace App\Validation\Rules;

class LoginRules 
{
    public $rules = [
        'email' => 'required|min_length[6]|max_length[50]|valid_email',
        'password'  =>  'required|min_length[8]|max_length[255]',
    ];
}