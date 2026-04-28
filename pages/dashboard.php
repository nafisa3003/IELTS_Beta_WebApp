<?php
require_once '../includes/config.php';
$user = auth_required();
$active_page = 'dashboard';
$sidebar_user = $user;
$page_title = 'Dashboard';
$extra_css = ['dashboard.css'];
$topbar_links = 'dashboard';
require_once '../includes/header.php';
require_once '../includes/sidebar.php';

$skills = query('SELECT skill, band_score, sessions FROM skill_progress WHERE user_id = ?', [$user['id']]);
$skill_map = [];
foreach ($skills as $s) { $skill_map[$s['skill']] = $s; }
?>
<div class="app-layout">
<?php // sidebar already included above ?>
<main class="app-main">
  <div class="pg-header">
    <div>
      <div class="pg-title">Good morning, <?= htmlspecialchars(explode(' ',$user['name'])[0]) ?>! ☀️</div>
      <div class="pg-sub">You're on a <?= intval($user['streak']) ?>-day streak. Keep it up!</div>
    </div>
  </div>

  <!-- Stats row -->
  <div class="grid4" style="margin-bottom:18px;">
    <div class="stat-card"><div class="stat-label">Current Band</div><div class="stat-val"><?= number_format($user['current_band'],1) ?></div><div class="stat-ch">↑ +0.5 this month</div></div>
    <div class="stat-card"><div class="stat-label">Day Streak</div><div class="stat-val">🔥 <?= intval($user['streak']) ?></div><div class="stat-ch">↑ Keep it going!</div></div>
    <div class="stat-card"><div class="stat-label">Words Learned</div><div class="stat-val" id="words-stat">–</div><div class="stat-ch">↑ via flashcards</div></div>
    <div class="stat-card"><div class="stat-label">Target Band</div><div class="stat-val"><?= number_format($user['target_band'],1) ?></div><div class="stat-ch">Your goal</div></div>
  </div>

  <div class="grid2" style="margin-bottom:16px;">
    <!-- Streak calendar -->
    <div class="card">
      <div style="font-weight:600;font-family:var(--font);margin-bottom:12px;">📅 This week</div>
      <div class="streak-grid" id="streak-grid">
        <?php for($i=0;$i<7;$i++): ?>
        <div class="sday <?= $i<5?'on':($i==5?'today':'') ?>" title="Day <?= $i+1 ?>"></div>
        <?php endfor; ?>
      </div>
    </div>

    <!-- Today's goals -->
    <div class="card">
      <div style="font-weight:600;font-family:var(--font);margin-bottom:12px;">🎯 Today's goals</div>
      <div id="goals-list">
        <label class="goal-item done"><input type="checkbox" checked onchange="toggleGoal(this)"> <span>Complete 1 Reading passage</span></label>
        <label class="goal-item"><input type="checkbox" onchange="toggleGoal(this)"> <span>Practice 20 flashcards</span></label>
        <label class="goal-item"><input type="checkbox" onchange="toggleGoal(this)"> <span>Write Task 2 essay draft</span></label>
        <label class="goal-item"><input type="checkbox" onchange="toggleGoal(this)"> <span>15-min speaking practice</span></label>
      </div>
    </div>
  </div>

  <!-- Skill Progress -->
  <div class="card">
    <div style="font-weight:600;font-family:var(--font);margin-bottom:16px;">📊 Skill progress toward Band <?= number_format($user['target_band'],1) ?></div>
    <div class="grid2" style="gap:18px;">
      <?php
      $colors = ['listening'=>'var(--teal)','reading'=>'#2563eb','writing'=>'var(--green)','speaking'=>'var(--amber)'];
      $icons  = ['listening'=>'🎧','reading'=>'📖','writing'=>'✍️','speaking'=>'🎤'];
      foreach($colors as $skill=>$color):
        $score = floatval($skill_map[$skill]['band_score'] ?? 0);
        $pct   = ($score / 9) * 100;
      ?>
      <div>
        <div style="display:flex;justify-content:space-between;font-size:14px;margin-bottom:2px;">
          <span><?= $icons[$skill] ?> <?= ucfirst($skill) ?></span>
          <span style="color:<?= $color ?>;font-weight:600;font-family:var(--font);"><?= number_format($score,1) ?></span>
        </div>
        <div class="prog-bar"><div class="prog-fill" style="width:<?= $pct ?>%;background:<?= $color ?>;"></div></div>
      </div>
      <?php endforeach; ?>
    </div>
  </div>

  <!-- Quick access -->
  <div style="margin-top:16px;">
    <div style="font-weight:600;font-family:var(--font);margin-bottom:12px;">⚡ Quick access</div>
    <div class="grid4">
      <a href="skills.php" class="card" style="text-align:center;text-decoration:none;cursor:pointer;transition:transform .15s;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform=''"><div style="font-size:28px;margin-bottom:8px;">📚</div><div style="font-size:13px;font-weight:600;font-family:var(--font);">Skill Modules</div></a>
      <a href="flashcards.php" class="card" style="text-align:center;text-decoration:none;cursor:pointer;transition:transform .15s;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform=''"><div style="font-size:28px;margin-bottom:8px;">🃏</div><div style="font-size:13px;font-weight:600;font-family:var(--font);">Flashcards</div></a>
      <a href="chatbot.php" class="card" style="text-align:center;text-decoration:none;cursor:pointer;transition:transform .15s;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform=''"><div style="font-size:28px;margin-bottom:8px;">🤖</div><div style="font-size:13px;font-weight:600;font-family:var(--font);">AI Tutor</div></a>
      <a href="mock-tests.php" class="card" style="text-align:center;text-decoration:none;cursor:pointer;transition:transform .15s;" onmouseover="this.style.transform='translateY(-2px)'" onmouseout="this.style.transform=''"><div style="font-size:28px;margin-bottom:8px;">📝</div><div style="font-size:13px;font-weight:600;font-family:var(--font);">Mock Tests</div></a>
    </div>
  </div>
</main>
</div>

<?php
$inline_js = "
function toggleGoal(cb){cb.closest('.goal-item').classList.toggle('done',cb.checked);}
fetch('../api/user.php?action=data').then(r=>r.json()).then(d=>{
  document.getElementById('words-stat').textContent=d.stats?.cards||0;
});
";
require_once '../includes/footer.php';
?>
