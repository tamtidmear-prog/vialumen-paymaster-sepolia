// ViaLumen Paymaster lab — connects to Sepolia, proves the container is live on-chain.
// Next steps: deploy ERC-4337 verifying/token Paymaster, sponsor a UserOperation.
import { createPublicClient, http, formatEther } from "viem";
import { sepolia } from "viem/chains";

const RPC = process.env.SEPOLIA_RPC ?? "https://ethereum-sepolia-rpc.publicnode.com";
const POOL = "0x644Da211BB604B58666b8a9a2419E4F3F2aceC0A"; // class pool

const client = createPublicClient({ chain: sepolia, transport: http(RPC) });

const [block, chainId, poolBal] = await Promise.all([
  client.getBlockNumber(),
  client.getChainId(),
  client.getBalance({ address: POOL }),
]);

console.log("🌟 ViaLumen Paymaster lab — Sepolia");
console.log("  chainId      :", chainId);
console.log("  latest block :", block.toString());
console.log("  pool balance :", formatEther(poolBal), "ETH");
console.log("  RPC          :", RPC);
console.log("ok — container is live on Sepolia. Paymaster deploy = next step.");
