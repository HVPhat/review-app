<?php 
namespace App\Services\Account;
use App\Models\AccountModel;
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
}