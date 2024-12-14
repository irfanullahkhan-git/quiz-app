<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class RenameMatchesToGames extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::rename('matches', 'games');
    }

    public function down()
    {
        Schema::rename('games', 'matches');
    }

}
