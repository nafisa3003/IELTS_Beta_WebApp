<?php
// ============================================================
// IELTS Beta — Core Configuration
// includes/config.php
//
// HOW TO USE:
//   1. Copy env.example.php → env.php
//   2. Fill in your real values in env.php
//   3. env.php is in .gitignore — it will NEVER be committed
// ============================================================

// Load secrets from env.php (never committed to git)
$_env_file = __DIR__ . '/env.php';
if (file_exists($_env_file)) {
    require_once $_env_file;
} else {
    // Friendly error if someone forgets to create env.php
    die('<pre style="color:red;padding:20px;">
⚠️  Missing includes/env.php

Please copy includes/env.example.php → includes/env.php
and fill in your database credentials and API keys.
(env.php is gitignored and will never be committed.)
</pre>');
}

// ── APP SETTINGS ──────────────────────────────────────────────
define('SITE_URL',  'http://localhost/ielts_beta_v3');
define('SITE_NAME', 'IELTS Beta');
define('CHATBOT_URL','http://127.0.0.1:8000');

// ── SESSION (secure cookie settings) ─────────────────────────
if (session_status() === PHP_SESSION_NONE) {
    session_set_cookie_params([
        'lifetime' => 86400,
        'path'     => '/',
        'secure'   => false,   // ← set true in production (HTTPS only)
        'httponly' => true,    // ← JS cannot read session cookie
        'samesite' => 'Lax',
    ]);
    session_start();
}

// ── PDO SINGLETON ─────────────────────────────────────────────
// Uses prepared statements by default — PDO::ATTR_EMULATE_PREPARES = false
// means real prepared statements, not just string escaping
function db(): PDO {
    static $pdo = null;
    if ($pdo === null) {
        try {
            $pdo = new PDO(
                "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4",
                DB_USER, DB_PASS,
                [
                    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_EMULATE_PREPARES   => false, // real prepared statements
                ]
            );
        } catch (PDOException $e) {
            http_response_code(500);
            die(json_encode(['error' => 'Database connection failed.']));
            // Note: never expose $e->getMessage() in production (leaks DB details)
        }
    }
    return $pdo;
}

// ── QUERY HELPERS — all use prepared statements ───────────────
// Every ? placeholder is bound separately — user input NEVER touches SQL string
function query(string $sql, array $p = []): array {
    $s = db()->prepare($sql);   // prepare first
    $s->execute($p);             // bind params separately — SQL injection impossible
    return $s->fetchAll();
}
function queryOne(string $sql, array $p = []): ?array {
    $r = query($sql, $p);
    return $r[0] ?? null;
}
function execute(string $sql, array $p = []): int {
    $s = db()->prepare($sql);
    $s->execute($p);
    return (int) db()->lastInsertId();
}

// ── RESPONSE HELPERS ──────────────────────────────────────────
function json_response(array $d, int $code = 200): never {
    http_response_code($code);
    header('Content-Type: application/json');
    echo json_encode($d);
    exit;
}
function json_ok(array $data = []): never   { json_response(array_merge(['ok'=>true], $data)); }
function json_err(string $m, int $c=400): never { json_response(['ok'=>false,'error'=>$m], $c); }

// ── AUTH ───────────────────────────────────────────────────────
function auth_required(): array {
    if (empty($_SESSION['user_id'])) {
        if (str_contains($_SERVER['REQUEST_URI'] ?? '', '/api/')) {
            json_response(['error'=>'Unauthenticated'], 401);
        }
        header('Location: ' . SITE_URL . '/pages/login.php');
        exit;
    }
    return queryOne('SELECT * FROM users WHERE id = ?', [$_SESSION['user_id']]) ?? [];
}
function logged_in(): bool { return !empty($_SESSION['user_id']); }

// ── PASSWORD HASHING ───────────────────────────────────────────
// Uses bcrypt with cost 12 — passwords are NEVER stored as plain text
function hash_password(string $p): string {
    return password_hash($p, PASSWORD_BCRYPT, ['cost' => 12]);
}
function hash_pw(string $p): string { return hash_password($p); } // alias

function verify_password(string $plain, string $hash): bool {
    return password_verify($plain, $hash);
}
function verify_pw(string $p, string $h): bool { return verify_password($p, $h); } // alias

// ── CSRF ───────────────────────────────────────────────────────
function csrf_token(): string {
    if (empty($_SESSION['csrf'])) $_SESSION['csrf'] = bin2hex(random_bytes(32));
    return $_SESSION['csrf'];
}
function csrf_check(): void {
    $tok = $_POST['_csrf'] ?? $_SERVER['HTTP_X_CSRF_TOKEN'] ?? '';
    if ($tok !== ($_SESSION['csrf'] ?? '')) json_err('CSRF token mismatch', 403);
}

// ── OUTPUT SANITISATION ────────────────────────────────────────
function sanitize(string $s): string {
    return htmlspecialchars(trim($s), ENT_QUOTES, 'UTF-8');
}
