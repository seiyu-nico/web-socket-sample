<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Jobs\CsvCreating;

class CsvDownloadController extends Controller
{
    public function __invoke()
    {
        \Log::info('csv download api called');
        CsvCreating::dispatch()->onQueue('jobs');

        return response()->json([
            'message' => 'csv creating started',
        ]);
    }
}
