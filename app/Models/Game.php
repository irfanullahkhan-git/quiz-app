<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Game extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'type'];

    public function teams()
    {
        return $this->belongsToMany(Team::class, 'game_team')->withPivot('score');
    }
}
