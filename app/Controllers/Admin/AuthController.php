<?php

namespace App\Controllers\Admin;

use App\Models\AccountModel;
use CodeIgniter\HTTP\Response;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;
use ReflectionException;
use App\Validation\Rules\LoginRules;
use App\Services\Account\AccountService;
use App\Controllers\BaseController;

class AuthController extends BaseController
{
    /**
     * Authenticate Existing User
     * @return Response
     */
    public function login()
    {
        $validateRules = new LoginRules();

        $input = $this->getRequestInput($this->request);

        if (!$this->validateRequest($input, $validateRules->rules)) {
            return $this
                ->getResponse(
                    $this->validator->getErrors(),
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }
        $accountService = new AccountService();
        $user = $accountService->findUserByEmailAddress($input['email']);
        if(!$user || $user['is_admin']!=IS_ADMIN || !password_verify($input['password'], $user['password'])){
            return $this
                ->getResponse(
                    ['errors'=>"Email or password incorrect"],
                    ResponseInterface::HTTP_BAD_REQUEST
                );
        }
       return $this->getJWTForUser($input['email']);
    }

    private function getJWTForUser(string $emailAddress, int $responseCode = ResponseInterface::HTTP_OK)
    {
        try {
            $accountService = new AccountService();
            $user = $accountService->findUserByEmailAddress($emailAddress);
            unset($user['password']);

            helper('jwt');

            return $this
                ->getResponse(
                    [
                        'message' => 'User authenticated successfully',
                        'user' => $user,
                        'access_token' => getSignedJWTForUser($emailAddress),
                        'refresh_token' =>  getRefreshJWTForUser($emailAddress),
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
}
