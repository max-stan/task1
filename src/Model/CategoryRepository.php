<?php
declare(strict_types=1);
/**
 * @by ProfStep, inc. 10.11.2024
 * @website: https://profstep.com
 */

namespace Model;

use PDO;

/**
 * Class CategoryRepository
 */
class CategoryRepository
{
    public function getAll(): array
    {
        $connection = DbAdapter::getConnection();

        $result = $connection->query('
            SELECT categories.*, COUNT(category_product_relations.product_id) as products_count FROM categories
            LEFT JOIN category_product_relations ON categories.id = category_product_relations.category_id GROUP BY categories.id
        ');

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}