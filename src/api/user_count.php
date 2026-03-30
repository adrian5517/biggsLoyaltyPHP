<?php
// Bulletproof CORS headers for all request types
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Authorization');
header('Content-Type: application/json');
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

require_once '../includes/db.php';

try {
    $stmt = $pdo->query('SELECT COUNT(*) AS total FROM btc_profile');
    $row = $stmt->fetch();
    echo json_encode(['success' => true, 'count' => (int)$row['total']]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => 'Database error', 'details' => $e->getMessage()]);
}
