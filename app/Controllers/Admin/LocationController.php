<?php 
namespace App\Controllers\Admin;
use App\Controllers\BaseController;
use App\Services\Location\LocationService;
use App\Services\Location\UpdateLocationService;

class LocationController extends BaseController
{
    public function __construct(){
        $this->service = new LocationService();
        $this->updateService = new UpdateLocationService();
    }

    public function index(){
        $data = $this->service->getData(['*']);
        return $this->getResponse(
            [
                'message' => "Success",
                'location'    => $data
            ]
        );
    }
}