<?php
require_once '../includes/config.php';
$user = auth_required();

$test_id = intval($_GET['id'] ?? 0);
if (!$test_id) { header('Location: mock-tests.php'); exit; }

$test = queryOne('SELECT * FROM mock_tests WHERE id = ?', [$test_id]);
if (!$test) die('Test not found.');

// Fallback logic for official PDFs
$fallback_pdfs = [
    1 => 'https://www.cambridgeenglish.org/images/173977-ielts-academic-reading-sample-tasks.pdf',
    2 => 'https://ielts.idp.com/-/media/ielts/files/sample-test-questions/listening-sample-task-form-completion.pdf',
    3 => 'https://www.ielts.org/-/media/pdfs/academic-writing-sample-test-materials/academic-writing-task-1-sample-c.ashx',
    4 => 'https://ielts.idp.com/-/media/ielts/files/sample-test-questions/listening-sample-task-multiple-choice.pdf'
];
$pdf_url = $test['file_url'] ?? ($fallback_pdfs[$test_id] ?? $fallback_pdfs[1]);

$page_title = 'Taking: ' . $test['title'];
$body_class = 'test-taking-body';
require_once '../includes/header.php';
?>

<style>
  .test-shell { display: flex; height: 100vh; background: var(--bg); color: var(--text); }
  .test-left { 
    flex: 1; border-right: 1px solid var(--border); 
    display: flex; flex-direction: column; align-items: center; justify-content: center;
    background: var(--gray1); text-align: center; padding: 40px;
  }
  .test-right { width: 420px; background: var(--white); display: flex; flex-direction: column; box-shadow: var(--shadow-lg); }
  
  .ans-header { padding: 24px; border-bottom: 1px solid var(--border); display: flex; justify-content: space-between; align-items: center; }
  .ans-body { flex: 1; overflow-y: auto; padding: 24px; }
  .ans-footer { padding: 20px; border-top: 1px solid var(--border); }
  
  .q-row { display: flex; align-items: center; gap: 12px; margin-bottom: 16px; }
  .q-num { width: 32px; height: 32px; background: var(--border); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 13px; font-weight: 700; }
  .q-input { flex: 1; padding: 10px 14px; border: 1px solid var(--border); border-radius: 8px; background: var(--white); color: var(--text); }
  
  .timer { font-family: monospace; font-size: 20px; font-weight: 800; color: #ef4444; }
  .pdf-btn { background: var(--teal); color: #fff; padding: 14px 28px; border-radius: 12px; text-decoration: none; font-weight: 700; margin-top: 24px; display: inline-block; transition: transform 0.2s; }
  .pdf-btn:hover { transform: scale(1.05); }
</style>

<div class="test-shell">
  <!-- Left: PDF Access (Fixed for 'Refused to Connect') -->
  <div class="test-left">
    <div style="max-width: 400px;">
      <div style="font-size: 64px; margin-bottom: 20px;">📄</div>
      <h2 style="font-weight: 800; margin-bottom: 12px;">Official Test Paper</h2>
      <p style="color: var(--text2); line-height: 1.6;">To comply with security policies, please open the official IELTS question paper in a new tab. Keep this window open to enter your answers.</p>
      
      <a href="<?= htmlspecialchars($pdf_url) ?>" target="_blank" class="pdf-btn">
        Open Question Paper ↗
      </a>
      
      <div style="margin-top: 40px; padding: 20px; background: var(--white); border-radius: 12px; border: 1px dashed var(--teal);">
        <p style="font-size: 13px; font-weight: 600; color: var(--teal);">💡 Pro Tip: Arrange your windows side-by-side (Split Screen) for the best experience.</p>
      </div>
    </div>
  </div>

  <!-- Right: Answer Sheet -->
  <div class="test-right">
    <div class="ans-header">
      <div>
        <div style="font-weight: 800; font-size: 15px; color: var(--text);"><?= htmlspecialchars($test['title']) ?></div>
        <div class="timer" id="test-timer">--:--</div>
      </div>
    </div>

    <form id="test-form" action="../api/submit_test.php" method="POST" class="ans-body">
      <input type="hidden" name="test_id" value="<?= $test_id ?>">
      <input type="hidden" name="_csrf" value="<?= csrf_token() ?>">
      
      <?php for($i=1; $i<=20; $i++): ?>
      <div class="q-row">
        <div class="q-num"><?= $i ?></div>
        <input type="text" name="q<?= $i ?>" class="q-input" placeholder="Enter answer...">
      </div>
      <?php endfor; ?>
    </form>

    <div class="ans-footer">
      <button type="button" class="btn btn-primary" style="width:100%; justify-content:center; padding:14px;" onclick="confirmSubmit()">Submit Answer Sheet</button>
    </div>
  </div>
</div>

<script>
let timeLeft = <?= intval($test['duration'] ?? 170) ?> * 60;
function updateTimer() {
  const m = Math.floor(timeLeft / 60);
  const s = timeLeft % 60;
  document.getElementById('test-timer').textContent = `${String(m).padStart(2,'0')}:${String(s).padStart(2,'0')}`;
  if(timeLeft <= 0) document.getElementById('test-form').submit();
  else { timeLeft--; setTimeout(updateTimer, 1000); }
}
updateTimer();

function confirmSubmit() {
  if(confirm('Submit your answers?')) document.getElementById('test-form').submit();
}
</script>

<?php require_once '../includes/footer.php'; ?>