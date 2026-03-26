<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}
require_once '../includes/db.php';

try {
    $stmt = $pdo->query('SELECT m_id, m_title FROM menu ORDER BY m_title ASC');
    $menu = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($menu);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode([]);
}
