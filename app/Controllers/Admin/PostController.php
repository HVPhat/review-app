<?php 
namespace App\Controllers\Admin;

use CodeIgniter\HTTP\Response;
use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Services\Post\PostService;
use App\Services\Post\UpdatePostService;

class PostController extends BaseController
{
    public function __construct(){
        $this->service = new PostService();
        $this->updateService = new UpdatePostService();
    }

    public function index(){
        $data = $this->updateService->getPostTableData();
        return $this->getResponse(
            [
                'message' => "Success",
                'posts'    => $data
            ]
        );
    }
}