@extends('quiz.layout')

@section('content')
<h2>Teams</h2>
<a href="{{ route('teams.create') }}" class="btn btn-primary mb-3">Add Team</a>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($teams as $team)
        <tr>
            <td>{{ $team->id }}</td>
            <td>{{ $team->name }}</td>
            <td>{{ $team->description }}</td>
            <td>
                <a href="{{ route('teams.edit', $team) }}" class="btn btn-sm btn-warning">Edit</a>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection
