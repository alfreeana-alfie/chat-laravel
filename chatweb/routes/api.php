<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupController;

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

// Route::post('/create', [GroupController::class, 'store']);
// Route::post('/getGroupName', [GroupController::class, 'store']);

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
