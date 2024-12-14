@extends('quiz.layout')

@section('content')
<h2>{{ isset($team) ? 'Edit Team' : 'Add Team' }}</h2>

<form action="{{ isset($team) ? route('teams.update', $team) : route('teams.store') }}" method="POST">
    @csrf
    @if (isset($team))
        @method('PUT')
    @endif
    <div class="mb-3">
        <label for="name" class="form-label">Team Name</label>
        <input type="text" name="name" id="name" class="form-control" value="{{ $team->name ?? '' }}" required>
    </div>
    <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea name="description" id="description" class="form-control">{{ $team->description ?? '' }}</textarea>
    </div>
    <button type="submit" class="btn btn-success">{{ isset($team) ? 'Update' : 'Save' }}</button>
</form>
@endsection
