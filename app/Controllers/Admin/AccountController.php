<?php 
namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Services\Account\AccountService;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use App\Services\Account\UpdateAccountService;
use Config\Services;
use Firebase\JWT\JWT;
use App\Validation\Rules\AccountRules;

class AccountController extends BaseController
{
    public function __construct(){
        $this->service = new AccountService();
        $this->updateService = new UpdateAccountService();
    }

    /** get user infomation base on JWT token in header
     * @return user data as an array
     */
    private function getUserInfo(){
        $authenticationHeader = $this->request->getServer('HTTP_AUTHORIZATION');
        helper('jwt');
        $encodedToken = getJWTFromRequest($authenticationHeader);
        $key = Services::getSecretKey();
        $decodedToken = JWT::decode($encodedToken, $key, ['HS256']);
        return $this->service->findUserByEmailAddress($decodedToken->email);
    }

    public function index()
    {
        $data = $this->service->getData(['id', 'user_name', 'gender', 'email', 'rank']);
        return $this->getResponse(
            [
                'message' => "Success",
                'users'   => $data
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
                'user_data'     => $data
            ]
        );
    }

    public function create(){
        // Validation
        $validateRules = new AccountRules();
        $input = $this->getRequestInput($this->request);
        if (!$this->validateRequest($input, $validateRules->rules(0))) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }

        //Get current request user id so we can set value to create_by field in db
        $userId = $this->getUserInfo()['id'];
        $this->updateService->setUser($userId);
        $this->updateService->setRequest($this->request);
        $response = $this->updateService->setAction(__FUNCTION__);

        if(!$response){
            return $this->getResponse(
                ['errors'=>"Account doesn't exist"],
                ResponseInterface::HTTP_BAD_REQUEST
            );
        }
        return $this->getResponse(
            $response
        );
    }


    public function delete($id){
        $userId = $this->getUserInfo()['id'];

        $this->updateService->setId($id);
        $this->updateService->setUser($userId);
        $response = $this->updateService->setAction(__FUNCTION__);
        
        if(!$response){
            return $this->getResponse(
                ['errors'=>"Account doesn't exist"],
                ResponseInterface::HTTP_BAD_REQUEST
            );
        }
        return $this->getResponse(
            [
                $response
            ]
        );
    }

    public function update($id){
        //Validation
        $validateRules = new AccountRules();
        $input = $this->getRequestInput($this->request);
        if (!$this->validateRequest($input, $validateRules->rules(0))) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }

        $userId = $this->getUserInfo()['id'];

        $this->updateService->setId($id);
        $this->updateService->setUser($userId);
        $this->updateService->setRequest($this->request);
        $response = $this->updateService->setAction(__FUNCTION__);

        if(!$response){
            return $this->getResponse(
                ['errors'=>"Account doesn't exist"],
                ResponseInterface::HTTP_BAD_REQUEST
            );
        }
        return $this->getResponse(
            $response
        );
    }

    public function lock($id){
        $userId = $this->getUserInfo()['id'];

        $this->updateService->setId($id);
        $this->updateService->setUser($userId);
        $response = $this->updateService->setAction(__FUNCTION__);
        
        if(!$response){
            return $this->getResponse(
                ['errors'=>"Account doesn't exist"],
                ResponseInterface::HTTP_BAD_REQUEST
            );
        }
        return $this->getResponse(
            [
                $response
            ]
        );
    }
}