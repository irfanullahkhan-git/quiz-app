<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class DropMatchTeamTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::dropIfExists('match_team');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::create('match_team', function (Blueprint $table) {
            $table->id();
            $table->foreignId('game_id')->constrained('games')->onDelete('cascade');
            $table->foreignId('team_id')->constrained('teams')->onDelete('cascade');
            $table->integer('score')->default(0);
            $table->timestamps();
        });
    }
}
