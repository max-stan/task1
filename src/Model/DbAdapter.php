<?php
declare(strict_types=1);
/**
 * @by ProfStep, inc. 10.11.2024
 * @website: https://profstep.com
 */

namespace Model;

use PDO;

/**
 * Class DbAdapter
 */
class DbAdapter
{
    /**
     * @var PDO|null
     */
    private static ?PDO $connection = null;

    private function __construct() {}

    /**
     * @return PDO
     */
    public static function getConnection(): PDO
    {
        if (self::$connection) {
            return self::$connection;
        }

        self::$connection = new \PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USERNAME, DB_PASSWORD);
        return self::$connection;
    }
}