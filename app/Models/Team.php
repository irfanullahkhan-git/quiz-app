<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    use HasFactory;
    protected $fillable = ['name', 'description'];
    public function games()
    {
        return $this->belongsToMany(Game::class, 'game_team')->withPivot('score'); 
    }

}
