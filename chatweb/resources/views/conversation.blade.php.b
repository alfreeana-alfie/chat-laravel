@extends('layouts.app')

@section('content')
<div class="app">
    <v-app>
        <video-chat></video-chat>
        
        <meta name="user-id" content="{{ Auth::user()->id }}">
        <meta name="user-name" content="{{ Auth::user()->name }}">
        <meta name="csrf-token" content="{{ csrf_token() }}">
    {{-- <button class="open-button" type="button" onclick="openForm()">Chat</button> --}}
    </v-app>
</div>
@endsection

@extends('layouts.app')

<div class="content">
   <div class="title m-b-md">
       Video Chat Rooms
   </div>

   {!! Form::open(['url' => 'room/create']) !!}
       {!! Form::label('roomName', 'Create or Join a Video Chat Room') !!}
       {!! Form::text('roomName') !!}
       {!! Form::submit('Go') !!}
   {!! Form::close() !!}

   @if($rooms)
   @foreach ($rooms as $room)
       <a href="{{ url('/room/join/'.$room) }}">{{ $room }}</a>
   @endforeach
   @endif
</div>
