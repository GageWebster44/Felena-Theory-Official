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
