<?php 
namespace App\Models;
use CodeIgniter\Model;
class CommentModel extends Model
{
    public $table = "comment";
    public $alias = "ctm";
    
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
        'account_id',
        'post_id',
        'content',
        'comment_image',
        'created_at',
        'is_deleted',
        'deleted_at',
        'deleted_by',
        'updated_at',
        'updated_by',
        'before_update_content',
    ];
}
