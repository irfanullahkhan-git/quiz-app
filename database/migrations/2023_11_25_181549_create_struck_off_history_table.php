<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateStruckOffHistoryTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('struck_off_history', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('student_id');
            $table->unsignedBigInteger('modified_by');
            $table->boolean('is_struck_off')->default(true);
            $table->text('reason');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('struck_off_history');
    }
}
