<?php

namespace App\Models;

use App\Models\Hotels;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class HotelsUser extends Model
{
    use HasFactory;

    protected $table = 'hotels_user';

    protected $fillable = [
        'hotels_id',
        'user_id',
    ];

    protected $attributes = [
        'confirmed' => false
    ];

    public function user() {
        return $this->belongsTo(User::class);
    }

    public function hotels() {
        return $this->belongsTo(Hotels::class);
    }
}


