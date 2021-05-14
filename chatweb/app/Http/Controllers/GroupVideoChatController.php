<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Events\StartGroupVideoChat;
use App\Models\User;

class GroupVideoChatController extends Controller
{
    public function testing(Request $request)
    {
        $data['userToCall'] = $request->user_to_call;
        $data['signalData'] = $request->signal_data;
        $data['from'] = Auth::id();
        $data['type'] = 'incomingCall';

        $user = User::where('id', '=', $request->user_to_call)->first();

        broadcast(new StartGroupVideoChat($user, $data))->toOthers();
    }
    public function acceptTestCall(Request $request)
    {
        $data['signal'] = $request->signal;
        $data['to'] = $request->to;
        $data['type'] = 'callAccepted';

        $user = User::where('id', '=', $request->to)->first();

        broadcast(new StartGroupVideoChat($user, $data))->toOthers();
    }
}
