<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTeacherXSubjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('teacher_x_subjects', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('teacher_id');
            $table->unsignedBigInteger('subject_id');
            $table->index('teacher_id');
            $table->index('subject_id');
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
        Schema::dropIfExists('teacher_x_subjects');
    }
}
