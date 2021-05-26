<?php

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('chat', function ($user) {
    return $user;
});

Broadcast::channel('group-chat', function ($user) {
    return $user;
});

Broadcast::channel('create-group', function ($user) {
    return $user->name;
});

Broadcast::channel('request', function ($user) {
    return $user->name;
});

Broadcast::channel('accept-friend', function ($user) {
    return $user->name;
});

Broadcast::channel('reject-friend', function ($user) {
    return $user->name;
});

Broadcast::channel('checkOnline', function ($user) {
    return ['id' => $user->id, 'name' => $user->name];
});

Broadcast::channel('DemoAudio.{id}', function ($user, $id) {
    return $user->id === (int) $id;
});

Broadcast::channel('Demo.{id}', function ($user, $id) {
    return $user->id === (int) $id;
});

Broadcast::channel('GroupDemo.{id}', function ($user, $id) {
    return $user->id === (int) $id;
});

Broadcast::channel('GroupAudioDemo.{id}', function ($user, $id) {
    return $user->id === (int) $id;
});


// Dynamic Presence Channel for Streaming
Broadcast::channel('streaming-channel.{streamId}', function ($user) {
    return ['id' => $user->id, 'name' => $user->name];
});

// Signaling Offer and Answer Channels
Broadcast::channel('stream-signal-channel.{userId}', function ($user, $userId) {
    return (int) $user->id === (int) $userId;
});

