@extends('quiz.layout')

@section('content')
<h1>Select a Match</h1>
<form id="game-form">
    <label for="games">Select Game:</label>
    <select id="games" name="games">
        <option value="" selected disabled>Select a game</option>
        @foreach($games as $game)
            <option value="{{ $game->id }}">{{ $game->name }}</option>
        @endforeach
    </select>

    <br><br>

    <label for="teams">Select Team:</label>
    <select id="teams" name="teams" disabled>
        <option value="" selected disabled>Select a team</option>
    </select>

    <br><br>

    <button id="go-to-buzzer" type="button" disabled>Go to Buzzer</button>
</form>

<script>
    $(document).ready(function() {
        $('#games').on('change', function() {
            const gameId = $(this).val();
            if (gameId) {
                $.ajax({
                    url: `/games/${gameId}/teams`,
                    type: 'GET',
                    success: function(teams) {
                        const teamDropdown = $('#teams');
                        teamDropdown.empty().append('<option value="" selected disabled>Select a team</option>');
                        teams.forEach(team => {
                            teamDropdown.append(`<option value="${team.name}">${team.name}</option>`);
                        });
                        teamDropdown.prop('disabled', false);
                    }
                });
            }
        });

        $('#teams').on('change', function() {
            $('#go-to-buzzer').prop('disabled', false);
        });

        $('#go-to-buzzer').on('click', function() {
            const teamName = $('#teams').val();
            if (teamName) {
                window.location.href = `/buzzer/${teamName}`;
            }
        });
    });
</script>
@endsection