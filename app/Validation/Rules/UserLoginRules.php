<?php 
namespace App\Validation\Rules;

class UserLoginRules 
{
    public $rules = [
        'phone'     => 'required',
        'password'  =>  'required|min_length[8]|max_length[255]',
    ];
}