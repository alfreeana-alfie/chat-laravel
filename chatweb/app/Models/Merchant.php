<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Merchant extends Model
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'merchant_name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password'
    ];

    public function messages(){
        return $this->hasMany(Message::class);
    }

    public function isOnline()
    {
    return Cache::has('user-is-online-' . $this->id);
    }

    public function friends(){
        return $this->hasMany(Friend::class);
    }
}
