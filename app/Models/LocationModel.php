<?php 
namespace App\Models;
use CodeIgniter\Model;
class LocationModel extends Model
{
    public $table = "location";
    public $alias = "loc";
    
    protected $primaryKey = "id";
    protected $returnType = "object";
    protected $useSoftDeletes = true;

    protected $useTimestamps = true;
    protected $createdField = "created_at";
    protected $updatedField = "";
    protected $deletedField = "";
    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;

    protected $allowedFields = [
        'id',
        'location_name',
        'location_image',
        'open_time',
        'closed_time',
        'lowest_price',
        'hightgest_price',
        'address',
        'rating',
        'phone_number',
        'is_approval',
        'approved_by',
        'is_deleted',
        'deleted_at',
        'deleted_by',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
    ];
}
