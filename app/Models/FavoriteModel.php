<?php 
namespace App\Models;
use CodeIgniter\Model;
class FavoriteModel extends Model
{
    public $table = "favorite";
    public $alias = "fav";
    
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
        'created_at',
        'created_by',
        'is_deleted',
        'deleted_at',
        'deleted_by',
    ];
}