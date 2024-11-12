<?php
declare(strict_types=1);

namespace Controller;

use Model\ProductRepository;
use Model\CategoryRepository;

/**
 * Class Base
 */
class Base
{
    public const DEFAULT_CATEGORY_ID = 1;
    public const SORTING_FIELDS = [
        'price' => [
            'price' => 'ASC'
        ],
        'aphabetic' => [
            'name' => 'ASC'
        ],
        'newest' => [
            'created_at' => 'DESC'
        ]
    ];

    /**
     * @var CategoryRepository
     */
    protected CategoryRepository $categoryRepository;

    /**
     * @var ProductRepository
     */
    protected ProductRepository $productRepository;

    public function __construct() {
        $this->categoryRepository = new CategoryRepository();
        $this->productRepository = new ProductRepository();
    }

    /**
     * @return void
     */
    public function index(): void
    {
        $categories = $this->categoryRepository->getAll();

        $currentCategoryId = $_GET['category'] ?? static::DEFAULT_CATEGORY_ID;

        $currentSorting = $_GET['sorting'] ?? null;
        $sorting = static::SORTING_FIELDS[$currentSorting] ?? [];

        $products = $this->productRepository->getAllByCategoryId((int)$currentCategoryId, $sorting);

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            echo json_encode($products);
            die();
        }

        include_once ROOT_PATH . '/src/views/base/header.phtml';
        include_once ROOT_PATH . '/src/views/pages/index.phtml';
        include_once ROOT_PATH . '/src/views/base/footer.phtml';
    }
}