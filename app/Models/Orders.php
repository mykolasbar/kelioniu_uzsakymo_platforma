<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Orders extends Pivot
{
    use HasFactory;

    protected $fillable = ['hotels_id', 'user_id'];

    protected $attributes = [
        'confirmed' => false
    ];

    public $incrementing = true;


    // public function hotels() {
    //     return $this->belongsToMany('App\Models\Hotels');
    // }

    // public function user() {
    //     return $this->belongsToMany('App\Models\User');
    // }
}
