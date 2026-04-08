'use client';

import { useEffect } from 'react';

/**
 * Registers the PWA service worker (/sw.js) on the client side.
 * Rendered once inside the root layout; does nothing during SSR.
 */
export default function ServiceWorkerRegistrar() {
  useEffect(() => {
    if ('serviceWorker' in navigator) {
      navigator.serviceWorker.register('/sw.js').catch((err) => {
        console.warn('Service worker registration failed:', err);
      });
    }
  }, []);

  return null;
}
