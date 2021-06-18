<?php 
namespace App\Controllers;

use App\Models\AccountModel;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;
use ReflectionException;
use App\Validation\Rules\UserLoginRules;
use App\Services\Account\AccountService;
use App\Controllers\BaseController;
use App\Models\AuthModel;
use Config\Services;

class AuthController extends BaseController
{
    private function getJWTForUser(string $emailAddress, int $responseCode = ResponseInterface::HTTP_OK){
        try {
            $accountService = new AccountService();
            $user = $accountService->findUserByEmailAddress($emailAddress);
            unset($user['password']);

            helper('jwt');

            $authModel = new AuthModel();
            $authData = $authModel->where(['user' => $user['id']])->get()->getRow();
            
            $token = getSignedJWTForUser($emailAddress);
            $refreshToken = getRefreshJWTForUser($emailAddress);

            // the auth table can only insert and update data 
            // if there is already have data in db so we just update that row else we will insert a new row into db
            if(!$authData){
                $data = [
                    'user'          =>  $user['id'],
                    'token'         =>  $refreshToken['token'],
                    'expired_at'    =>  date('Y-m-d H:i:s', $refreshToken['exp']),
                ];
                $authModel->insert($data);
            }else{
                $data = [
                    'user'          =>  $user['id'],
                    'token'         =>  $refreshToken['token'],
                    'expired_at'    =>  date('Y-m-d H:i:s', $refreshToken['exp']),
                    'created_at'    =>  date('Y-m-d H:i:s'),
                ];
                $authModel->update($authData->id, $data);
            }
            $user['id'] = intval($user['id'], 10);
            $user['rank'] = intval($user['rank'], 10);
            $user['exp_point'] = intval($user['exp_point'], 10);
            if($user['gender'] == "Male"){
                $user['gender'] = 0;
            }else{
                $user['gender'] = 1;
            }
            unset($user['created_at']);
            unset($user['created_by']);
            unset($user['is_deleted']);
            unset($user['deleted_at']);
            unset($user['deleted_by']);
            unset($user['updated_by']);
            unset($user['updated_at']);
            unset($user['is_locked']);
            unset($user['is_admin']);

            return $this
                ->getResponse(
                    [
                        'message' => 'User authenticated successfully',
                        'data'  => [
                        'id' => $user['id'],
                        'user_name' => $user['user_name'],
                        'email' => $user['email'],
                        'phone' => $user['phone'],
                        'first_name' => $user['first_name'],
                        'last_name' => $user['last_name'],
                        'gender' => $user['gender'],
                        'birthday' => $user['birthday'],
                        'avatar' => $user['avatar'],
                        'exp_point' => $user['exp_point'],
                        'rank' => $user['rank'],
                        'access_token' => $token,
                        'refresh_token' => $refreshToken['token'],
                        ],
                    ]
                );
        } catch (Exception $exception) {
            return $this
                ->getResponse(
                    [
                        'error' => $exception->getMessage(),
                    ],
                    $responseCode
                );
        }
    }
    public function register(){

    }

    public function login(){
        $validateRules = new UserLoginRules();

        $input = $this->getRequestInput($this->request);

        if (!$this->validateRequest($input, $validateRules->rules)) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }
        $accountService = new AccountService();
        $user = $accountService->findUserByPhone($input['phone']);

        if(!$user || !password_verify($input['password'], $user['password'])){
            return $this
                ->getResponse(
                    ['errors'=>"Phone or password incorrect"],
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }
       return $this->getJWTForUser($user['email']);
    }

    public function refreshToken(){
        $authenticationHeader = $this->request->getServer('HTTP_AUTHORIZATION');
        try {

            helper('jwt');
            $encodedToken = getJWTFromRequest($authenticationHeader);
            $user = validateJWTFromRequest($encodedToken);
            
            $authModel = new AuthModel();
            $authData = $authModel->where(['user' => $user['id']])->get()->getRow();
            
            if(strcmp($authData->token, $encodedToken) !=0 ){
                return Services::response()
                ->setJSON(
                    [
                        'error' => "Invalid token"
                    ]
                )
                ->setStatusCode(ResponseInterface::HTTP_UNAUTHORIZED);
            }
            
            return $this->getJWTForUser($user['email']);

        } catch (Exception $e) {
            return Services::response()
                ->setJSON(
                    [
                        'error' => $e->getMessage()
                    ]
                )
                ->setStatusCode(ResponseInterface::HTTP_UNAUTHORIZED);
        }
    }
}