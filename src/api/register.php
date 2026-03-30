<?php
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *'); 
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
$required = ['tag_id', 'name', 'phone_number', 'birthday', 'favorite_menu_code', 'frequented_biggs_location_id'];
foreach ($required as $field) {
    if (!isset($data[$field]) || $data[$field] === '' || $data[$field] === []) {
        http_response_code(400);
        echo json_encode(['error' => "Missing field: $field"]);
        exit;
    }
}

// Validate that favorite_menu_code exists in menu.m_code
$menuCheckStmt = $pdo->prepare('SELECT COUNT(*) FROM menu WHERE m_code = ?');
$menuCheckStmt->execute([$data['favorite_menu_code']]);
$menuCount = $menuCheckStmt->fetchColumn();
if ($menuCount == 0) {
    // Log the value for debugging
    file_put_contents(__DIR__ . '/../error.log', date('c') . ' | DEBUG | favorite_menu_code received: ' . var_export($data['favorite_menu_code'], true) . ' | count: ' . $menuCount . PHP_EOL, FILE_APPEND);
    http_response_code(400);
    echo json_encode([
        'error' => 'Invalid favorite_menu_code: menu item does not exist.',
        'debug_favorite_menu_code' => $data['favorite_menu_code'],
        'debug_count' => $menuCount
    ]);
    exit;
}

//Explicitly cast empty strings or falsy values to strict booleans

$interested_events = filter_var($data['interested_in_events'] ?? false, FILTER_VALIDATE_BOOLEAN) ? 1 : 0;
$interested_franchise = filter_var($data['interested_in_franchise'] ?? false, FILTER_VALIDATE_BOOLEAN) ? 1 : 0;


// Insert user and favorite menus
try {

    $pdo->beginTransaction();

    // Map API fields to btc_profile columns
    $stmt = $pdo->prepare('
        INSERT INTO btc_profile (
            tag_uid,
            phone_number,
            name,
            birthday,
            fave_location,
            fave_item,
            events_flag,
            franchising_flag,
            password,
            email,
            created_at
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())
    ');
    $stmt->execute([
        $data['tag_id'], // tag_uid
        $data['phone_number'],
        $data['name'],
        $data['birthday'],
        $data['frequented_biggs_location_id'], // fave_location
        $data['favorite_menu_code'], // fave_item
        $interested_events, // events_flag
        $interested_franchise, // franchising_flag
        '', // password (empty string)
        $data['email'] ?? null 
    ]);

    $pdo->commit();
    http_response_code(201); // 201 Created
    echo json_encode(['success' => true, 'message' => 'User registered successfully']);
} catch (PDOException $e) {
    $pdo->rollBack();
    file_put_contents(__DIR__ . '/../error.log', date('c') . ' | ' . $e->getCode() . ' | ' . $e->getMessage() . PHP_EOL, FILE_APPEND);
    if ($e->getCode() == 1062 || $e->getCode() == '23000') {
        // Try to extract which field is duplicated
        $msg = $e->getMessage();
        if (preg_match("/for key '([^']+)'/", $msg, $matches)) {
            $key = $matches[1];
            if (strpos($key, 'tag_id') !== false) {
                $field = 'Tag ID';
            } elseif (strpos($key, 'phone_number') !== false) {
                $field = 'Phone number';
            } elseif (strpos($key, 'name') !== false) {
                $field = 'Name';
            } else {
                $field = 'A unique field';
            }
            http_response_code(409);
            echo json_encode(['error' => "$field already exists. Please use a different $field."]);
        } else {
            http_response_code(409);
            echo json_encode(['error' => 'Duplicate entry. Please use different values.']);
        }
    } else {
        http_response_code(500);
        echo json_encode(['error' => 'A server error occurred. Please try again later.']);
    }
}
?>

