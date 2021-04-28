<?php

use Illuminate\Support\Facades\Route;
use App\Events\WebSocketDemoEvent;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupController;

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
    broadcast(new WebSocketDemoEvent('some data'));

    return view('welcome');
});

// User routes
Route::get('/users', [UserController::class, 'index']);
Route::get('/users/{user_id}', [UserController::class, 'show']);
Route::post('/users-name', [UserController::class, 'getName']);


// Group routes
// Route::get('/group-user', [GroupController::class, 'index']);
// Route::post('/group-message', [GroupController::class, 'fetchGroup']);

// Route::post('/create', [GroupController::class, 'store']);
// Route::post('/group', [GroupController::class, 'getGroup']);
// Route::post('/sendGroup', [GroupController::class, 'sendGroupMessage']);

// Chat routes
Route::get('/conversation', [ConversationController::class, 'index']);
Route::get('/chats/{from_user_id}', [ConversationController::class, 'fetchPersonal']);

Route::get('/messages', [ConversationController::class, 'fetchMessages']);
Route::post('/messages', 'ChatsController@sendMessage');

// Message routes
Route::post('/send', [ConversationController::class, 'sendMessage']);

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
