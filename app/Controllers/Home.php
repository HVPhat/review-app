<?php

namespace App\Controllers;

class Home extends BaseController
{
	public function index()
	{
		return view('admin/main_view', ['sub_view' => 'admin/dashboard/home']);
	}
}
