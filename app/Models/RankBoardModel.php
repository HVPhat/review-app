<?php 
namespace App\Models;
use CodeIgniter\Model;
class RankBoardModel extends Model
{
    public $table = "rank_board";
    public $alias = "rkb";
    
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
        'rank_name',
        'rank_exp_point',
        'rank_badge',
        'is_deleted',
        'deleted_at',
        'deleted_by',
        'created_at',
        'created_by',
        'updated_at',
        'updated_by',
    ];
}