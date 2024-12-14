<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStudentRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('student_requests', function (Blueprint $table) {
            $table->id(); // Creates an 'id' field with auto-increment.
            $table->string('name', 191);
            $table->string('class_number', 191);
            $table->unsignedBigInteger('semester_id');
            $table->unsignedBigInteger('department_id');
            $table->string('guardian_contact', 191);
            $table->timestamps(); // Creates 'created_at' and 'updated_at' timestamp fields.
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('student_requests');
    }
}
