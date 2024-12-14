<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnsToStudentRequests extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('student_requests', function (Blueprint $table) {
            $table->string('created_by', 191)->nullable();
            $table->string('status', 191)->default('pending');
            $table->unsignedBigInteger('student_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('student_requests', function (Blueprint $table) {
            //
            $table->dropColumn('created_by');
            $table->dropColumn('status');
            $table->dropColumn('student_id');
        });
    }
}
