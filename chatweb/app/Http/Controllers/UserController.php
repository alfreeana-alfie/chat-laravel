<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;


class UserController extends Controller
{
    public function index(){
        $user = User::where('id', '!=', auth()->user()->id)->get();
        
        return $user;
    }

    public function merchantID(){
        $user = User::where('id', '!=', auth()->user()->id)
        ->where('type', '=', '1')
        ->get();
        
        return $user;
    }

    public function memberID(){
        $user = User::where('id', '!=', auth()->user()->id)
        ->where('type', '=', '0')
        ->get();
        
        return $user;
    }

    public function singleID(Request $request){
        $user = User::where('id', '=', $request['id'])
        ->where('type', '=', '0')
        ->get();
        
        return $user;
    }

    public function show($user_id){
        $user = User::findOrFail($user_id);

        return $user;
    }

    public function getName(Request $request){
        $user = User::where('id', $request['id'])->pluck('name');
        return $user;
    }

    /**
     * Show user online status.
     *
     */
    public function userOnlineStatus(Request $request)
    {
        $users = User::where('id', $request['id'])->get();
    
        foreach ($users as $user) {
            if ($user->isOnline()) {
                return "Online";
            }else{
                return "Offline";
            }
        }
    }

    public function getFriendDetails(Request $request){
        $user = User::where('id', $request['id'])->get();

        return $user;
    }
}
