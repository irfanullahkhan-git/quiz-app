<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddUrlToCollegesTable extends Migration
{
    public function up()
    {
        Schema::table('colleges', function (Blueprint $table) {
            $table->string('url')->nullable(); // Adds the url column
        });
    }

    public function down()
    {
        Schema::table('colleges', function (Blueprint $table) {
            $table->dropColumn('url'); // Rollback the change
        });
    }
}
