<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\QuizController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});



Route::match(['get', 'post'], '/store-buzzer', [QuizController::class, 'store']);
Route::get('/buzzer/{team}', [QuizController::class, 'displayBuzzer'])->name('buzzer.display');



Route::middleware(['quiz_admin'])->group(function () {
    Route::get('/quiz/{type?}', [QuizController::class, 'showQuestion'])->name('quiz.show');
    Route::post('/updateQuestion', [QuizController::class, 'updateQuestion'])->name('updateQuestion');
    
    Route::get('/fetch-buzzers', [QuizController::class, 'fetchBuzzers']);
    Route::delete('/delete-all-buzzers', [QuizController::class, 'deleteAllBuzzers']);
    Route::get('/teams', [QuizController::class, 'team_index'])->name('teams.index');
    Route::get('/teams/create', [QuizController::class, 'team_create'])->name('teams.create');
    Route::post('/teams', [QuizController::class, 'team_store'])->name('teams.store');
    Route::get('/teams/{team}/edit', [QuizController::class, 'team_edit'])->name('teams.edit');
    Route::put('/teams/{team}', [QuizController::class, 'team_update'])->name('teams.update');

    Route::get('/matches', [QuizController::class, 'match_index'])->name('matches.index');
    Route::get('/matches/create', [QuizController::class, 'match_create'])->name('matches.create');
    Route::post('/matches', [QuizController::class, 'match_store'])->name('matches.store');
    Route::get('/matches/{match}', [QuizController::class, 'match_show'])->name('matches.show');
    Route::get('/matches/{match}/edit', [QuizController::class, 'match_edit'])->name('matches.edit');
    Route::put('/matches/{match}', [QuizController::class, 'match_update'])->name('matches.update');
    Route::put('/matches/{match}', [QuizController::class, 'match_update'])->name('matches.update');

    Route::get('matches/{match}/scoreboard', [QuizController::class, 'scoreboard'])->name('matches.scoreboard');
    Route::post('matches/{match}/scoreboard', [QuizController::class, 'updateScores'])->name('matches.updateScores');    
});
Route::get('/quiz_login', [QuizController::class, 'showLoginForm'])->name('quiz.login');
Route::post('/quiz_login', [QuizController::class, 'login'])->name('quiz.post_login');
Route::get('/quiz_logout', [QuizController::class, 'logout'])->name('quiz.logout');
