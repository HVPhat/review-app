<?php 
namespace App\Services\Account;
use App\Services\Account\AccountService;
use CodeIgniter\HTTP\IncomingRequest;

class UpdateAccountService 
{
    protected $id = 0;
    protected $userId = 0;
	protected $request;
    
    public function __construct(){
        $this->accountService = new AccountService();
    }

    //set modify account id
    public function setId($id){
		return $this->id = $id;
	}

    //set user id who is modifying the account info 
    public function setUser($userId){
        return $this->userId = $userId;
    }
    
	public function setRequest($request){
		return $this->request = $request;
	}

    public function setAction($action){
        return $this->{$action}();
    }

    public function delete(){
        $obj = $this->accountService->getInfo(["id" => $this->id]);
        if(empty($obj)){
            return false;
        }
        $data = [
            "id"            =>  $this->id,
            'is_deleted'    =>  DEL_FLG_ON,
            'deleted_at'    =>  date('Y-m-d H:i:s'),
            'deleted_by'    =>  $this->userId,
        ];
        $this->id = $this->accountService->saveData($data);
        return ['message' => "Delete success!"];
    }

    public function update(){
        $data = $this->request->getPost();
        if (empty($data)) {
			//convert request body to associative array
			$data = json_decode($this->request->getBody(), true);
		}
        $data['id'] = $this->id;
        $data['updated_by'] = $this->userId;
        $data['updated_at'] = date('Y-m-d H:i:s');
        $this->id = $this->accountService->saveData($data);
        return ['message' => "Update success!"];
    }

    public function lock(){
        $obj = $this->accountService->getInfo(["id" => $this->id]);
        if(empty($obj)){
            return false;
        }
        if($obj->is_locked == 0){
            $data = [
                "id"            =>  $this->id,
                'is_locked'     =>  LOCK_FLG_ON,
                'updated_at'    =>  date('Y-m-d H:i:s'),
                'updated_by'    =>  $this->userId,
            ];
            $this->id = $this->accountService->saveData($data);
            return ['message' => "Lock success!"];
        }else{
            $data = [
                "id"            =>  $this->id,
                'is_locked'     =>  LOCK_FLG_OFF,
                'updated_at'    =>  date('Y-m-d H:i:s'),
                'updated_by'    =>  $this->userId,
            ];
            $this->id = $this->accountService->saveData($data);
            return ['message' => "Unlock success!"];
        }
    }

    public function create(){
        $data = $this->request->getPost();
        $file = $this->request->getFiles();
        if (empty($data)) {
			//convert request body to associative array8
			$data = json_decode($this->request->getBody(), true);
		}
        $data['id'] = $this->id;
        $data['created_by'] = $this->userId;
        $data['created_at'] = date('Y-m-d H:i:s');
        $data['avatar'] = "avatar.jpg";
        $data['password'] = password_hash($data['password'], PASSWORD_BCRYPT);
        $this->id = $this->accountService->saveData($data);
        return ['message' => "Update success!"];
    }
}
