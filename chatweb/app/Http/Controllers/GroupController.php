<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\GroupUser;
use App\Models\GroupChat;
use Illuminate\Http\Request;
use App\Events\GroupMessageSent;
use App\Events\CreateGroupSent;

class GroupController extends Controller
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
        $group = Group::create([
            'name' => $request['name']
        ]);

        foreach($request['users'] as $user){
            GroupUser::create([
                'user_id' => $user,
                'group_id' => $group->id
            ]);
        }

        broadcast(new CreateGroupSent($group))->toOthers();

        return $group;
    }

    public function sendGroupMessage(Request $request){
        $message = GroupChat::create([
            'body' => $request->input('body'),
            'user_id' => $request['user_id'],
            'user_name' => $request['user_name'],
            'group_id' => $request['group_id']
        ]);

        broadcast(new GroupMessageSent($message->load('user')))->toOthers();

        return $message;
    }

    public function fetchGroupMessages(Request $request){
        $messages = GroupChat::where('group_id', $request['group_id'])->get();
        return $messages;
    }

    public function fetchSingleGroupName(Request $request){
        $messages = Group::where('id', $request['id'])->first();
        return $messages;
    }

    public function fetchGroup(Request $request){
        foreach($request['groupID'] as $group){
            $grouplist = Group::where(['id' => $group])->first();

            $newArr[] = $grouplist;
        }
        return $newArr;
    }

    public function getGroup(Request $request){
        $groupUser = GroupUser::where(['user_id' => $request['user_id']])->pluck('group_id');

        return $groupUser;
    }

    public function getUserID (Request $request) {
        $user = GroupUser::where(['group_id' => $request['group_id']])
        ->where('user_id', '!=', $request['user_id'])
        ->pluck('user_id');

        return $user;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function show(Group $group)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function edit(Group $group)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Group $group)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function destroy(Group $group)
    {
        //
    }
}
