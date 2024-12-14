@extends('quiz.layout')

@section('content')
<h2>{{ isset($match) ? 'Edit Match' : 'Add Match' }}</h2>

<form action="{{ isset($match) ? route('matches.update', $match) : route('matches.store') }}" method="POST">
    @csrf
    @if (isset($match)) @method('PUT') @endif
    
    <div class="mb-3">
        <label for="name" class="form-label">Match Name</label>
        <input type="text" name="name" id="name" class="form-control" 
               value="{{ old('name', $match->name ?? '') }}" required>
    </div>
    
    <div class="mb-3">
        <label for="type" class="form-label">Match Type</label>
        <select name="type" id="type" class="form-select" required>
            <option value="ict" {{ old('type', $match->type ?? '') == 'ict' ? 'selected' : '' }}>ICT</option>
            <option value="general knowledge" {{ old('type', $match->type ?? '') == 'general knowledge' ? 'selected' : '' }}>General Knowledge</option>
        </select>
    </div>

    <div class="mb-3">
        <label class="form-label">Teams and Scores</label>
        <button type="button" id="addTeam" class="btn btn-sm btn-primary mb-2">+ Add Team</button>
        <div id="teamsContainer">
            @if (isset($match) && $match->teams)
                @foreach ($match->teams as $team)
                <div class="team-band d-flex align-items-center mb-2">
                    <select name="teams[]" class="form-select me-2" required>
                        @foreach ($teams as $availableTeam)
                            <option value="{{ $availableTeam->id }}" {{ $availableTeam->id == $team->id ? 'selected' : '' }}>
                                {{ $availableTeam->name }}
                            </option>
                        @endforeach
                    </select>
                    <input type="number" name="scores[]" class="form-control me-2" placeholder="Score" value="{{ $team->pivot->score }}" required>
                    <button type="button" class="btn btn-sm btn-danger removeTeam">&times;</button>
                </div>
                @endforeach
            @endif
        </div>
    </div>

    <button type="submit" class="btn btn-success">{{ isset($match) ? 'Update Match' : 'Save Match' }}</button>
</form>


<script>
    $(document).ready(function () {
        const teams = @json($teams);

        $("#addTeam").click(function () {
            const teamOptions = teams.map(team => `<option value="${team.id}">${team.name}</option>`).join('');
            const teamBand = `
                <div class="team-band d-flex align-items-center mb-2">
                    <select name="teams[]" class="form-select me-2" required>
                        ${teamOptions}
                    </select>
                    <input type="number" name="scores[]" class="form-control me-2" placeholder="Score" required>
                    <button type="button" class="btn btn-sm btn-danger removeTeam">&times;</button>
                </div>`;

            $("#teamsContainer").append(teamBand);
        });

        $(document).on("click", ".removeTeam", function () {
            $(this).closest(".team-band").remove();
        });
    });
</script>
@endsection
