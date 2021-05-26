@extends('layouts.app')


@section('content')
    {{-- <combine/> --}}
    {{-- <a href="http://127.0.0.1:8000/streaming/112acde2">Click</a> --}}

    <meta name="user-id" content="{{ Auth::user()->id }}">
    <meta name="user-name" content="{{ Auth::user()->name }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    
    {{-- @if ($type === 'broadcaster')
        <broadcaster :auth_user_id="{{ $id }}" env="{{ env('APP_ENV') }}"/>

    @else
        <viewer stream_id="{{ $streamId }}" :auth_user_id="{{ $id }}"/>
    @endif --}}
@endsection