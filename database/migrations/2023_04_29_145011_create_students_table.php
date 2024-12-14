<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentsTable extends Migration
{
    public function up()
    {
        Schema::create('students', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('class_number');
            $table->unsignedBigInteger('semester_id');
            $table->unsignedBigInteger('department_id');
            $table->string('guardian_contact');

            $table->index('semester_id', 'idx_semester_id_idx');
            $table->index('class_number', 'idx_class_number_idx');
        });
    }

    public function down()
    {
        Schema::dropIfExists('students');
    }
}

