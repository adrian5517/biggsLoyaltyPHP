<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); // Allow frontend to call this API
header('Access-Control-Allow-Methods: POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type');

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}

require_once '../includes/db.php';

// Get JSON input
$data = json_decode(file_get_contents('php://input'), true);
if (!$data) {
    http_response_code(400);
    echo json_encode(['error' => 'Invalid JSON input']);
    exit;
}

// Validate required fields
$required = ['tag_id', 'phone_number', 'date_of_birth', 'favorite_menu', 'frequented_biggs_location_id'];
foreach ($required as $field) {
    if (empty($data[$field])) {
        http_response_code(400);
        echo json_encode(['error' => "Missing field: $field"]);
        exit;
    }
}

// BEST PRACTICE: Explicitly cast empty strings or falsy values to strict booleans
$interested_events = filter_var($data['interested_in_events'] ?? false, FILTER_VALIDATE_BOOLEAN) ? 'true' : 'false';
$interested_franchise = filter_var($data['interested_in_franchise'] ?? false, FILTER_VALIDATE_BOOLEAN) ? 'true' : 'false';

// Insert user
try {
    $stmt = $pdo->prepare('
        INSERT INTO users (tag_id, phone_number, date_of_birth, favorite_menu, frequented_biggs_location_id, interested_in_events, interested_in_franchise) 
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ');
    
    $stmt->execute([
        $data['tag_id'],
        $data['phone_number'],
        $data['date_of_birth'],
        $data['favorite_menu'],
        $data['frequented_biggs_location_id'],
        $interested_events,
        $interested_franchise
    ]);
    
    http_response_code(201); // 201 Created
    echo json_encode(['success' => true, 'message' => 'User registered successfully']);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error', 'details' => $e->getMessage()]);
}
?>

