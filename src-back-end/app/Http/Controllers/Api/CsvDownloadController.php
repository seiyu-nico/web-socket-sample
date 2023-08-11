<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Jobs\CsvCreating;

class CsvDownloadController extends Controller
{
    public function __invoke()
    {
        CsvCreating::dispatch();
        response()->json([
            'message' => 'csv creating started',
        ]);
    }
}

// \App\Jobs\CsvCreating::dispatch();
