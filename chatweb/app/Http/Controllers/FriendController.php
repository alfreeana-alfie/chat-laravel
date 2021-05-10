<?php

namespace App\Http\Controllers;

use App\Models\Friend;
use App\Models\User;
use App\Events\FriendRequestSent;
use App\Events\FriendRequestAccept;
use App\Events\FriendRequestReject;


use Illuminate\Http\Request;

class FriendController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $friend = auth()->user()->friends()->create([
            'user_id' => auth()->user()->id,
            'to_user_id' => $request['to_user_id'],
            'status' => $request['status']
        ]);

        broadcast(new FriendRequestSent($friend->load('user')))->toOthers();

        return $friend;
    }

    public function getFriendList(Request $request){
        $friend = Friend::where(['to_user_id' => $request['to_user_id']])->pluck('user_id');

        foreach($friend as $f){
            $user = User::where(['id' => $f])->first();

            $newArr[] = $user;
        }

        return $newArr;

        $count = count($newArr);
    }

    public function getSentFriendRequest(Request $request){

        $friend = Friend::where(['user_id' => $request['user_id']])->pluck('to_user_id');

        foreach($friend as $f){
            $user = User::where(['id' => $f])->first();

            $newArr[] = $user;
        }

        return $newArr;

        $count = count($newArr);
    }

    public function acceptFriend(Request $request){
        $friend = Friend::where(['to_user_id' => $request['to_user_id']])
        ->where(['user_id' => $request['user_id']])->update(['status' => 'Accept']);

        broadcast(new FriendRequestAccept($friend->load('user')))->toOthers();

        return $friend;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Friend  $friend
     * @return \Illuminate\Http\Response
     */
    public function show(Friend $friend)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Friend  $friend
     * @return \Illuminate\Http\Response
     */
    public function edit(Friend $friend)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Friend  $friend
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Friend $friend)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Friend  $friend
     * @return \Illuminate\Http\Response
     */
    public function destroy(Friend $friend)
    {
        $friend = Friend::where('to_user_id', $friend->to_user_id)
        ->where('user_id', $friend->user_id)
        ->delete();

        broadcast(new FriendRequestReject($friend->load('user')))->toOthers();

        return $friend;
    }
}
