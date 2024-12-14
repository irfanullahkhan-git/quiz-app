@extends('quiz.layout')

@section('content')
<h2>Matches</h2>
<a href="{{ route('matches.create') }}" class="btn btn-primary mb-3">Add Match</a>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Teams</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($matches as $match)
        <tr>
            <td>{{ $match->name }}</td>
            <td>{{ ucfirst($match->type) }}</td>
            <td>
                @foreach ($match->teams as $team)
                    <div>{{ $team->name }} (Score: {{ $team->pivot->score }})</div>
                @endforeach
            </td>
            <td>
                <a href="{{ route('matches.edit', $match) }}" class="btn btn-sm btn-warning">Edit</a>
                <a href="{{ route('matches.scoreboard', $match) }}" class="btn btn-sm btn-info">Scoreboard</a>
                <a href="{{ route('quiz.show', $match->type) }}" target="_blank" class="btn btn-sm btn-primary">Go to Quiz</a>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection
