<?php
// includes/sidebar.php
$active = $active_page ?? '';
$user   = $sidebar_user ?? ['name'=>'User','email'=>'','target_band'=>7];
$parts  = explode(' ', trim($user['name']));
$initials = strtoupper(substr($parts[0],0,1)) . (isset($parts[1]) ? strtoupper(substr($parts[1],0,1)) : '');
?>
<aside class="sidebar" id="sidebar">
  <div class="sb-logo">
    <img src="/ielts_beta_v3/assets/img/logo-transparent.png" class="sb-logo-img" alt="IELTS Beta" onerror="this.style.display='none'">
    <button class="sb-close" id="sb-close">✕</button>
  </div>
  <span class="sb-sec">Main</span>
  <a href="dashboard.php"  class="sb-link <?= $active==='dashboard'  ?'active':'' ?>"><span class="sb-icon">🏠</span><span>Dashboard</span></a>
  <a href="skills.php"     class="sb-link <?= $active==='skills'     ?'active':'' ?>"><span class="sb-icon">📚</span><span>Skill Modules</span></a>
  <a href="flashcards.php" class="sb-link <?= $active==='flashcards' ?'active':'' ?>"><span class="sb-icon">🃏</span><span>Flashcards</span></a>
  <a href="chatbot.php"    class="sb-link <?= $active==='chatbot'    ?'active':'' ?>"><span class="sb-icon">🤖</span><span>AI Tutor</span><span class="sb-badge">NEW</span></a>
  <a href="resources.php"  class="sb-link <?= $active==='cambridge'  ?'active':'' ?>"><span class="sb-icon">📖</span><span>Cambridge</span></a>
  <a href="mock-tests.php" class="sb-link <?= $active==='mock-tests' ?'active':'' ?>"><span class="sb-icon">📝</span><span>Mock Tests</span></a>
  <span class="sb-sec">Account</span>
  <a href="profile.php"   class="sb-link <?= $active==='profile' ?'active':'' ?>"><span class="sb-icon">👤</span><span>Profile</span></a>
  <button class="sb-link" onclick="Theme.toggle()"><span class="sb-icon" id="dm-icon">🌙</span><span>Dark mode</span></button>
  <a href="home.php"      class="sb-link"><span class="sb-icon">🌐</span><span>Home</span></a>
  <a href="javascript:void(0)" onclick="logout()" class="sb-link"><span class="sb-icon">🚪</span><span>Log out</span></a>
  <div class="sb-user">
    <div class="av" id="sb-av">U</div>
    <div>
      <div class="uname" id="sb-uname" style="font-size:13px;font-weight:600;font-family:var(--font);">Loading...</div>
      <div class="urole" id="sb-urole" style="font-size:11px;color:var(--text3);">Checking...</div>
    </div>
  </div>
</aside>
