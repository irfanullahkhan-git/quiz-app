<!DOCTYPE html>
<html lang="en">
<head>

    <!-- c53821 - Red -->
    <!-- c6a019 - Yellow -->
    <!-- 00060f - Black -->
    <?php
        $array[] = array("team" => "CodeMasters", "score" => "40");
        $array[] = array("team" => "BitBlaster", "score" => "30");
        // echo json_encode($array);
    ?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>Quiz</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <style>
        /* body {
            background-color: #c6a019;
            color: #ffffff;
        } */
        .quiz-container {
            max-width: 100%;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
            margin-top: 5px;
            /* border-radius: 10px; */
            overflow: hidden;
        }
        .question {
            font-size: 30px;
            margin-bottom: 20px;
            padding: 10px;
            margin: 10px;
            cursor: pointer;
            /* background-color: #c6a019; */
            border: 2px solid #00060f;
            color: #00060f;
            border-radius: 5px;
            text-align: center;
        }
        .option-container {
            display: flex;
            flex-wrap: wrap;
        }
        .option {
            /* flex: 0 0 calc(50% - 20px); 50% width with some margin */
            font-size: 30px;
            width: 49%;
            padding: 10px;
            margin: 10px;
            cursor: pointer;
            background-color: #c6a019;
            border: 1px solid #c6a019;
            color: #ffffff;
            border-radius: 5px;
            transition: background-color 0.3s, border-color 0.3s, color 0.3s;
        }
        .option:hover {
            background-color: #00214B;
            border-color: #00214B;
        }
        .selected {
            background-color: #0B25F4 !important;
            border: 5px solid #FFD808 !important;
        }
        .wrong {
            background-color: #FF1616 !important;
            border-color: #FF1616 !important;
        }
        .correct {
            background-color: #00FF00 !important;
            border-color: #00FF00 !important;
            color: black;
            font-weight: bold;
        }
        .btn-primary {
            background-color: #c6a019;
            border-color: #c6a019;
        }
        .btn-primary:hover {
            background-color: #00214B;
            border-color: #00214B;
        }
        .btn-secondary {
            background-color: #FF1616;
            border-color: #FF1616;
        }
        .btn-secondary:hover {
            background-color: #D10D0D;
            border-color: #D10D0D;
        }
        .option-number{
            font-size: 40px;
            height: 100%;
            display: inline-block;
            padding: 6px;
            font-weight: bold;
            color: #FF1616;
        }
        .primary_color{
            background: #c6a019;
        }
        .option_no{
            background: white;
            color: #fe1616;
            font-size: 40px !important;
            font-weight: bold;
            border-radius: 27%;
            padding: 5px 15px;
        }
        .team_name{
            width: 100%;
            font-size: 34px;
            color: white;
            font-weight: bold;
            text-align: center;
            background: #0047ab;
        }
        .team_score{
            width: 100%;
            font-size: 60px;
            color: #ff1717;
            font-weight: bold;
            text-align: center;
        }
        .scoreboard table{
            width: 100%;
        }
        .scoreboard_container h1{
            color: #c53922;
            font-weight: bold;
            padding: 10px 0px;
        }
        .quiz-container{
            border: 5px solid #c6a019;
            border-radius: 10px;
        }
        .buzzers .team_name {
            margin: 10px 0px;
        }

        .buzzers .team_name{padding: 10px;}
        .buzzers table{width: 80%}

        @keyframes fall {
            0% {
                transform: translateY(-100%) rotate(0deg);
            }
            100% {
                transform: translateY(100vh) rotate(720deg);
            }
        }

        .confetti {
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <div class="row">

        <div class="col-2 scoreboard_container">
            <h1>Score Board</h1>
            <div class="scoreboard">Loading...</div>

        </div>
        <div class="col-8">
            <div class="quiz-container">
                <div style="text-align: center;"><img src='/byte-battle.jpg' style="width: 29%"/></div>
                <div id="question-container">
                    {{-- Question and options will be loaded here dynamically --}}
                </div>
                <div class="text-center mt-4">
                    <button class="btn btn-primary" id="checkBtn" onclick="checkAnswer()">Check</button>
                    <button class="btn btn-info" id="correctBtn" onclick="showCorrect()" style="display: none;">Show Correct Answer</button>
                    <button class="btn btn-secondary" id="nextBtn" onclick="loadNextQuestion()" style="display: none;">Next</button>
                </div>
            </div>
        </div>

        <div class="col-2">
            <h1>Buzzers</h1>
            <div class="buzzers"></div>
        </div>
    </div>


    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

    <script>
        var question = @json($question);
        var selectedOption = null;
        let option_numbers = ["A", "B", "C", "D"];

        // Function to load the current question and options
        function loadQuestion() {
            var optionsHtml = "<div class='question'>" + question.question + "</div><div class='option-container justify-content-center'>";

            let options = [question.option_a, question.option_b, question.option_c, question.option_d];
            
            optionsHtml += "<div class='row' style='width: 100%'>";
            options.forEach(function (option, index) {
                optionsHtml += "<div class='option_"+option_numbers[index]+" primary_color m-1 option text-center' onclick='selectOption(this, " + index + ")'>" +
                               "<span class='col-2 option_no' style='font-size: 30px'>" + option_numbers[index] + "</span><br/>" + option +
                               "</div>";
            });
            optionsHtml += "</div>";


            optionsHtml += "</div>";

            $("#question-container").html(optionsHtml);
            $("#checkBtn").prop("disabled", true);
            $("#nextBtn").hide();
            $("#correctBtn").hide();
        }

        // Function to select an option
        function selectOption(element, index) {
            $(".option").removeClass("selected");
            $(element).addClass("selected");
            selectedOption = index;
            $("#checkBtn").prop("disabled", false);
        }

        // Function to check the selected answer
        function checkAnswer() {
            $(".option").removeClass("correct wrong");
            document.body.style.transition = "background-color 0.3s";
            if (selectedOption === null) {
                return;
            }

            if (question.correct_option === option_numbers[selectedOption]) {
                $(".selected").addClass("correct");
                document.body.style.backgroundColor = "#00FF00"; // Green for correct
                playSound("correct.mp3");
                displayCelebration();
                $("#correctBtn").hide();
            } else {
                $(".selected").addClass("wrong");
                document.body.style.backgroundColor = "#FF1616"; // Red for wrong
                playSound("wrong.mp3");
                $("#correctBtn").show();
            }

            $("#nextBtn").show();
            setTimeout(() => {
                document.body.style.backgroundColor = "#FFFFFF";
            }, 2000);
        }

        function showCorrect(){
            $(".option_"+question.correct_option).addClass("correct"); 
        }

        // Function to load the next question
        function loadNextQuestion() {
            if (confirm("Are you sure you want to move to the next question?")) {
                // Assuming you have a route named 'updateQuestion' to update the question record
                $.ajax({
                    url: '/updateQuestion', // Replace with your actual route URL
                    method: 'POST',
                    data: { 
                        questionId: question.id,
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function(response) {
                        // If the update was successful, reload the page
                        if (response.success) {
                            location.reload();
                        } else {
                            alert('Failed to update the question.');
                        }
                    },
                    error: function() {
                        alert('An error occurred while updating the question.');
                    }
                });
            }
        }


        // Initial load
        loadQuestion();
        function listenBuzzers() {
            // Replace 'your_server_endpoint' with the actual endpoint to fetch JSON data
            const serverEndpoint = '/fetch-buzzers';
            
            // Define a function to fetch data from the server and update the HTML content
            function fetchDataAndUpdateHtml() {
                fetch(serverEndpoint)
                    .then(response => response.json())
                    .then(data => {
                        // Clear the existing content in the HTML wrapper
                        const table = document.createElement('table');
                        const header = "<h1>Buzzer</h1>";
                        // Loop through JSON data and create rows
                        data.teamNames.forEach(entry => {
                            const row = table.insertRow();

                            const teamCell = row.insertCell(0);
                            teamCell.className = 'team_name';
                            teamCell.textContent = entry;

                            const score_row = table.insertRow();
                            const scoreCell = score_row.insertCell(0);
                            scoreCell.className = 'team_score';
                            scoreCell.textContent = "";
                        });
                        $(".buzzers").html(table);

                        const score_table = document.createElement('table');

                        // Loop through JSON data and create rows
                        data.latestScoreData.forEach(entry => {
                            const row = score_table.insertRow();

                            const teamCell = row.insertCell(0);
                            teamCell.className = 'team_name';
                            teamCell.textContent = entry.team;

                            const score_row = score_table.insertRow();
                            const scoreCell = score_row.insertCell(0);
                            scoreCell.className = 'team_score';
                            scoreCell.textContent = entry.score;
                        });
                        $(".scoreboard").html(score_table);
                    })
                    .catch(error => {
                        console.error('Error fetching data:', error);
                    });
            }

            // Fetch data and update HTML initially

            // Set up an interval to fetch data and update HTML every 2 seconds
            setInterval(fetchDataAndUpdateHtml, 2000);
        }

// Call the function to start listening for updates
listenBuzzers();

function deleteAllBuzzers() {
    // Replace 'your_delete_endpoint' with the actual endpoint for deleting all buzzers
    const deleteEndpoint = '/delete-all-buzzers';

    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();

    // Configure it as a DELETE request to the specified endpoint
    xhr.open('DELETE', deleteEndpoint, true);

    // Include CSRF token if your Laravel application uses CSRF protection
    var csrfToken = document.head.querySelector('meta[name="csrf-token"]').content;
    xhr.setRequestHeader('X-CSRF-Token', csrfToken);

    // Set up a callback function to handle the response
    xhr.onreadystatechange = function() {
        if (xhr.readyState == 4) {
            if (xhr.status == 200) {
                // Success, handle the response data if needed
                var responseData = JSON.parse(xhr.responseText);
                console.log(responseData.message);
            } else {
                // Error handling
                console.error('Error deleting buzzers. Status code:', xhr.status);
            }
        }
    };

    // Send the DELETE request
    xhr.send();
}

// Call the function when needed, for example, when a button is clicked

    </script>

    <script>
        function playSound(filename) {
            const audio = new Audio(`/${filename}`);
            audio.play();
        }

// Function to display celebration effect for correct answers
function displayCelebration() {
    // Add popper effect
    const confettiContainer = document.createElement('div');
    confettiContainer.id = 'confetti-container';
    confettiContainer.style.position = 'fixed';
    confettiContainer.style.top = '0';
    confettiContainer.style.left = '0';
    confettiContainer.style.width = '100%';
    confettiContainer.style.height = '100%';
    confettiContainer.style.zIndex = '1000';
    confettiContainer.style.pointerEvents = 'none';
    document.body.appendChild(confettiContainer);

    // Use a confetti library or simple effect
    for (let i = 0; i < 300; i++) {
        const confetti = document.createElement('div');
        confetti.className = 'confetti';
        confetti.style.position = 'absolute';
        confetti.style.width = '20px';
        confetti.style.height = '20px';
        confetti.style.backgroundColor = `hsl(${Math.random() * 360}, 100%, 50%)`;
        confetti.style.left = `${Math.random() * 100}%`;
        confetti.style.animation = `fall ${Math.random() * 2 + 3}s ease-in-out`;
        confetti.style.transform = `rotate(${Math.random() * 360}deg)`;
        confettiContainer.appendChild(confetti);
    }

    setTimeout(() => {
        confettiContainer.remove();
    }, 4000); // Remove confetti after 4 seconds
}



</script>


</body>
</html>
