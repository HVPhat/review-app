<?php 
namespace App\Models;
use CodeIgniter\Model;
class LikePostModel extends Model
{
    public $table = "like_post";
    public $alias = "lkpst";
    
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
        'post_id',
        'account_id',
    ];
}