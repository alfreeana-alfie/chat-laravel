<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VideoConfiq extends Model
{
    use HasFactory;

    protected $fillable = [
        'userToCall',
        'signalData',
        'from',
        'type'
    ];
}
