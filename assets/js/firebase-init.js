// ═══════════════════════════════════════════════
// IELTS Beta — Firebase Initialization
// assets/js/firebase-init.js
// ═══════════════════════════════════════════════

// Replace these values with your own Firebase project config
const firebaseConfig = {
  apiKey: "AIzaSyAPmjzC32kIdmyGKSWFlUQh58O1zdUXfLs",
  authDomain: "ieltswebapp.firebaseapp.com",
  projectId: "ieltswebapp",
  storageBucket: "ieltswebapp.firebasestorage.app",
  messagingSenderId: "948607787485",
  appId: "1:948607787485:web:4d06246d7c766451c41634",
  measurementId: "G-NEXWF8B8RN"
};

// Initialize Firebase using Compatibility Mode
firebase.initializeApp(firebaseConfig);

// Make these available globally for auth.js
var fbAuth = firebase.auth();
var googleProvider = new firebase.auth.GoogleAuthProvider();

// Sync Firebase user to PHP session via our API
async function syncFirebaseUser(firebaseUser) {
  const res = await fetch('../api/auth.php?action=firebase_sync', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({
      uid:   firebaseUser.uid,
      email: firebaseUser.email,
      name:  firebaseUser.displayName || firebaseUser.email.split('@')[0],
      photo: firebaseUser.photoURL || ''
    })
  });
  const data = await res.json();
  if (data.success) {
    // AuthState helper if available
    if (typeof AuthState !== 'undefined') AuthState.set(data.user);
    return data.user;
  }
  throw new Error(data.error || 'Sync failed');
}
