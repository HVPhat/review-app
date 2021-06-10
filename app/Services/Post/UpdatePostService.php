<?php 
namespace App\Services\Post;
use App\Services\Post\PostService;
use App\Services\Location\LocationService;
use App\Models\AccountModel;
use App\Models\PostModel;
use App\Models\LocationModel;

class UpdatePostService
{
    private $request;

    public function __construct(){
        $this->service = new PostService();
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

    public function getPostDataByPage(){

        $limit = $this->request->getGet('limit');
        $page = $this->request->getGet('page');

        $accountModel = new AccountModel();
        $postModel = new PostModel();

        $select = [
            $postModel->alias.'.id AS post_id',
            $postModel->alias.'.post_image AS image',
            $postModel->alias.'.title AS post_title',
            $postModel->alias.'.view_quantity AS view',
            $accountModel->alias.'.id AS user_id',
            $accountModel->alias.'.user_name',
        ];
        
        $data = $this->service->getData($select, [], $page, $limit);
        $countResult = 0;

        foreach($data as $key => $value){
            $countResult++;
            if($value->image != null){
                $value->image = json_decode($value->image);
                $value->image = $value->image[0];
            }else{
                $value->image = "";
            }
        }

        $pagination = [
            'page' => intval($page, 10),
            'limit' => intval($limit, 10),
            'total' => $countResult,
        ];
        return ['data' => $data, 'pagination' => $pagination];

    }

    public function getPostDetail(){

        $post_id = $this->request->getGet('id');

        $accountModel = new AccountModel();
        $postModel = new PostModel();
        $locationModel = new LocationModel();
        $locationService = new LocationService();

        $selectPost = [
            $postModel->alias.'.id AS post_id',
            $postModel->alias.'.post_image AS image',
            $postModel->alias.'.title AS post_title',
            $postModel->alias.'.title AS post_title',
            $postModel->alias.'.created_at AS post_date',
            $postModel->alias.'.view_quantity AS view',
            $postModel->alias.'.like_quantity AS like',
            $postModel->alias.'.content AS post_content',
            $accountModel->alias.'.id AS user_id',
            $accountModel->alias.'.user_name',
            $accountModel->alias.'.rank AS user_level',
        ];
        
        $data = $this->service->getInfo($selectPost, []);
        if($data->image == null){
            $data->image = "";
        }else{
            $data->image = json_decode($data->image);
        }

        $selectLocation = [
            $locationModel->alias.'.id AS location_id',
            $locationModel->alias.'.location_image',
            $locationModel->alias.'.location_name',
            $locationModel->alias.'.address',
            $locationModel->alias.'.rating',
        ];
        $whereLocation = [
            'id' => $data->post_id,
        ];
        $data->location = $locationService->getInfo($selectLocation, $whereLocation);

        return $data;
    }
}