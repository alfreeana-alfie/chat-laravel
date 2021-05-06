<?php

use Illuminate\Support\Facades\Route;
use App\Events\WebSocketDemoEvent;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\VideoChatController;


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
    // broadcast(new WebSocketDemoEvent('some data'));

    return view('welcome');
});

// User routes
Route::get('/users', [UserController::class, 'index']);
Route::get('/user-merchant', [UserController::class, 'merchantID']);
Route::get('/user-member', [UserController::class, 'memberID']);
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

//Video routes
Route::get('/video-chat', function () {
    // fetch all users apart from the authenticated user
    $users = User::where('id', '<>', Auth::id())->get();
    return view('video-chat', ['users' => $users]);
});

// Endpoints to call or receive calls.
Route::post('/video/call-user', [VideoChatController::class, 'callUser']);
Route::post('/video/accept-call', [VideoChatController::class, 'acceptCall']);

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
