<?php 
namespace App\Models;
use CodeIgniter\Model;
use Exception;

class AuthModel extends Model
{
    public $table = "auth";
    public $alias = "aut";
    protected $primaryKey = "id";
    protected $returnType = "object";
    protected $useSoftDeletes = true;

    protected $useTimestamps = true;
    protected $createdField = "created_at";
    protected $updatedField = "updated_at";
    protected $deletedField = "deleted_at";
    protected $validationRules = [];
    protected $validationMessages = [];
    protected $skipValidation = false;
    
    protected $allowedFields = [
        'id',
        'user',
        'token',
        'created_at',
        'expired_at',
        'updated_at',
    ];
}   