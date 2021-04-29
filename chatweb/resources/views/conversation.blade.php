@extends('layouts.app')

@section('content')
    {{-- <user-list :user="{{ auth()->user() }}" class="chat-popup" id="myForm"></user-list> --}}
    <main-screen></main-screen>

    {{-- <button class="open-button" type="button" onclick="openForm()">Chat</button> --}}

    <meta name="user-id" content="{{ Auth::user()->id }}">
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

<style>
    .open-button {
        background-color: rgb(245, 245, 245);
        padding: 16px 20px;
        border: none;
        cursor: pointer;
        opacity: 0.8;
        position: fixed;
        bottom: 23px;
        right: 25px;
        width: 100px;
    }
        /* The popup chat - hidden by default */
    .chat-popup {
        display: block;
        /* z-index: 9; */
    }
    </style>

{{-- Start Here (Script) --}}
<script>
    var isChecked = false;

    function openForm() {
        isChecked = !isChecked;

        if(isChecked == true){
            document.getElementById("myForm").style.display = "block";
        }else{
            document.getElementById("myForm").style.display = "none";
        }
        console.log(isChecked);
    }
    </script>