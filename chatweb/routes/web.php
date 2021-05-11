<?php

use Illuminate\Support\Facades\Route;
use App\Events\WebSocketDemoEvent;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\VideoChatController;
use App\Http\Controllers\AudioChatController;
use App\Http\Controllers\FriendController;

use App\Models\User;

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



Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['middleware' => ['auth',  'online']], function () {

    // User routes
    Route::get('/users', [UserController::class, 'index']);
    Route::get('/user-merchant', [UserController::class, 'merchantID']);
    Route::get('/user-member', [UserController::class, 'memberID']);
    Route::post('/user-single', [UserController::class, 'singleID']);
    Route::get('/users/{user_id}', [UserController::class, 'show']);
    Route::post('/users-name', [UserController::class, 'getName']);

    Route::get('/conversation', function () {
        // fetch all users apart from the authenticated user
        $users = User::where('id', '<>', Auth::id())->get();
        return view('conversation', ['users' => $users]);
    });

    // Message routes
    Route::post('/send', [ConversationController::class, 'sendMessage']);
    Route::get('/chats/{from_user_id}', [ConversationController::class, 'fetchPersonal']);
    Route::get('/messages', [ConversationController::class, 'fetchMessages']);
    Route::post('/messages', 'ChatsController@sendMessage');

    // Video routes
    Route::post('/check', [UserController::class, 'userOnlineStatus']);

    // Personal Message routes
    Route::post('/video/call-user', [VideoChatController::class, 'callUser']);
    Route::post('/video/accept-call', [VideoChatController::class, 'acceptCall']);
    
    Route::post('/audio/call-user', [AudioChatController::class, 'callUser']);
    Route::post('/audio/accept-call', [AudioChatController::class, 'acceptCall']);

    // Friend routes
    Route::post('/sendRequest', [FriendController::class, 'store']);
    Route::post('/getFriendList', [FriendController::class, 'getFriendList']);
    Route::post('/getSentFriendRequest', [FriendController::class, 'getSentFriendRequest']);
    Route::post('/acceptFriend', [FriendController::class, 'acceptFriend']);
    Route::post('/rejectFriend', [FriendController::class, 'rejectFriend']);

    // Group routes
    Route::post('/add-group', [GroupController::class, 'store']);
});
