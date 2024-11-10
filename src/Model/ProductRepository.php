<?php
declare(strict_types=1);
/**
 * @by ProfStep, inc. 10.11.2024
 * @website: https://profstep.com
 */

namespace Model;

use PDO;

/**
 * Class ProductRepository
 */
class ProductRepository
{
    /**
     * @param int $categoryId
     * @param array $sorting
     * @return array
     */
    public function getAllByCategoryId(int $categoryId, array $sorting = []): array
    {
        $connection = DbAdapter::getConnection();

        $sortString = '';
        foreach ($sorting as $key => $value) {
            $sortString = 'products.' . $key . ' ' . $value;
        }

        $result = $connection->prepare('
            SELECT products.* FROM products
            LEFT JOIN category_product_relations ON products.id = category_product_relations.product_id 
            WHERE category_product_relations.category_id = ?
            ' . ($sorting ? 'ORDER BY ' . $sortString : '') . '
        ');

        $result->execute([$categoryId]);

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }
}