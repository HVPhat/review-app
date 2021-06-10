<?php 
namespace App\Services\Post;
use App\Models\PostModel;
use App\Models\AccountModel;

class PostService 
{
    public function __construct(){
        $this->model = new PostModel();
        $this->db = \Config\Database::connect();
        $this->accountModel = new AccountModel();
    }

    public function getModel(){
        return $this->model();
    }

    public function createQuery(){
        $postTable = $this->model->table;
        $postAlias = $this->model->alias;

        $accountTable = $this->accountModel->table;
        $accountAlias = $this->accountModel->alias;

        $builder = $this->db->table($postTable.' AS '.$postAlias)
                            ->join($accountTable.' AS '.$accountAlias, $postAlias.'.created_by = '.$accountAlias.'.id')
                            ->where($this->model->alias.'.is_deleted', DEL_FLG_OFF);
        return $builder;
    }

    public function getData($selects = [], $where = [], $page = 0, $limit = 0){
        if($page != 0){
            $page = $page * $limit;
        }

        $postAlias = $this->model->alias;
        $postTable = $this->model->table;
        $query = $this->createQuery()
                                    ->select($selects)
                                    ->where($where)
                                    ->limit($limit, $page)
                                    ->orderBy($postAlias.'.id', 'DESC');
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
}