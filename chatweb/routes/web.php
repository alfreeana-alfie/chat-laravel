<?php

use Illuminate\Support\Facades\Route;
use App\Events\WebSocketDemoEvent;
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
use App\Models\User;

Route::get('/', function () {
    broadcast(new WebSocketDemoEvent('some data'));

    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

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
Route::post('/chats-personal', [ConversationController::class, 'fetchPersonal']);
Route::post('/chat-id', [ConversationController::class, 'fetchChatID']);
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
Route::post('/group', [GroupController::class, 'getGroup']);
Route::post('/getGroupName', [GroupController::class, 'fetchGroup']);
Route::post('/fetchSingleGroupName', [GroupController::class, 'fetchSingleGroupName']);

Route::post('/fetchMessages-group', [GroupController::class, 'fetchGroupMessages']);
Route::post('/send-group', [GroupController::class, 'sendGroupMessage']);
Route::post('/get-ID', [GroupController::class, 'getUserID']);

//Testing routes
Route::post('/testing', [GroupRequestController::class, 'testing']);
Route::post('/testing-accept', [GroupVideoChatController::class, 'acceptTestCall']);

//Testing Audio routes
Route::post('/testing-audio', [GroupRequestAudioController::class, 'testing']);
Route::post('/testing-accept-audio', [GroupRequestAudioController::class, 'acceptTestCall']);

// Video Group Calls routes
Route::get('/streaming', [GroupVideoChatController::class, 'index']);
Route::get('/streaming/{streamId}', [GroupVideoChatController::class, 'consumer']);
Route::post('/stream-offer', [GroupVideoChatController::class, 'makeStreamOffer']);
Route::post('/stream-answer', [GroupVideoChatController::class, 'makeStreamAnswer']);

Route::get('access_token', [AccessTokenController::class, 'generate_token']);

// Route::get('/', [VideoRoomsController::class, 'index']);
Route::prefix('room')->middleware('auth')->group(function() {
   Route::get('join/{roomName}', [VideoRoomsController::class, 'joinRoom']);
   Route::post('create', [VideoRoomsController::class, 'createRoom']);
});

Route::prefix('audio-room')->middleware('auth')->group(function() {
    Route::get('join/{roomName}', [AudioRoomController::class, 'joinRoom']);
    Route::post('create', [AudioRoomController::class, 'createRoom']);
 });

Route::group(['middleware' => ['auth',  'online']], function () {
});
