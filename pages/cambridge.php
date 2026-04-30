<?php
require_once '../includes/config.php';
$user = auth_required(); 
$active_page = 'cambridge'; 
$sidebar_user = $user;
$page_title = 'Cambridge Resources'; 
$extra_css = ['dashboard.css']; 
$topbar_links = 'dashboard';

require_once '../includes/header.php'; 
require_once '../includes/sidebar.php';

// Fetch real data from cambridge_resources
$resources = query('SELECT * FROM cambridge_resources ORDER BY is_premium ASC, id DESC', []);
?>

<style>
  /* ── Chocolate & Cream Theme with Lavender/Pink Accents ── */
  :root {
    --choco: #3d2b1f;
    --choco-light: #5a4031;
    --cream: #fdfaf5;
    --lavender: #e0d7ff;
    --lavender-dark: #b8a2ff;
    --pink-accent: #ff8fb1;
    --text-choco: #2d1e14;
  }

  .app-main { background: var(--cream); }
  
  .res-grid { 
    display: grid; 
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); 
    gap: 24px; 
    margin-top: 24px; 
  }

  .res-card {
    background: #fff;
    border: 1px solid rgba(61, 43, 31, 0.08);
    border-radius: 16px;
    padding: 24px;
    position: relative;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    display: flex;
    flex-direction: column;
    box-shadow: 0 4px 12px rgba(61, 43, 31, 0.03);
  }

  .res-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 24px rgba(61, 43, 31, 0.08);
    border-color: var(--lavender-dark);
  }

  .res-type-badge {
    position: absolute;
    top: 16px;
    right: 16px;
    padding: 4px 10px;
    border-radius: 6px;
    font-size: 10px;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.05em;
  }

  .res-type-badge.book  { background: #e0f2fe; color: #0369a1; }
  .res-type-badge.audio { background: #fef3c7; color: #b45309; }
  .res-type-badge.pdf   { background: #fee2e2; color: #b91c1c; }
  .res-type-badge.video { background: #dcfce7; color: #15803d; }

  .res-icon {
    font-size: 32px;
    margin-bottom: 16px;
    background: var(--cream);
    width: 56px;
    height: 56px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 12px;
    border: 1px solid rgba(61, 43, 31, 0.05);
  }

  .res-title {
    font-family: var(--font);
    font-size: 18px;
    font-weight: 700;
    color: var(--text-choco);
    margin-bottom: 8px;
    line-height: 1.3;
  }

  .res-desc {
    font-size: 14px;
    color: #6b5a4d;
    line-height: 1.5;
    margin-bottom: 20px;
    flex-grow: 1;
  }

  .lock-badge {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 12px;
    font-weight: 600;
    color: var(--choco-light);
    background: var(--lavender);
    padding: 10px;
    border-radius: 10px;
    text-align: center;
    justify-content: center;
  }

  .btn-download {
    background: var(--choco);
    color: #fff;
    border-radius: 10px;
    padding: 10px;
    font-weight: 600;
    text-align: center;
    transition: all 0.2s;
    border: none;
    cursor: pointer;
    font-size: 14px;
    text-decoration: none;
    display: block;
  }

  .btn-download:hover {
    background: var(--choco-light);
    color: #fff;
    transform: none;
  }

  .tabs { 
    display: flex; 
    gap: 8px; 
    margin-bottom: 30px; 
    background: rgba(61, 43, 31, 0.04);
    padding: 6px;
    border-radius: 12px;
    width: fit-content;
  }

  .tab {
    padding: 8px 18px;
    font-size: 14px;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s;
    color: var(--choco-light);
  }

  .tab.active {
    background: #fff;
    color: var(--choco);
    box-shadow: 0 2px 6px rgba(0,0,0,0.05);
  }

  .tab:hover:not(.active) {
    background: rgba(255,255,255,0.5);
  }

  /* Lavender/Pink Accents */
  .pg-title { color: var(--choco); }
  .res-card::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 16px;
    right: 16px;
    height: 3px;
    background: linear-gradient(90deg, var(--lavender-dark), var(--pink-accent));
    border-radius: 3px 3px 0 0;
    opacity: 0;
    transition: opacity 0.3s;
  }
  .res-card:hover::after { opacity: 1; }

</style>

<div class="app-layout">
<main class="app-main">
  <div class="pg-header">
    <div>
      <div class="pg-title">📖 Cambridge Resources</div>
      <div class="pg-sub">Official practice materials powered by IELTS Beta</div>
    </div>
  </div>

  <div class="tabs" id="res-tabs">
    <div class="tab active" onclick="filterRes('all', this)">All Materials</div>
    <div class="tab" onclick="filterRes('free', this)">Free Downloads</div>
    <div class="tab" onclick="filterRes('premium', this)">Premium 🔒</div>
  </div>

  <div class="res-grid" id="res-grid">
    <?php foreach($resources as $r): 
      $type_icons = ['book'=>'📘', 'audio'=>'🎧', 'pdf'=>'📄', 'video'=>'🎬'];
      $icon = $type_icons[$r['type']] ?? '📄';
      $tier = $r['is_premium'] ? 'premium' : 'free';
    ?>
    <div class="res-card" data-tier="<?= $tier ?>">
      <span class="res-type-badge <?= htmlspecialchars($r['type']) ?>"><?= strtoupper($r['type']) ?></span>
      <div class="res-icon"><?= $icon ?></div>
      <div class="res-title"><?= htmlspecialchars($r['title']) ?></div>
      <div class="res-desc"><?= htmlspecialchars($r['description'] ?? 'No description available for this material.') ?></div>
      
      <?php if($r['is_premium']): ?>
        <div class="lock-badge">
          <span>🔒 Premium Resource</span>
        </div>
      <?php else: ?>
        <a href="<?= htmlspecialchars($r['file_url'] ?? '#') ?>" class="btn-download" target="_blank">
          Download File
        </a>
      <?php endif; ?>
    </div>
    <?php endforeach; ?>

    <?php if(empty($resources)): ?>
      <div style="grid-column: 1/-1; text-align: center; padding: 60px; color: var(--choco-light);">
        <div style="font-size: 48px; margin-bottom: 20px;">📂</div>
        <h3 style="font-weight: 700;">No resources found in the database.</h3>
        <p>Please check your database connection or import real_content.sql.</p>
      </div>
    <?php endif; ?>
  </div>
</main>
</div>

<script>
function filterRes(tier, el) {
  document.querySelectorAll('#res-tabs .tab').forEach(t => t.classList.remove('active'));
  el.classList.add('active');
  document.querySelectorAll('#res-grid .res-card').forEach(c => {
    c.style.display = (tier === 'all' || c.dataset.tier === tier) ? '' : 'none';
  });
}
</script>

<?php require_once '../includes/footer.php'; ?>
