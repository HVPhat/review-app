<?php 
namespace App\Models;
use CodeIgniter\Model;
class FollowModel extends Model
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
        'account_id_1',
        'account_id_2',
    ];
}