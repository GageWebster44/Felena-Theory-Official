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
