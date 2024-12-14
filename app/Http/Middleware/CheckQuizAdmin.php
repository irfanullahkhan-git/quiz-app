<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class CheckQuizAdmin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        // Check if the 'quiz_admin' session exists and has the value 'admin'
        if (session('quiz_admin') !== 'admin') {
            // Redirect to the login page with an error message
            return redirect()->route('quiz.login')->withErrors(['access_denied' => 'Access denied. Admin privileges required.']);
        }

        return $next($request);
    }
}
