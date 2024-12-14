<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAttendancesTable extends Migration
{
    public function up()
    {
        Schema::create('attendances', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('student_id');
            $table->unsignedBigInteger('subject_id');
            $table->tinyInteger('is_absent');
            $table->date('attendance_date');
            $table->dateTime('created_on');
            $table->dateTime('modified_on');
            $table->unsignedBigInteger('created_by');
            $table->unsignedBigInteger('modified_by');

            $table->index('student_id', 'idx_student_id_idx');
            $table->index('attendance_date', 'idx_attendance_date_idx');
        });
    }

    public function down()
    {
        Schema::dropIfExists('attendances');
    }
}

