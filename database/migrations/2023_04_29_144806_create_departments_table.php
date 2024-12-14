<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDepartmentsTable extends Migration
{
    public function up()
    {
        Schema::create('departments', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('college_id');
            $table->string('uuid');

            $table->index('college_id', 'idx_college_id_idx');
        });
    }

    public function down()
    {
        Schema::dropIfExists('departments');
    }
}

