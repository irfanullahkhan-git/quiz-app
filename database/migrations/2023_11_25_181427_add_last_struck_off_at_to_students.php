<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddLastStruckOffAtToStudents extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('students', function (Blueprint $table) {
            $table->timestamp('last_struck_off_at')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('students', function (Blueprint $table) {
            $table->dropColumn('last_struck_off_at');
        });
    }
}
