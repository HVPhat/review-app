<?php 
namespace App\Models;
use CodeIgniter\Model;
class NotificationModel extends Model
{
    public $table = "notification";
    public $alias = "not";
    
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
        'title',
        'link',
        'status',
        'created_at',
        'created_by',
        'is_deleted',
        'deleted_at',
        'deleted_by',
        'updated_at',
        'updated_by',
    ];
}