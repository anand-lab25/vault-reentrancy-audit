## 🧪 Vault Reentrancy Audit

This repo simulates a reentrancy attack on a vulnerable `Vault` contract using a malicious caller. It benchmarks withdrawal fragility and narrates survivability logic for audit-grade repo hygiene.

### Contracts
- `Vault.sol`: vulnerable contract with naive withdrawal logic
- `reentrancyAttack.sol`: attacker contract exploiting fallback reentrancy
- `VaultReentrancy.t.sol`: Foundry test simulating the attack

### Signals
- ✅ Audit-grade test hygiene
- ✅ Repo-first narration
- ✅ Survivability benchmarking

