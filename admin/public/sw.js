/**
 * Easy English Thai Admin — Service Worker
 *
 * Strategy:
 *  - Static assets (JS, CSS, fonts, images): Cache-first with network fallback.
 *  - Audio files (mp3, webm, ogg, wav): Cache-first — enables offline playback
 *    of lesson reference audio that has already been loaded at least once.
 *  - API / Firestore requests: Network-first, fall back to cache if offline.
 *  - Navigation requests: Network-first with offline fallback page.
 *
 * Register this file from app/layout.tsx:
 *   if ('serviceWorker' in navigator) navigator.serviceWorker.register('/sw.js');
 */

const CACHE_VERSION = 'v1';
const STATIC_CACHE = `eet-admin-static-${CACHE_VERSION}`;
const AUDIO_CACHE = `eet-admin-audio-${CACHE_VERSION}`;
const API_CACHE = `eet-admin-api-${CACHE_VERSION}`;

const STATIC_EXTENSIONS = /\.(js|css|woff2?|ttf|otf|svg|png|jpg|jpeg|webp|ico)$/i;
const AUDIO_EXTENSIONS = /\.(mp3|webm|ogg|wav|m4a|aac)$/i;
const API_ORIGINS = [
  'https://api.yourapp.com',
  'https://firestore.googleapis.com',
  'https://identitytoolkit.googleapis.com',
];

// ── Install: pre-cache the offline shell page ─────────────────────────────
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches
      .open(STATIC_CACHE)
      .then((cache) => cache.addAll(['/offline.html']))
      .then(() => self.skipWaiting())
  );
});

// ── Activate: delete outdated caches ─────────────────────────────────────
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches
      .keys()
      .then((keys) =>
        Promise.all(
          keys
            .filter(
              (k) =>
                k !== STATIC_CACHE &&
                k !== AUDIO_CACHE &&
                k !== API_CACHE
            )
            .map((k) => caches.delete(k))
        )
      )
      .then(() => self.clients.claim())
  );
});

// ── Fetch ─────────────────────────────────────────────────────────────────
self.addEventListener('fetch', (event) => {
  const { request } = event;
  const url = new URL(request.url);

  // Skip non-GET requests and chrome-extension / data URIs
  if (request.method !== 'GET') return;
  if (!url.protocol.startsWith('http')) return;

  // Audio files → cache-first (offline playback)
  if (AUDIO_EXTENSIONS.test(url.pathname)) {
    event.respondWith(cacheFirst(request, AUDIO_CACHE));
    return;
  }

  // API / Firestore → network-first
  if (API_ORIGINS.some((o) => request.url.startsWith(o))) {
    event.respondWith(networkFirst(request, API_CACHE));
    return;
  }

  // Static assets → cache-first
  if (STATIC_EXTENSIONS.test(url.pathname)) {
    event.respondWith(cacheFirst(request, STATIC_CACHE));
    return;
  }

  // Navigation requests → network-first with offline fallback
  if (request.mode === 'navigate') {
    event.respondWith(navigationHandler(request));
    return;
  }
});

// ── Strategies ────────────────────────────────────────────────────────────

async function cacheFirst(request, cacheName) {
  const cache = await caches.open(cacheName);
  const cached = await cache.match(request);
  if (cached) return cached;

  try {
    const response = await fetch(request);
    if (response.ok) cache.put(request, response.clone());
    return response;
  } catch {
    return new Response('Offline — resource not cached.', { status: 503 });
  }
}

async function networkFirst(request, cacheName) {
  const cache = await caches.open(cacheName);
  try {
    const response = await fetch(request);
    if (response.ok) cache.put(request, response.clone());
    return response;
  } catch {
    const cached = await cache.match(request);
    return (
      cached ||
      new Response(JSON.stringify({ error: 'offline' }), {
        status: 503,
        headers: { 'Content-Type': 'application/json' },
      })
    );
  }
}

async function navigationHandler(request) {
  try {
    const response = await fetch(request);
    if (response.ok) {
      const cache = await caches.open(STATIC_CACHE);
      cache.put(request, response.clone());
    }
    return response;
  } catch {
    const cache = await caches.open(STATIC_CACHE);
    return (
      (await cache.match(request)) ||
      (await cache.match('/offline.html')) ||
      new Response('<h1>You are offline</h1>', {
        headers: { 'Content-Type': 'text/html' },
      })
    );
  }
}
