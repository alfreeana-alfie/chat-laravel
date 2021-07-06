<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\VideoChatController;
use App\Http\Controllers\AudioChatController;
use App\Http\Controllers\FriendController;
use App\Http\Controllers\GroupVideoChatController;
use App\Http\Controllers\AccessTokenController;
use App\Http\Controllers\VideoRoomsController;
use App\Http\Controllers\AudioRoomController;
use App\Http\Controllers\GroupRequestController;
use App\Http\Controllers\GroupRequestAudioController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/users/{user_id}', [UserController::class, 'show']);
Route::post('/chats', [ConversationController::class, 'fetchPersonal']);
Route::post('/chatID', [ConversationController::class, 'fetchChatID']);
Route::post('/send', [ConversationController::class, 'sendMessage']);

// User Routes
Route::get('/user-merchant', [UserController::class, 'merchantID']);
Route::get('/user-member', [UserController::class, 'memberID']);


// User routes
Route::get('/users', [UserController::class, 'index']);
Route::get('/user-merchant', [UserController::class, 'merchantID']);
Route::get('/user-member', [UserController::class, 'memberID']);
Route::post('/user-single', [UserController::class, 'singleID']);
Route::get('/users/{user_id}', [UserController::class, 'show']);
Route::post('/users-name', [UserController::class, 'getName']);


// Route::post('/create', [GroupController::class, 'store']);
// Route::post('/getGroupName', [GroupController::class, 'store']);
Route::get('access_token', [AccessTokenController::class, 'generate_token']);

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
