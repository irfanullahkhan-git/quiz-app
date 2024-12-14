<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddClgIdToAttendancesTable extends Migration
{
    public function up()
    {
        Schema::table('attendances', function (Blueprint $table) {
            $table->unsignedBigInteger('clg_id')->nullable(); // Add the clg_id column
        });
    }

    public function down()
    {
        Schema::table('attendances', function (Blueprint $table) {
            $table->dropColumn('clg_id'); // Rollback the change
        });
    }
}
