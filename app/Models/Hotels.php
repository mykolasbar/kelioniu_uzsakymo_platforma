<?php

namespace App\Models;

use App\Models\User;
use App\Models\Orders;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Hotels extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'price', 'picture', 'durationofjourny', 'countries_id'];

    public function countries() {
        return $this->belongsTo('App\Models\Countries');
    }

    public function user() {
        return $this->belongsToMany(User::class)->withPivot('confirmed');
    }

}
