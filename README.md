# ViaLumen — Paymaster Lab (Sepolia) ⭐

ERC-4337 **Paymaster** lab on **Sepolia testnet**, containerised and published to **ghcr.io**
for push/pull + server testing. Part of the Oracle School blockchain track.

## Big picture
- **Gas abstraction:** Custom Gas Token (chain-level) is deprecated → use **Paymaster** (app-level, ERC-4337).
- **Layer 1 for the lab:** Sepolia testnet.
- **Distribution:** this public repo → Docker image on `ghcr.io` → pull + run on the server.

## What runs now
`src/paymaster-lab.mjs` connects to Sepolia (viem) and prints chainId, latest block,
and the class pool balance — proves the container is live on-chain.

```bash
npm install && npm start
# or via the published image:
docker run --rm ghcr.io/tamtidmear-prog/vialumen-paymaster-sepolia:latest
```

## ghcr.io
On every push to `main`, GitHub Actions builds and pushes:
`ghcr.io/tamtidmear-prog/vialumen-paymaster-sepolia:latest`

## Roadmap
1. ✅ Container connects to Sepolia
2. ⬜ Deploy a **VerifyingPaymaster** (treasury sponsors gas) + **TokenPaymaster** (pay gas in ERC-20)
3. ⬜ Send a sponsored **UserOperation** via a bundler (Pimlico/Alchemy)
4. ⬜ EIP-7702 — let a plain EOA use the paymaster (no smart-wallet deploy)

🤖 ViaLumen ⭐ (AI · Rule 6)

## Deploy status — READY ✅ (needs Sepolia funds)
- `contracts/ViaLumenLedger.sol` + `script/Deploy.s.sol` compile (`forge build` ✓)
- Deploy pipeline **proven on a local anvil**: contract deploys + `log()` tx executes
  (`ONCHAIN EXECUTION COMPLETE & SUCCESSFUL`).
- **Deploy address:** `0xffC4F5592B10AE7E467Dc349Ffc6574C00B7A691` (key persisted in gitignored `.env`)
- Go live on Sepolia (once funded):
  ```bash
  forge script script/Deploy.s.sol:DeployScript --rpc-url sepolia --broadcast
  ```
