<?php
require_once '../includes/config.php';
$user = auth_required();

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: ../pages/mock-tests.php');
    exit;
}

csrf_check();

$test_id = intval($_POST['test_id'] ?? 0);
if (!$test_id) {
    die('Invalid test ID.');
}

// 1. Calculate Score (Simulation)
// Since we don't have an answer key table yet, we'll calculate based on completion
// and a bit of "difficulty" randomization to make it realistic.
$answered_count = 0;
for($i=1; $i<=20; $i++) {
    if (!empty(trim($_POST["q$i"] ?? ''))) {
        $answered_count++;
    }
}

// Real IELTS 1-9 band score calculation (simulated)
// 20 questions total. Let's say 20/20 = 9.0, 10/20 = 5.0 etc.
$percentage = ($answered_count / 20);
$base_band = 1.0 + ($percentage * 8.0);
// Add a small random variation (-0.5 to +0.5) to simulate real grading
$random_factor = (mt_rand(-5, 5) / 10);
$final_band = round(max(1.0, min(9.0, $base_band + $random_factor)) * 2) / 2; // round to nearest 0.5

// 2. Save Attempt to Database
$sql = "INSERT INTO test_attempts (user_id, test_id, score_l, score_r, score_w, score_s, overall, time_taken, completed_at) 
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";

// For simulation, we'll just set individual scores near the overall
$s = $final_band;
$attempt_id = execute($sql, [
    $user['id'], 
    $test_id, 
    $s, $s, $s, $s, // Individual scores
    $final_band, // Overall
    0 // time_taken (could be calculated)
]);

// 3. Update User Progress
execute("UPDATE users SET current_band = (SELECT AVG(overall) FROM test_attempts WHERE user_id = ?) WHERE id = ?", [$user['id'], $user['id']]);

// 4. Update Skill Progress (simplified for demo)
$skills = ['listening', 'reading', 'writing', 'speaking'];
foreach($skills as $skill) {
    execute("INSERT INTO skill_progress (user_id, skill, band_score, sessions) 
             VALUES (?, ?, ?, 1) 
             ON DUPLICATE KEY UPDATE band_score = ?, sessions = sessions + 1", 
             [$user['id'], $skill, $final_band, $final_band]);
}

// Redirect to result page
header("Location: ../pages/test-result.php?attempt_id=$attempt_id");
exit;
