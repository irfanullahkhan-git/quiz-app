@extends('quiz.layout')

@section('content')
<div class="login-container">
    <h2>Login</h2>
    <form action="{{ route('quiz.post_login') }}" method="POST" class="login-form">
        @csrf
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="pin">PIN</label>
            <input type="password" id="pin" name="pin" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
</div>

@endsection

@section('styles')
<style>
    .login-container {
        width: 100%;
        max-width: 400px;
        margin: 0 auto;
        padding: 30px;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
        color: #555;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        font-size: 16px;
    }

    .form-control:focus {
        border-color: #007bff;
        outline: none;
    }

    .btn {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }

    .btn:hover {
        background-color: #0056b3;
    }
</style>
@endsection

