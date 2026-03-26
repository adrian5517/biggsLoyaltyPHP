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
    $stmt = $pdo->query('
        SELECT id, title, description, images, contact, latitude, longitude, has_venue_hall 
        FROM biggs_branches 
        ORDER BY title ASC
    ');
    
    $branches = $stmt->fetchAll();

    // PostgreSQL arrays return as strings like "{image.png,image2.png}".
    // We need to format them back into clean PHP arrays for our JSON output.
    foreach ($branches as &$branch) {
        $rawImages = trim($branch['images'], '{}');
        $branch['images'] = $rawImages ? explode(',', $rawImages) : [];
        $branch['has_venue_hall'] = (bool) $branch['has_venue_hall']; 
    }

    echo json_encode(['success' => true, 'data' => $branches]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error', 'details' => $e->getMessage()]);
}
?>