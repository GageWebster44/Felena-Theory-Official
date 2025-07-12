#!/bin/bash

echo "🛠  Bootstrapping Felena Theory (Enhanced Setup)"

PROJECT_DIR=~/Downloads/felena-cleanest
cd $PROJECT_DIR || { echo "❌ Project folder not found: $PROJECT_DIR"; exit 1; }

echo "📦 Installing required dependencies..."
npm install react react-dom framer-motion lucide-react @supabase/supabase-js

echo "📁 Creating folders and essential files..."

mkdir -p pages pages/admin lib public

# Create _app.tsx
cat <<EOF > pages/_app.tsx
import '@/styles/globals.css'
import type { AppProps } from 'next/app'

export default function App({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}
EOF

# Create index.tsx
cat <<EOF > pages/index.tsx
export default function Home() {
  return (
    <main style={{
      fontSize: '2rem',
      padding: '2rem',
      color: '#fff',
      background: '#000',
      height: '100vh',
      display: 'flex',
      alignItems: 'center',
      justifyContent: 'center'
    }}>
      <div>⚡ Felena Theory is Live 🎯</div>
    </main>
  )
}
EOF

# Create admin/engines.tsx
cat <<EOF > pages/admin/engines.tsx
import React from 'react';
export default function EngineDashboard() {
  return <div style={{padding: 40, fontSize: '2rem'}}>🧠 Engine Status Dashboard Coming Soon</div>;
}
EOF

# Create keycard.tsx
cat <<EOF > pages/keycard.tsx
import { motion } from 'framer-motion';
export default function Keycard() {
  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      className="flex h-screen items-center justify-center bg-black text-white text-2xl"
    >
      🔑 Keycard Preview (XP + Prestige)
    </motion.div>
  );
}
EOF

# Create lib/unlock.ts
cat <<EOF > lib/unlock.ts
export const engineUnlockPrices = {
  Snubnose: 15,
  Concrete: 25,
  Diesel: 40,
  Magnum: 75,
  Pipeline: 150,
  Overlord: 300
};
export function canUnlock(engine: string, balance: number): boolean {
  return balance >= engineUnlockPrices[engine];
}
EOF

# Create splash.html
cat <<EOF > public/splash.html
<html><body style="background:black;color:white;font-size:3rem;display:flex;align-items:center;justify-content:center;height:100vh;">🚀 Felena Loading...</body></html>
EOF

echo "🚀 Launching dev server at http://localhost:3000 ..."
npx next dev &

echo "✅ Committing and pushing to GitHub..."
git add .
git commit -m '🔌 Add dashboard, keycard, unlock logic, splash screen, Stripe-ready structure'
git pull --rebase origin main
git push
