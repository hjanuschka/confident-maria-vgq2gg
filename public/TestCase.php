<?php

namespace Tests;

use App\Models\User;
use Illuminate\Contracts\Console\Kernel;
use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use Illuminate\Foundation\Testing\TestResponse;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;

    public function setUp(): void
    {
        parent::setUp();
        $this->artisan('db:seed');
    }

    protected function getSnapshotDirectory(): string
    {
        $subdirectory = property_exists($this, 'snapshotSubdirectory')
            ? DIRECTORY_SEPARATOR . ltrim($this->snapshotSubdirectory, DIRECTORY_SEPARATOR)
            : '';

        return base_path('tests/Files/_snapshots_' . $subdirectory);
    }

    protected function getFileSnapshotDirectory(): string
    {
        $subdirectory = property_exists($this, 'fileSnapshotSubdirectory')
            ? DIRECTORY_SEPARATOR . ltrim($this->fileSnapshotSubdirectory, DIRECTORY_SEPARATOR)
            : '';

        return base_path('tests/Files/_file-snapshots_' . $subdirectory);
    }

    public function assertMatchesJsonSnapshot($actual)
    {
        if ($actual instanceof TestResponse) {
            $actual = $actual->getContent();
        }

        $this->assertMatchesSnapshot($actual, new JsonDriver());
    }

    protected function seedUsers()
    {
        return $this->seed('UsersTableSeeder');
    }

    protected function apiLogin($user = null)
    {
        $user = $user ?: factory(User::class)->create();

        return $this->actingAs($user, 'api');
    }

    public function createApplication()
    {
        $app = require __DIR__ . '/../bootstrap/app.php';

        $app->make(Kernel::class)->bootstrap();

        return $app;
    }
}
