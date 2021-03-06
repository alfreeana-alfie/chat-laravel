<?php

namespace App\Http\Controllers;

use App\Models\GroupChat;
use Illuminate\Http\Request;

class GroupChatController extends Controller
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
        $message = new GroupChat();
        $message->message = $request->message;
        $message->user_id = $request->user_id;
        $message->group_id = $request->group_id;
        $message->save();

        return $message;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\GroupChat  $groupChat
     * @return \Illuminate\Http\Response
     */
    public function show(GroupChat $groupChat)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GroupChat  $groupChat
     * @return \Illuminate\Http\Response
     */
    public function edit(GroupChat $groupChat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GroupChat  $groupChat
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GroupChat $groupChat)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GroupChat  $groupChat
     * @return \Illuminate\Http\Response
     */
    public function destroy(GroupChat $groupChat)
    {
        //
    }
}
