<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/css/select2.min.css" rel="stylesheet"> -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/js/functions.js?v=1.0" type="text/javascript"></script>

</head>
<body>
    <div class="container my-4">
        <header class="d-flex justify-content-between align-items-center">
            <h1>Admin Panel</h1>
            <div>
                @if(session('quiz_admin'))
                    <a href="/teams">Teams</a>
                    <a href="/matches">Matches</a>
                    <a href="/quiz_logout">Logout</a>
                @endif
            </div>
            <img src="/byte-battle.jpg" style="width: 100px;">
        </header>
        <hr>
        <main>
            @yield('content')
        </main>
    </div>


    <!-- <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css?v=1.0" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js?v=1.0"></script>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js?v=1.0"></script> -->
    
</body>
</html>
