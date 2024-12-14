<!-- resources/views/buzzer/display.blade.php -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buzzer Page</title>
    <style>
        h1 {
            color: blue;
            text-align: center;
        }

        #buzzer {
            width: 150px;
            height: 150px;
            background-color: red;
            border-radius: 50%;
            cursor: pointer;
            margin: auto;
        }
    </style>
</head>
<body>
<header style="text-align: center;">
    <img src="/byte-battle.jpg" style="width: 180px;">
</header>

<h1>{{ $teamName }}</h1>

<div id="buzzer"></div>

<script>

document.addEventListener("DOMContentLoaded", function() {
    // Add click event listener to the buzzer
    document.getElementById("buzzer").addEventListener("click", function() {
        // Send an Ajax request when the buzzer is clicked
        var teamName = "{{ $teamName }}";
        document.getElementById("buzzer").style.backgroundColor = "green";
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/store-buzzer", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        // Add CSRF token to the request headers
        var csrfToken = document.head.querySelector('meta[name="csrf-token"]').content;
        xhr.setRequestHeader("X-CSRF-Token", csrfToken);

        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                // Handle the response from the server if needed
                console.log(xhr.responseText);
                setTimeout(function() {
                    // Change the color back to red
                    document.getElementById("buzzer").style.backgroundColor = "red";
                }, 3000);
            }
        };

        // Send the teamName data to the server
        var formData = "teamName=" + encodeURIComponent(teamName);
        xhr.send(formData);
    });
});


</script>

</body>
</html>
