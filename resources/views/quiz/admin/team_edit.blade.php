@extends('quiz.layout')

@section('content')
<h2>Edit Team</h2>

@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<form action="{{ route('teams.update', $team) }}" method="POST">
    @csrf
    @method('PUT')
    
    <div class="mb-3">
        <label for="name" class="form-label">Team Name</label>
        <input type="text" name="name" id="name" class="form-control" 
               value="{{ old('name', $team->name) }}" required>
    </div>
    
    <div class="mb-3">
        <label for="description" class="form-label">Description</label>
        <textarea name="description" id="description" class="form-control" rows="3">{{ old('description', $team->description) }}</textarea>
    </div>
    
    <button type="submit" class="btn btn-success">Update Team</button>
    <a href="{{ route('teams.index') }}" class="btn btn-secondary">Cancel</a>
</form>
@endsection
