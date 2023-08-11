<?php

namespace App\Jobs;

use App\Events\CsvCreating as CsvCreatingEvent;
use App\Events\CsvDownload as CsvDownloadEvent;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CsvCreating implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     */
    public function __construct()
    {
        //
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        \Log::info('CsvCreating job started');
        $range = range(0, 100, 10);
        foreach ($range as $i) {
            sleep(1);
            event(new CsvCreatingEvent($i));
        }

        $csv = [
            ['id', 'name', 'email'],
            [1, 'John', 'test@test.com'],
        ];

        event(new CsvDownloadEvent($csv));
    }
}
