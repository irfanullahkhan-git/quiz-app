<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCollegesTable extends Migration
{
    public function up()
    {
        Schema::create('colleges', function (Blueprint $table) {
            $table->id();
            $table->string('name');
        });
    }

    public function down()
    {
        Schema::dropIfExists('colleges');
    }
}

