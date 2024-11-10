<?php
declare(strict_types=1);

spl_autoload_register(function ($class) {
    $path = __DIR__ . DIRECTORY_SEPARATOR . str_replace('\\', DIRECTORY_SEPARATOR, $class) . '.php';

    include_once $path;
});