<?php
$page_title='Level Up Your IELTS Score';$body_class='home-body';
$extra_css=['landing.css'];$topbar_links='landing';
require_once '../includes/header.php';
?>
<main>
<section class="hero">
  <div class="orb orb1"></div><div class="orb orb2"></div><div class="orb orb3"></div>
  <span class="hero-badge">🎯 IELTS preparation, reimagined with AI</span>
  <h1 class="hero-title">Ready to <span class="accent">Level Up</span><br>Your IELTS Score?</h1>
  <p class="hero-sub">Personalized AI learning, streak rewards, vocabulary flashcards, and a 24/7 AI tutor. Hit your target band — faster than ever.</p>
  <div class="hero-ctas">
    <a href="signup.php" class="btn btn-primary btn-lg">🚀 Start free today</a>
    <a href="dashboard.php" class="btn btn-ghost btn-lg">View demo →</a>
  </div>
  <!-- 3D Carousel — spaced below CTAs -->
  <div class="carousel-section">
    <div class="carousel-label">✦ Everything you need to achieve Band 7+</div>
    <div class="scene"><div class="carousel-track" id="carousel-track"></div></div>
    <div class="carousel-nav">
      <button class="cnav-btn" onclick="Carousel.prev()">&#8592;</button>
      <div class="carousel-dots" id="carousel-dots"></div>
      <button class="cnav-btn" onclick="Carousel.next()">&#8594;</button>
    </div>
  </div>
  <div class="hero-stats">
    <div class="h-stat"><div class="h-num">50K+</div><div class="h-label">Active learners</div></div>
    <div class="h-stat"><div class="h-num">Band 7+</div><div class="h-label">Avg improvement</div></div>
    <div class="h-stat"><div class="h-num">98%</div><div class="h-label">Satisfaction rate</div></div>
    <div class="h-stat"><div class="h-num">24/7</div><div class="h-label">AI tutor available</div></div>
  </div>
</section>

<div class="land-section" id="features">
  <div class="section">
    <div class="s-label">Features</div>
    <h2 class="s-title">Everything you need to succeed</h2>
    <p class="s-sub">Comprehensive tools for every IELTS skill, powered by AI and real Cambridge materials.</p>
    <div class="feat-grid">
      <div class="feat-card"><div class="feat-icon">🎧</div><div class="feat-title">Listening Module</div><div class="feat-desc">Adaptive exercises with real accent varieties. Section-by-section tracking with instant feedback.</div></div>
      <div class="feat-card"><div class="feat-icon">📖</div><div class="feat-title">Reading Module</div><div class="feat-desc">Timed passages with Cambridge-style T/F/NG, matching headings and gap-fill questions.</div></div>
      <div class="feat-card"><div class="feat-icon">✍️</div><div class="feat-title">Writing Module</div><div class="feat-desc">AI essay grading with band-score feedback on Task 1 and Task 2 — results in seconds.</div></div>
      <div class="feat-card"><div class="feat-icon">🎤</div><div class="feat-title">Speaking Module</div><div class="feat-desc">Voice recording with AI pronunciation scoring. Practise Parts 1, 2 and 3 anytime.</div></div>
      <div class="feat-card"><div class="feat-icon">🃏</div><div class="feat-title">Vocabulary Flashcards</div><div class="feat-desc">Active recall with 3,000+ high-frequency words. Spaced repetition for maximum retention.</div></div>
      <div class="feat-card"><div class="feat-icon">🤖</div><div class="feat-title">LangGraph AI Tutor</div><div class="feat-desc">24/7 smart assistant powered by Groq + LangGraph. Instant, contextual IELTS guidance.</div></div>
      <div class="feat-card"><div class="feat-icon">📚</div><div class="feat-title">Cambridge Resources</div><div class="feat-desc">Official Cambridge books 15–18, audio files, model answers — all in one place.</div></div>
      <div class="feat-card"><div class="feat-icon">📝</div><div class="feat-title">Full Mock Tests</div><div class="feat-desc">Timed, exam-condition mock tests with automatic band score calculation.</div></div>
      <div class="feat-card"><div class="feat-icon">🔥</div><div class="feat-title">Daily Streaks</div><div class="feat-desc">Duolingo-style streak system with rewards to keep you consistent every day.</div></div>
    </div>
  </div>
</div>

<div class="pricing-wrap" id="pricing">
  <div style="max-width:900px;margin:0 auto;text-align:center;">
    <div class="s-label" style="color:#5ddcc9;">Pricing</div>
    <h2 class="s-title" style="color:#fff;">Simple, transparent pricing</h2>
    <p class="s-sub" style="color:rgba(255,255,255,0.5);margin:0 auto;">Start free. Upgrade when you're ready.</p>
  </div>
  <div class="pricing-grid">
    <div class="p-card">
      <div class="p-name">Core</div><div class="p-price">Free<span>/forever</span></div><div class="p-sep"></div>
      <div class="p-feat">User accounts &amp; dashboard</div><div class="p-feat">Goal tracking</div>
      <div class="p-feat">4 skill modules</div><div class="p-feat">Dark / Light mode</div>
      <a href="signup.php" class="btn btn-ghost" style="width:100%;justify-content:center;margin-top:24px;">Get started</a>
    </div>
    <div class="p-card featured">
      <div style="background:var(--teal);color:#fff;font-size:11px;font-weight:700;padding:3px 12px;border-radius:99px;display:inline-block;margin-bottom:10px;">MOST POPULAR</div>
      <div class="p-name">Engage</div><div class="p-price">$9<span>/mo</span></div><div class="p-sep" style="background:rgba(255,255,255,0.12);"></div>
      <div class="p-feat">Everything in Core</div><div class="p-feat">Vocabulary flashcards</div>
      <div class="p-feat">Daily streaks &amp; rewards</div><div class="p-feat">Progress analytics</div>
      <a href="signup.php" class="btn btn-primary" style="width:100%;justify-content:center;margin-top:24px;">Start free trial</a>
    </div>
    <div class="p-card">
      <div class="p-name">Advanced</div><div class="p-price">$19<span>/mo</span></div><div class="p-sep"></div>
      <div class="p-feat">Everything in Engage</div><div class="p-feat">AI Chatbot tutor 24/7</div>
      <div class="p-feat">Cambridge book access</div><div class="p-feat">Full mock tests + reports</div>
      <a href="signup.php" class="btn btn-ghost" style="width:100%;justify-content:center;margin-top:24px;">Start free trial</a>
    </div>
  </div>
</div>
<footer class="footer">© 2026 IELTS Beta · Built for IELTS learners worldwide</footer>
</main>
<?php $extra_js=['carousel.js']; require_once '../includes/footer.php'; ?>
