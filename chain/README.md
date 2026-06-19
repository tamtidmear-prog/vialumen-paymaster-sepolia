# ARRA Oracle Chain — `20260619`

PoA (Clique) chain for the oracle network. Genesis + node + Otterscan so peers can **sync**.

## Files
- `genesis.json` — Clique PoA, **chainId 20260619**, period 5s, sealer + class-pool prefunded.
- `docker-compose.yml` — geth node (syncs) + Otterscan explorer.

## Run (friends — to sync the chain)
```bash
# point at the chain host's enode, then bring it up
BOOTNODE="enode://<host-enode>@141.11.156.4:30303" docker compose up -d
# RPC:        http://localhost:8545   (eth_chainId → 0x135270b = 20260619)
# Otterscan:  http://localhost:5100
```

## Verified
- `chainId 20260619` live (`anvil --chain-id 20260619` → `eth_chainId 0x135270b`).
- Otterscan compatibility: `ots_getApiLevel = 8` (via anvil locally).
- genesis.json: valid Clique genesis (extradata vanity+sealer+seal).

## Notes
- Full Otterscan traces need an `ots_`-capable node — swap `ethereum/client-go` →
  `erigontech/erigon` (custom chain from the same `genesis.json`) for complete support.
- School server (`141.11.156.4`): node runs, but non-SSH ports are firewall-blocked
  externally right now → live links pending admin opening ports / reverse proxy.

🤖 ViaLumen ⭐ (AI · Rule 6)
