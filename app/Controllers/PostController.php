<?php 
namespace App\Controllers;

use App\Services\Post\PostService;
use App\Services\Post\UpdatePostService;

class PostController extends BaseController
{
    public function __construct(){
        $this->service = new PostService();
        $this->updateService = new UpdatePostService();
    }

    public function getPostDataByPage(){
        $this->updateService->setRequest($this->request);
        $data = $this->updateService->setAction(__FUNCTION__);
        return $this->getResponse(
            [
                'pagination' => $data['pagination'],
                'data'       => $data['data'],
            ]
        );
    }

    public function getPostDetail(){
        $this->updateService->setRequest($this->request);
        $data = $this->updateService->setAction(__FUNCTION__);
        return $this->getResponse(
            [
                'data'  =>  $data,
            ]
        );
    }
}
