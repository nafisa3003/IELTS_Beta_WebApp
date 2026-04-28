<?php
// Force clean JSON output
error_reporting(0);
ini_set('display_errors', 0);

require_once '../includes/config.php';
header('Content-Type: application/json');

$action = $_GET['action'] ?? '';

// --- LOGIN ---
if ($action === 'login' && $_SERVER['REQUEST_METHOD'] === 'POST') {
  $d = json_decode(file_get_contents('php://input'), true);
  $email = trim($d['email'] ?? ''); 
  $pass = $d['password'] ?? '';
  
  if (!$email || !$pass) json_response(['error' => 'Email and password required.'], 422);
  
  $user = queryOne('SELECT * FROM users WHERE email = ?', [$email]);
  if (!$user || !verify_password($pass, $user['password'])) {
    json_response(['error' => 'Invalid credentials.'], 401);
  }
  
  $_SESSION['user_id'] = $user['id'];
  execute('UPDATE users SET last_active = CURDATE() WHERE id = ?', [$user['id']]);
  json_response(['success' => true, 'user' => ['id' => $user['id'], 'name' => $user['name'], 'email' => $user['email']]]);
}

// --- SIGNUP ---
if ($action === 'signup' && $_SERVER['REQUEST_METHOD'] === 'POST') {
  $d = json_decode(file_get_contents('php://input'), true);
  $name = trim($d['name'] ?? ''); 
  $email = trim($d['email'] ?? ''); 
  $pass = $d['password'] ?? ''; 
  $band = floatval($d['target_band'] ?? 7.0);
  
  if (!$name || !$email || strlen($pass) < 6) {
    json_response(['error' => 'Name, email and 6+ char password required.'], 422);
  }
  
  if (queryOne('SELECT id FROM users WHERE email = ?', [$email])) {
    json_response(['error' => 'Email already registered.'], 409);
  }
  
  $uid = execute('INSERT INTO users (name, email, password, target_band, last_active) VALUES (?, ?, ?, ?, CURDATE())', [$name, $email, hash_password($pass), $band]);
  
  foreach (['listening', 'reading', 'writing', 'speaking'] as $s) {
    execute('INSERT INTO skill_progress (user_id, skill) VALUES (?, ?)', [$uid, $s]);
  }
  
  $_SESSION['user_id'] = $uid;
  json_response(['success' => true, 'user_id' => $uid]);
}

// --- FIREBASE SYNC ---
if ($action === 'firebase_sync' && $_SERVER['REQUEST_METHOD'] === 'POST') {
  $d = json_decode(file_get_contents('php://input'), true);
  $email = trim($d['email'] ?? ''); 
  $name = trim($d['name'] ?? ''); 
  $photo = trim($d['photo'] ?? '');
  
  if (!$email) json_response(['error' => 'Email required.'], 422);
  
  $user = queryOne('SELECT * FROM users WHERE email = ?', [$email]);
  
  if ($user) {
    execute('UPDATE users SET last_active = CURDATE(), avatar = ? WHERE id = ?', [$photo, $user['id']]);
    $uid = $user['id'];
  } else {
    $uid = execute('INSERT INTO users (name, email, password, avatar, last_active) VALUES (?, ?, ?, ?, CURDATE())', [$name, $email, 'FIREBASE_AUTH', $photo]);
    foreach (['listening', 'reading', 'writing', 'speaking'] as $s) {
      execute('INSERT INTO skill_progress (user_id, skill) VALUES (?, ?)', [$uid, $s]);
    }
    $user = queryOne('SELECT * FROM users WHERE id = ?', [$uid]);
  }
  
  $_SESSION['user_id'] = $uid;
  json_response(['success' => true, 'user' => [
    'id' => $uid, 
    'name' => $user['name'] ?? $name, 
    'email' => $email
  ]]);
}

// --- LOGOUT ---
if ($action === 'logout') {
  session_destroy();
  json_response(['success' => true]);
}

json_response(['error' => 'Unknown action.'], 400);
