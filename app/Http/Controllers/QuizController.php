<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\QuizQuestion;
use App\Models\Buzzer;
use App\Models\Team;
use App\Models\Game;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class QuizController extends Controller
{
    public function showQuestion($type = null)
    {
        $type = empty($type) ? 'ict' : $type;

        $question = QuizQuestion::where('updated_at', '0000-00-00 00:00:00')
                                ->where('type', $type)
                                ->inRandomOrder()
                                ->first();

        return view('quiz.quiz', compact('question'));
    }


    public function updateQuestion(Request $request)
    {
        $this->deleteAllBuzzers();
        $questionId = $request->input('questionId');

        // Find the question by ID and update the 'updated_at' field
        $question = QuizQuestion::find($questionId);
        if ($question) {
            $question->update(['updated_at' => now()]);
            return response()->json(['success' => true]);
        }

        return response()->json(['success' => false]);
    }

    public function displayBuzzer(Request $request, $teamName){
        return view('quiz.buzzer', ['teamName' => $teamName]);
    }

    public function store(Request $request)
{
    $teamName = $request->input('teamName'); // Update to match the variable name in the JavaScript code

    // Check if the team name already exists in the Buzzers table
    $existingTeam = Buzzer::where('team_name', $teamName)->first();

    if (!$existingTeam) {
        // Team name doesn't exist, create a new record
        Buzzer::create([
            'team_name' => $teamName,
            'buzzer_at' => now(), // You can adjust the timestamp as needed
        ]);

        return response()->json(['message' => 'Team name added successfully'], 201);
    } else {
        return response()->json(['message' => 'Team name already exists'], 200);
    }
}

    public function fetchBuzzers()
    {
        // Fetch team names and scores from the Buzzers table
        $buzzers = DB::table('buzzers')->select('team_name')->get();

        $latestScoreData = DB::table('score_data')
        ->orderBy('id', 'desc')
        ->first();

        // Prepare data for JSON response
        $data = [
            'teamNames' => $buzzers->pluck('team_name')->toArray(),
        ];
        if ($latestScoreData) {
            $data['latestScoreData'] = json_decode($latestScoreData->score_json, true);
        }

        return response()->json($data);
    }

    public function deleteAllBuzzers()
    {
        // Delete all records from the Buzzers table
        Buzzer::truncate();

        return response()->json(['message' => 'All records deleted successfully'], 200);
    }

    // TEAMS 

    public function team_index()
    {
        $teams = Team::all();
        return view('quiz.admin.team_index', compact('teams'));
    }

    public function team_create()
    {
        return view('quiz.admin.team_create');
    }

    public function team_store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        Team::create($request->all());
        return redirect()->route('teams.index')->with('success', 'Team added successfully.');
    }

    public function team_edit(Team $team)
    {
        return view('quiz.admin.team_edit', compact('team'));
    }

    public function team_update(Request $request, Team $team)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        $team->update($request->all());
        return redirect()->route('teams.index')->with('success', 'Team updated successfully.');
    }


    public function match_index()
    {
        // $matches = DB::table('games')->get();
        // foreach ($matches as $match) {
        //     $match->teams; // This triggers a lazy load for the 'teams' relationship
        // }

        $matches = Game::with('teams')->get();
        return view('quiz.admin.match_index', compact('matches'));
    }

    public function match_create()
    {
        $teams = Team::all();
        return view('quiz.admin.match_create', compact('teams'));
    }

    public function match_store(Request $request)
{
    $request->validate([
        'name' => 'required|string|max:255',
        'type' => 'required|in:ict,general knowledge',
        'teams' => 'required|array',
        'teams.*' => 'exists:teams,id',
    ]);

    // Create a new Game instance
    $match = new Game();
    $match->name = $request->name;
    $match->type = $request->type;
    $match->save(); // Save the match

    // Attach teams to the match
    $match->teams()->attach($request->teams);

    return redirect()->route('matches.index')->with('success', 'Game added successfully.');
}


    public function match_edit(Game $match)
    {
        $teams = Team::all();
        $selectedTeams = $match->teams->pluck('id')->toArray();
        return view('quiz.admin.match_create', compact('match', 'teams', 'selectedTeams'));
    }

    public function match_update(Request $request, Game $match)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'type' => 'required|in:ict,general knowledge',
            'teams' => 'required|array',
            'teams.*' => 'exists:teams,id',
        ]);

        $match->update($request->only(['name', 'type']));
        $match->teams()->sync($request->teams);

        return redirect()->route('matches.index')->with('success', 'Game updated successfully.');
    }

    public function scoreboard(Game $match)
    {
        return view('quiz.admin.match_scoreboard', compact('match'));
    }

    public function updateScores(Request $request, Game $match)
    {
        $request->validate([
            'scores' => 'required|array',
            'scores.*' => 'integer|min:0',
        ]);

        foreach ($request->scores as $teamId => $score) {
            $match->teams()->updateExistingPivot($teamId, ['score' => $score]);
        }

        $updatedTeams = $match->teams->map(function ($team) {
            return [
                'team' => $team->name,
                'score' => $team->pivot->score,
            ];
        });

        $scoreJson = json_encode($updatedTeams);

        // Check if a record already exists, and update or insert accordingly
        \DB::table('score_data')->updateOrInsert(
            ['id' => $match->id], // Match ID or a unique identifier
            ['score_json' => $scoreJson]
        );
    
        return redirect()->back()->with('success', 'Scores updated successfully.');
    }


    public function showLoginForm()
    {
        return view('quiz.admin.login'); // Assuming your Blade view is quiz.login
    }

    public function login(Request $request)
    {
        // dd($request->username." - ".$request->pin);
        $username = 'admin'; 
        $pin = '1123';

        // Validate input
        $request->validate([
            'username' => 'required',
            'pin' => 'required|digits:4', 
        ]);
        if ($request->input('username') === $username && $request->input('pin') === $pin) {
            $request->session()->put('quiz_admin', "admin");
            return redirect()->route('matches.index'); // Adjust route as needed
        } else {
            // Return back with an error message
            return back()->withErrors(['login_error' => 'Invalid username or PIN.']);
        }
    }

    public function logout()
    {
        // Clear the quiz_admin session
        Session::forget('quiz_admin');
        return redirect()->route('quiz.login');
    }
}