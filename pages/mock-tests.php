<?php
require_once '../includes/config.php';
$user=auth_required(); $active_page='mock-tests'; $sidebar_user=$user;
$page_title='Mock Tests'; $extra_css=['dashboard.css']; $topbar_links='dashboard';
require_once '../includes/header.php'; require_once '../includes/sidebar.php';
$tests=query('SELECT t.*,a.overall,a.completed_at FROM mock_tests t LEFT JOIN (SELECT test_id,overall,completed_at FROM test_attempts WHERE user_id=? ORDER BY completed_at DESC) a ON a.test_id=t.id ORDER BY t.id',[$user['id']]);
$best=queryOne('SELECT MAX(overall) as b FROM test_attempts WHERE user_id=?',[$user['id']]);
?>
<div class="app-layout">
<main class="app-main">
  <div class="pg-header">
    <div><div class="pg-title">📝 Mock Tests</div><div class="pg-sub">Full exam-condition tests with automatic band score calculation</div></div>
    <button class="btn btn-primary btn-sm" onclick="Toast.show('Scheduling coming in v1.2!')">+ Schedule test</button>
  </div>

  <?php if($best&&$best['b']): ?>
  <div class="test-best-banner">
    <div class="test-best-title">🏆 Your best overall: Band <?=number_format($best['b'],1)?></div>
    <div class="test-best-sub">Keep practising to hit Band <?=number_format($user['target_band'],1)?>!</div>
  </div>
  <?php else: ?>
  <div class="test-best-banner" style="background:linear-gradient(135deg,#374151,#1f2937);">
    <div class="test-best-title">🎯 No tests completed yet</div>
    <div class="test-best-sub">Start your first mock test below to get a baseline band score.</div>
  </div>
  <?php endif; ?>

  <div style="display:flex;flex-direction:column;gap:12px;" id="test-list">
    <?php
    $fallback=[
      ['id'=>1,'title'=>'Cambridge IELTS 18 – Test 1','type'=>'academic','duration'=>170,'overall'=>6.5,'completed_at'=>'2026-04-23'],
      ['id'=>2,'title'=>'Cambridge IELTS 18 – Test 2','type'=>'academic','duration'=>170,'overall'=>null,'completed_at'=>null],
      ['id'=>3,'title'=>'General Training – Test 1','type'=>'general','duration'=>170,'overall'=>null,'completed_at'=>null],
      ['id'=>4,'title'=>'Academic Mini Mock – Listening Only','type'=>'academic','duration'=>40,'overall'=>null,'completed_at'=>null],
    ];
    $list=empty($tests)?$fallback:$tests;
    $nums=['1'=>'1','2'=>'2','3'=>'GT','4'=>'L'];
    foreach($list as $i=>$t):
      $num=$nums[strval($i+1)]??($i+1);
      $done=!empty($t['completed_at']);
    ?>
    <div class="test-card">
      <div class="test-num"><?=$num?></div>
      <div class="test-info">
        <div class="test-title"><?=htmlspecialchars($t['title'])?><?php if($done): ?> <span style="font-size:12px;color:var(--green);font-weight:600;">✓ Completed — Band <?=number_format($t['overall'],1)?></span><?php endif; ?></div>
        <div class="test-meta"><?=ucfirst($t['type']??'academic')?> · <?=intval($t['duration']??170)?> min<?=$done?' · '.date('M j',strtotime($t['completed_at'])):' · Not attempted'?></div>
      </div>
      <?php if($done): ?>
        <button class="btn btn-outline btn-sm" onclick="retakeTest()">Retake</button>
      <?php else: ?>
        <button class="btn btn-primary btn-sm" onclick="startTest(<?=intval($t['id'])?>)">Start test</button>
      <?php endif; ?>
    </div>
    <?php endforeach; ?>
  </div>
</main>
</div>
<?php
$inline_js="
function startTest(id){
  window.location.href = 'take-test.php?id=' + id;
}
function retakeTest(){
  Toast.show('Retake feature coming soon!', 'info');
}
";
require_once '../includes/footer.php'; ?>