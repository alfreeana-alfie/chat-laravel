<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Events\StartGroupAudioChat;
use App\Models\User;

class GroupRequestAudioController extends Controller
{
    public function testing(Request $request)
    {
        $data['userToCall'] = $request->user_to_call;
        $data['signalData'] = $request->signal_data;
        $data['from'] = $request->from;
        $data['type'] = 'incomingCall';

        $user = User::where('id', '=', $request->user_to_call)->first();

        broadcast(new StartGroupAudioChat($user, $data))->toOthers();
        // broadcast(new checkStatusEvent($data))->toOthers();

    }
    
    public function acceptCall(Request $request)
    {
        $data['signal'] = $request->signal;
        $data['to'] = $request->to;
        $data['type'] = 'callAccepted';

        $user = User::where('id', '=', $request->to)->first();

        broadcast(new StartGroupAudioChat($user, $data))->toOthers();
        // broadcast(new checkStatusEvent($data))->toOthers();
        
    }
}
