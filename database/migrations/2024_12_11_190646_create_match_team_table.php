<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMatchTeamTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('match_team', function (Blueprint $table) {
            $table->id();
            $table->foreignId('match_id')->constrained('matches')->onDelete('cascade');
            $table->foreignId('team_id')->constrained('teams')->onDelete('cascade');
            $table->integer('score')->default(0);
            $table->timestamps();
        });
    }


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('match_team');
    }
}
