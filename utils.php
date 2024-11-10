<?php
declare(strict_types=1);

function getBaseUrl(): string {
    return (empty($_SERVER['HTTPS']) ? 'http' : 'https') . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
}

function getUrl(array $params = []): string {
    $baseUrl = getBaseUrl();

    $url = parse_url($baseUrl) ?? '';
    parse_str($url['query'] ?? '', $existingParams);

    $params = array_merge($existingParams, $params);

    return $url['scheme']
        . '://'
        . $url['host']
        . ($url['path'] !== '/' ? $url['path'] : '')
        . ($params ? '?' . http_build_query($params) : '');
}