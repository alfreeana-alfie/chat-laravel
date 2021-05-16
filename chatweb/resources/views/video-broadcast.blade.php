@extends('layouts.app')


@section('content')
    @if ($type === 'broadcaster')
        <broadcaster :auth_user_id="{{ $id }}" env="{{ env('APP_ENV') }}"/>

    @else
        <viewer stream_id="{{ $streamId }}" :auth_user_id="{{ $id }}"/>
    @endif
@endsection