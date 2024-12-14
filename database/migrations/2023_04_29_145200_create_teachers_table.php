<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTeachersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teachers', function (Blueprint $table) {
            $table->id();
            $table->string('name', 255);
            $table->unsignedBigInteger('clg_id');
            $table->string('phone_number', 20);
            $table->string('uuid', 20);
            $table->integer('pin_code');
            $table->string('user_role', 255);
            $table->index('clg_id');
            $table->index('uuid');
            $table->index('phone_number');
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
        Schema::dropIfExists('teachers');
    }
}
