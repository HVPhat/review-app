<?php 
namespace App\Models;
use CodeIgniter\Model;
class PostModel extends Model
{
    public $table = "post";
    public $alias = "pst";
    
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
        'content',
        'location',
        'post_image',
        'post_video',
        'view_quantity',
        'like_quantity',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
        'is_deleted',
        'deleted_at',
        'deleted_by',
    ];
}
