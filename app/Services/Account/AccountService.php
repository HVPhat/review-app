<?php 
namespace App\Services\Account;
use App\Models\AccountModel;
use Exception;

class AccountService 
{
    public function __construct(){
        $this->model = new AccountModel();
        $this->db = \Config\Database::connect();
    }

    public function getModel(){
        return $this->model;
    }

    public function createQuery(){
        $builder = $this->db->table($this->model->table.' AS '.$this->model->alias)
                            ->where($this->model->alias.'.is_deleted', DEL_FLG_OFF);
        return $builder;
    }

    public function getData($selects = [], $where = []){
        $accountAlias = $this->model->alias;
        $accountTable = $this->model->table;
        $query = $this->createQuery()
                                    ->select($selects)
                                    ->where($where)
                                    ->orderBy($accountAlias.'.id', 'DESC');
        $get = $query->get();
        return $get->getResultObject();
    }

	// get row information
	public function getInfo($selects = [], $where = []){
		$model_alias = $this->model->alias;

		$query = $this->createQuery()
						->select($selects);
		if(is_array($where) && !empty($where)){
			$query = $this->buildCondition($query, $where);
		}
		return $query->get()->getRow();
	}
    
	// set condition
	protected function buildCondition($query, $condition){
		foreach($condition as $field=>$val){
			switch ($field) {
				default:
					if($val != ''){
						$query->where($this->model->alias.".".$field, $val);
					}
					break;
			}
		}
		return $query;
	}

    
	public function saveData($data){
		$id = $data['id'] ?? false;
		if($id){
			unset($data['id']);
			$this->model->update($id, $data);
		}else{
			$id = $this->model->insert($data);
		}
		return $id;
	}
    
    public function findUserByEmailAddress($emailAddress)
    {
        $model = new AccountModel();
        $user = $model
            ->asArray()
            ->where(['email' => $emailAddress])
            ->first();

        if (!$user)
            return false;

        return $user;
    }

	public function findUserByPhone($phone){
        $model = new AccountModel();
        $user = $model
            ->asArray()
            ->where(['phone' => $phone])
            ->first();

        if (!$user)
            return false;
        return $user;
	} 
}