<?php 
namespace App\Models;
use CodeIgniter\Model;

class AccountModel extends Model
{
    public $table = "account";
    public $alias = "acc";
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
        'name',
        'email',
        'password',
        'first_name',
        'last_name',
        'gender',
        'birthday',
        'avatar',
        'exp_point',
        'rank',
        'created_at',
        'created_by',
        'is_deleted',
        'deleted_at',
        'deleted_by',
        'updated_at',
        'updated_by',
        'is_locked',
        'is_admin',
    ];
}