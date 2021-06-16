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

    public function getPostTableData(){
        $postModel = new PostModel();
        $locationModel = new LocationModel();
        $select = [
            $postModel->alias.'.id AS id',
            $postModel->alias.'.title AS title',
            $postModel->alias.'.view_quantity AS view_quantity',
            $postModel->alias.'.like_quantity AS like_quantity',
            $locationModel->alias.'.location_name AS location',
        ];
        return $this->service->getData($select);
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
            $postModel->alias.'.like_quantity AS like',
            $accountModel->alias.'.id AS user_id',
            $accountModel->alias.'.user_name',
            $accountModel->alias.'.avatar',
        ];
        
        $data = $this->service->getData($select, [], $page, $limit);
        $countResult = 0;

        foreach($data as $key => $value){
            $countResult++;
            $value->post_id = intval($value->post_id, 10);
            $value->view = intval($value->view, 10);
            $value->like = intval($value->like, 10);
            $value->user_id = intval($value->user_id, 10);
            if($value->image != null){
                $value->image = json_decode($value->image, true);
                $value->image = [$value->image[0][0]];
            }else{
                $value->image = "";
            }

            if($value->avatar != null){
                $value->avatar = [$value->avatar];
            }else{
                $value->avatar = "";
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
            $postModel->alias.'.rating AS post_rating',
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
        $data->post_id = intval($data->post_id, 10);
        $data->view = intval($data->view, 10);
        $data->post_rating = intval($data->post_rating, 10);
        $data->like = intval($data->like, 10);
        $data->user_id = intval($data->user_id, 10);
        $data->user_level = intval($data->user_level, 10);
        
        if($data->image == null){
            $data->image = [""];
        }else{
            $image = json_decode($data->image, true);
            $data->image = [];
            foreach($image[0] as $key => $value){
                array_push($data->image, $value);
            }
        }

        $selectLocation = [
            $locationModel->alias.'.id AS location_id',
            $locationModel->alias.'.location_image',
            $locationModel->alias.'.location_name',
            $locationModel->alias.'.address',
            $locationModel->alias.'.rating AS location_rating',
        ];
        $whereLocation = [
            'id' => $data->post_id,
        ];
        $locationData = $locationService->getInfo($selectLocation, $whereLocation);
        $locationData->location_rating = floatval($locationData->location_rating);
        $locationData->location_id = intval($locationData->location_id, 10);
        if($locationData->location_image == null){
            $locationData->location_image = "";
        }else{
            $image = json_decode($locationData->location_image, true);
            $locationData->location_image = [];
            foreach($image[0] as $key => $value){
                array_push($locationData->location_image, $value);
            }
        }
        $locationData->post_by_location = $this->service->countResult([$postModel->alias.".location" => $locationData->location_id]);
        $data->location = $locationData;

        return $data;
    }
}