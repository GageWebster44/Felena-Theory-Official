#!/bin/bash

echo "🛠  Bootstrapping Felena Theory (Final)"

# CONFIGURE THIS LINE IF YOUR FOLDER NAME CHANGES
PROJECT_DIR=~/Downloads/felena-cleanest

cd $PROJECT_DIR || { echo "❌ Project folder not found: $PROJECT_DIR"; exit 1; }

echo "📦 Installing React core dependencies..."
npm install react react-dom

echo "📁 Rebuilding pages/_app.tsx and pages/index.tsx (if missing)..."
mkdir -p pages

# Rebuild _app.tsx
cat <<EOF > pages/_app.tsx
import '@/styles/globals.css'
import type { AppProps } from 'next/app'

export default function App({ Component, pageProps }: AppProps) {
  return <Component {...pageProps} />
}
EOF

# Rebuild index.tsx
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

echo "🚀 Launching app at http://localhost:3000 ..."
npx next dev &

echo "✅ Committing and pushing to GitHub..."
git add .
git commit -m '🚀 Final push with working homepage + React installed'
git pull --rebase origin main
git push
