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

    public function show($user_id){
        $user = User::findOrFail($user_id);

        return $user;
    }

    public function getName(Request $request){
        $user = User::where('id', $request['id'])->pluck('name');
        return $user;
    }
}
