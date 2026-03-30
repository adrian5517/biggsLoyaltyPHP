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
    $stmt = $pdo->query('
        SELECT id, title, description, images, contact, latitude, longitude, has_venue_hall 
        FROM biggs_branches 
        ORDER BY title ASC
    ');
    
    $branches = $stmt->fetchAll();

    // MySQL: images is stored as TEXT (JSON or comma-separated string)
    foreach ($branches as &$branch) {
        if ($branch['images']) {
            // Try to decode as JSON, fallback to comma-separated
            $decoded = json_decode($branch['images'], true);
            if (is_array($decoded)) {
                $branch['images'] = $decoded;
            } else {
                $branch['images'] = array_map('trim', explode(',', $branch['images']));
            }
        } else {
            $branch['images'] = [];
        }
        $branch['has_venue_hall'] = (bool) $branch['has_venue_hall'];
    }

    echo json_encode(['success' => true, 'data' => $branches]);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error', 'details' => $e->getMessage()]);
}
?>