<?php 
namespace App\Controllers;
use App\Services\Account\AccountService;
use CodeIgniter\HTTP\Response;
use App\Services\Account\UpdateAccountService;
class AccountController extends BaseController
{
    public function __construct(){
        $this->service = new AccountService();
        $this->updateService = new UpdateAccountService();
    }
    public function index()
    {
        $data = $this->service->getData(['*']);
        return $this->getResponse(
            [
                'users' => $data
            ]
        );
        
    }
}