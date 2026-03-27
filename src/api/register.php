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
    if (!isset($data[$field]) || $data[$field] === '' || $data[$field] === []) {
        http_response_code(400);
        echo json_encode(['error' => "Missing field: $field"]);
        exit;
    }
}

// Ensure favorite_menu is an array
if (!is_array($data['favorite_menu'])) {
    $data['favorite_menu'] = [$data['favorite_menu']];
}

//Explicitly cast empty strings or falsy values to strict booleans
$interested_events = filter_var($data['interested_in_events'] ?? false, FILTER_VALIDATE_BOOLEAN) ? 'true' : 'false';
$interested_franchise = filter_var($data['interested_in_franchise'] ?? false, FILTER_VALIDATE_BOOLEAN) ? 'true' : 'false';


// Insert user and favorite menus
try {
    $pdo->beginTransaction();

    
    $stmt = $pdo->prepare('
        INSERT INTO users (tag_id, phone_number, date_of_birth, frequented_biggs_location_id, interested_in_events, interested_in_franchise)
        VALUES (?, ?, ?, ?, ?, ?)
    ');
    $stmt->execute([
        $data['tag_id'],
        $data['phone_number'],
        $data['date_of_birth'],
        $data['frequented_biggs_location_id'],
        $interested_events,
        $interested_franchise
    ]);

    // Insert favorite menus into user_favorite_menu
    $stmtMenu = $pdo->prepare('INSERT INTO user_favorite_menu (user_tag_id, menu_id) VALUES (?, ?)');
    foreach ($data['favorite_menu'] as $menuId) {
        $stmtMenu->execute([$data['tag_id'], $menuId]);
    }

    $pdo->commit();
    http_response_code(201); // 201 Created
    echo json_encode(['success' => true, 'message' => 'User registered successfully']);
} catch (PDOException $e) {
    $pdo->rollBack();
    if ($e->getCode() === '23505') { // Unique violation (duplicate tag_id)
        http_response_code(409);
        echo json_encode(['error' => 'Tag ID already exists. Please use a different Tag ID.']);
    } else {
        http_response_code(500);
        echo json_encode(['error' => 'Database error', 'details' => $e->getMessage()]);
    }
}
?>

