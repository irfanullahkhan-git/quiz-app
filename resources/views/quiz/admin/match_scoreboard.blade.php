
@extends('quiz.layout')

@section('content')
<h2>Scoreboard for {{ $match->name }}</h2>

<form action="{{ route('matches.updateScores', $match) }}" method="POST">
    @csrf
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Team</th>
                <th>Score</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($match->teams as $team)
            <tr>
                <td>{{ $team->name }}</td>
                <td>
                    <input type="number" name="scores[{{ $team->id }}]" 
                           value="{{ old('scores.' . $team->id, $team->pivot->score) }}" 
                           class="form-control" required>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <button type="submit" class="btn btn-success">Update Scores</button>
    <button type="button" class="reset_buzzer btn btn-primary" id="resetBuzzerButton">Reset Buzzers</button>

</form>

<script>
$(document).ready(function() {
    $('#resetBuzzerButton').on('click', function(event) {
        event.preventDefault(); // Prevent default behavior

        const button = $(this); // Cache the button element
        const originalText = button.text(); // Store the original button text
        button.prop('disabled', true).text('Deleting Buzzers...'); // Disable the button and change text

        const deleteEndpoint = '/delete-all-buzzers';
        const csrfToken = $('meta[name="csrf-token"]').attr('content');

        $.ajax({
            url: deleteEndpoint,
            type: 'DELETE',
            headers: {
                'X-CSRF-Token': csrfToken
            },
            success: function(response) {
                console.log(response.message);
                alert('Buzzers reset successfully!');
            },
            error: function(xhr) {
                console.error('Error deleting buzzers. Status code:', xhr.status);
                alert('Failed to reset buzzers. Please try again.');
            },
            complete: function() {
                button.prop('disabled', false).text(originalText); // Re-enable the button and reset text
            }
        });
    });
});


</script>
@endsection
