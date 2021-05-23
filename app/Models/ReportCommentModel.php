<?php 
namespace App\Models;
use CodeIgniter\Model;
class ReportCommentModel extends Model
{
    public $table = "report_comment";
    public $alias = "rpc";
    
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
        'comment_id',
        'account_id',
        'report_title',
        'report_content',
        'is_approval',
        'is_deleted',
        'deleted_at',
        'deleted_by',
    ];
}
