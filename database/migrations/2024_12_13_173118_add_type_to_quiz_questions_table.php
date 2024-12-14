<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddTypeToQuizQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('quiz_questions', function (Blueprint $table) {
            $table->string('type')->after('correct_option')->nullable(); // Replace 'existing_column' with the column after which 'type' should be added
        });
    }


    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('quiz_questions', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
}
