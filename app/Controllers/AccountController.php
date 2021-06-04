<?php 
namespace App\Controllers;
use App\Services\Account\AccountService;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
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

    public function show($id){
        $data = $this->service->getInfo(['id' => $id]);
        if($data == null){
            return $this->getResponse(
                ['errors'=>"Account doesn't exist"],
                ResponseInterface::HTTP_BAD_REQUEST
            );
        } 
        return $this->getResponse(
            [
                'message'  => "Success",
                'user'     => $data
            ]
        );
    }

    public function create(){

    }

    public function delete($id){

    }

    public function update($id){

    }
}