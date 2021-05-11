<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\GroupUser;
use App\Models\GroupChat;
use Illuminate\Http\Request;

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

        return $group;
    }

    public function sendGroupMessage(Request $request){
        $message = GroupChat::create([
            'message' => $request->input('message'),
            'user_id' => $request['user_id'],
            'group_id' => $request['group_id']
        ]);

        return $message;
    }

    public function fetchGroupMessages(Request $request){
        $messages = GroupChat::where('group_id', $request['group_id'])->get();
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
