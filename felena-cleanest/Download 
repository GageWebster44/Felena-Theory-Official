#!/bin/bash

echo "🛠  Upgrading Felena Theory App: Enhanced Features Activated"

PROJECT_DIR=~/Downloads/felena-cleanest
cd $PROJECT_DIR || { echo "❌ Project folder not found: $PROJECT_DIR"; exit 1; }

echo "📦 Installing dependencies (react, react-dom, framer-motion, lucide-react, supabase)..."
npm install react react-dom framer-motion lucide-react @supabase/supabase-js

echo "📁 Creating pages and lib folders if missing..."
mkdir -p pages/admin pages/api pages/keycard lib public

# Add admin/engines.tsx
cat <<EOF > pages/admin/engines.tsx
import React from 'react';
export default function EngineDashboard() {
  return <div style={{padding: 40, fontSize: '2rem'}}>🧠 Engine Status Dashboard Coming Soon</div>;
}
EOF

# Add keycard page
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

# Add unlock logic in lib/unlock.ts
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

# Add splash.html for mobile preview
cat <<EOF > public/splash.html
<html><body style="background:black;color:white;font-size:3rem;display:flex;align-items:center;justify-content:center;height:100vh;">🚀 Felena Loading...</body></html>
EOF

echo "🚀 Launching dev server at http://localhost:3000 ..."
npx next dev &

echo "✅ Committing and pushing enhancements to GitHub..."
git add .
git commit -m '🔌 Add dashboard, keycard, unlock logic, splash screen, Stripe-ready structure'
git pull --rebase origin main
git push
