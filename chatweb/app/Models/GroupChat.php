<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class GroupChat extends Model
{
    use HasFactory;

    protected $fillable = [
        'body', 
        'user_id', 
        'user_name',
        'group_id',
        'created_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function group(){
        return $this->belongsTo(Group::class);
    }
}
