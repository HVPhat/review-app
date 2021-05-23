<?php 
namespace App\Models;
use CodeIgniter\Model;
class CommentModel extends Model
{
    public $table = "like_comment";
    public $alias = "lkctm";
    
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
        'comment_id',
    ];
}