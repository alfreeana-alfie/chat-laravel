<?php

namespace App\Http\Controllers;

use App\Models\Conversation;
use App\Models\Message;
use App\Http\Resources\ConversationResource;
use Illuminate\Http\Request;
use App\Events\MessageSent;
use Auth;

class ConversationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('conversation');
    }

    public function fetchMessages(){
        return Message::with('user')->get();
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
        $chat = Conversation::create([
            'user_id' => auth()->user()->id,
            'to_user_id' => $request['user_id']
        ]);

        Message::create([
            'body' => $request['body'],
            'user_id' => $request['user_id'],
            'chat_id' => $request['chat_id']
        ]);

        return ['status' => 'Successful', 200];
    }

    public function sendMessage(Request $request){
        $message = auth()->user()->messages()->create([
            'body' => $request->input('body'),
            'chat_id' => $request['chat_id'],
            'user_id' => auth()->user()->id
        ]);

        broadcast(new MessageSent($message->load('user')))->toOthers();

        return $message;
    }

    public function fetchPersonal(Request $request){
        $message = Message::where(['chat_id' => $request['chat_id']])->get();

        return $message;
    }

    public function fetchChatID(Request $request){
        $chats = Conversation::where(
            ['user_id' => $request['user_id'], 
            'to_user_id' => $request['to_user_id']])
            ->orWhere(
            ['user_id' => $request['to_user_id'], 
            'to_user_id' => $request['user_id']])
            ->first();

        if($chats == null){
            Conversation::create([
                'user_id' => $request['user_id'],
                'to_user_id' => $request['to_user_id']
            ]);

            $chats = Conversation::where(
                ['user_id' => $request['user_id'], 
                'to_user_id' => $request['to_user_id']])->first();

            return $chats;
        }else{
            return $chats;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Conversation  $conversation
     * @return \Illuminate\Http\Response
     */
    public function show(Conversation $conversation)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Conversation  $conversation
     * @return \Illuminate\Http\Response
     */
    public function edit(Conversation $conversation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Conversation  $conversation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Conversation $conversation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Conversation  $conversation
     * @return \Illuminate\Http\Response
     */
    public function destroy(Conversation $conversation)
    {
        //
    }
}
