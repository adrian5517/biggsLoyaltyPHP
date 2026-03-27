<?php
// Use a fallback to ensure it works even if getenv fails during CLI/Docker edge cases
$host = getenv('DB_HOST');
$db   = getenv('DB_NAME') ;
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD'); 

$port = getenv('DB_PORT') ?: 3306;
$dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4";
try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Always fetch as associative array
        PDO::ATTR_EMULATE_PREPARES   => false,            // Let MySQL handle types strictly
    ]);
} catch (PDOException $e) {
    http_response_code(500);
    header('Content-Type: application/json');
    echo json_encode(['error' => 'Database connection failed', 'details' => $e->getMessage()]);
    exit;
}
?>