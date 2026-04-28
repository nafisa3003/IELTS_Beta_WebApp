// ═══════════════════════════════════════════════
// IELTS Beta — 3D Carousel
// assets/js/carousel.js
// ═══════════════════════════════════════════════

const CAROUSEL_CARDS = [
  { icon: '🎧', title: 'Listening Module',    desc: 'Adaptive exercises across 4 sections with instant scoring',       badge: 'free', bl: 'Free' },
  { icon: '📖', title: 'Reading Module',      desc: 'Cambridge-style passages with skimming strategies built-in',       badge: 'free', bl: 'Free' },
  { icon: '✍️', title: 'AI Essay Grading',   desc: 'Instant band score feedback on Task 1 & 2 essays',                badge: 'pro',  bl: 'Engage+' },
  { icon: '🎤', title: 'Speaking Coach',      desc: 'AI pronunciation scoring across all 3 speaking parts',             badge: 'pro',  bl: 'Engage+' },
  { icon: '🃏', title: 'Flashcard Deck',      desc: '3,000+ IELTS words with spaced repetition algorithm',             badge: 'pro',  bl: 'Engage+' },
  { icon: '🤖', title: 'LangGraph AI Tutor', desc: '24/7 contextual AI assistant powered by Groq + Tavily',           badge: 'ai',   bl: 'Advanced' },
  { icon: '📚', title: 'Cambridge Library',   desc: 'Official Cambridge 15–18 books + audio in one place',             badge: 'ai',   bl: 'Advanced' },
  { icon: '📝', title: 'Full Mock Tests',     desc: '170-min timed tests with automatic band calculation',             badge: 'pro',  bl: 'Engage+' },
];

const Carousel = (() => {
  let idx = 0;
  let autoTimer = null;
  const N = CAROUSEL_CARDS.length;
  const ANGLE_STEP = 360 / N;

  function radius() {
    return Math.round(N * 56);
  }

  function build() {
    const track = document.getElementById('carousel-track');
    const dotsEl = document.getElementById('carousel-dots');
    if (!track || !dotsEl) return;

    track.innerHTML = '';
    dotsEl.innerHTML = '';

    CAROUSEL_CARDS.forEach((c, i) => {
      const angle = ANGLE_STEP * i;
      const card = document.createElement('div');
      card.className = 'c-card' + (i === 0 ? ' center-card' : '');
      card.style.transform = `rotateY(${angle}deg) translateZ(${radius()}px)`;
      card.innerHTML = `
        <div class="c-icon">${c.icon}</div>
        <div class="c-title">${c.title}</div>
        <div class="c-desc">${c.desc}</div>
        <span class="c-badge ${c.badge}">${c.bl}</span>
      `;
      card.addEventListener('click', () => spinTo(i));
      track.appendChild(card);

      const dot = document.createElement('div');
      dot.className = 'cdot' + (i === 0 ? ' active' : '');
      dot.addEventListener('click', () => spinTo(i));
      dotsEl.appendChild(dot);
    });

    startAuto();
  }

  function update() {
    const angle = -idx * ANGLE_STEP;
    const track = document.getElementById('carousel-track');
    if (track) track.style.transform = `rotateY(${angle}deg)`;

    document.querySelectorAll('.c-card').forEach((c, i) => {
      c.classList.toggle('center-card', i === idx);
    });
    document.querySelectorAll('.cdot').forEach((d, i) => {
      d.classList.toggle('active', i === idx);
    });
  }

  function next() { idx = (idx + 1) % N; update(); }
  function prev() { idx = (idx - 1 + N) % N; update(); }

  function spinTo(i) {
    idx = i;
    update();
    resetAuto();
  }

  function startAuto() {
    autoTimer = setInterval(() => next(), 3500);
  }

  function resetAuto() {
    clearInterval(autoTimer);
    startAuto();
  }

  document.addEventListener('DOMContentLoaded', build);

  return { next, prev, spinTo };
})();
