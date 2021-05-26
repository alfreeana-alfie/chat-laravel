<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Events\StartVideoChat;
use App\Models\User;
use App\Events\checkStatusEvent;

class VideoChatController extends Controller
{
    public function callUser(Request $request)
    {
        $data['userToCall'] = $request->user_to_call;
        $data['signalData'] = $request->signal_data;
        $data['from'] = Auth::id();
        $data['type'] = 'incomingCall';

        $user = User::where('id', '=', $request->user_to_call)->first();

        broadcast(new StartVideoChat($user, $data))->toOthers();
        broadcast(new checkStatusEvent($data))->toOthers();

    }

    public function acceptCall(Request $request)
    {
        $data['signal'] = $request->signal;
        $data['to'] = $request->to;
        $data['type'] = 'callAccepted';

        $user = User::where('id', '=', $request->to)->first();

        broadcast(new StartVideoChat($user, $data))->toOthers();
        broadcast(new checkStatusEvent($data))->toOthers();
        
    }
}
