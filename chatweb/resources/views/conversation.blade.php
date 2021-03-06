@extends('layouts.app')

@section('content')
<div class="app">
    <v-app>
        <main-screen user-name="{{ Auth::user()->name }}"></main-screen>
        
        <meta name="user-id" content="{{ Auth::user()->id }}">
        <meta name="user-name" content="{{ Auth::user()->name }}">
        <meta name="csrf-token" content="{{ csrf_token() }}">
    {{-- <button class="open-button" type="button" onclick="openForm()">Chat</button> --}}
    </v-app>
</div>
@endsection