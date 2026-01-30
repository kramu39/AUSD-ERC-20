

# 🪙 AUSD — ERC-20 Stable Token on Base

**AUSD** is a production-ready ERC-20 token deployed on **Base (Ethereum L2)**, designed for secure, low-cost, and high-throughput onchain applications.
It follows OpenZeppelin standards, enforces a capped supply, and is fully tested using the **Foundry toolkit**.

---

## ✨ Key Features

* ✅ **ERC-20 compliant**
* 🔒 **Capped max supply** (hard-enforced)
* 👑 **Owner-controlled minting**
* 🔥 **Permissionless burn**
* 🧪 **Comprehensive Foundry test suite**
* ⚡ **Optimized for Base L2 (low gas, fast finality)**
* 🛡 **Battle-tested OpenZeppelin contracts**
* 📜 **Solidity ^0.8.20**

---

## 🏗 Architecture Overview

```
AUSD (ERC-20)
├── Fixed Max Supply
├── Initial Mint on Deployment
├── Owner-only Mint Function
├── User Burn Function
└── Standard ERC-20 Transfers & Allowances
```

The contract is intentionally minimal to reduce attack surface while remaining extensible for future integrations (bridges, governance, permits).

---

## 📦 Token Details

| Property   | Value              |
| ---------- | ------------------ |
| Name       | AUSD Stable Token  |
| Symbol     | AUSD               |
| Decimals   | 18                 |
| Standard   | ERC-20             |
| Network    | Base (Ethereum L2) |
| Max Supply | 1,000,000,000 AUSD |
| Tooling    | Foundry            |

---

## 🛠 Tech Stack

* **Solidity** `^0.8.20`
* **Foundry (Forge + Cast + Anvil)**
* **OpenZeppelin Contracts**
* **Base L2 Network**

---

## 📁 Project Structure

```
.
├── src/
│   └── AUSD.sol
├── script/
│   └── DeployAUSD.s.sol
├── test/
│   └── AUSD.t.sol
├── lib/
│   └── openzeppelin-contracts/
├── foundry.toml
└── README.md
```

---

## 🚀 Getting Started

### 1️⃣ Install Foundry

```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

---

### 2️⃣ Install Dependencies

```bash
forge install OpenZeppelin/openzeppelin-contracts
```

Ensure `foundry.toml` includes:

```toml
remappings = [
  "openzeppelin-contracts/=lib/openzeppelin-contracts/"
]
```

---

### 3️⃣ Run Tests

```bash
forge test -vv
```

All tests must pass before deployment.

---

## 🧪 Test Coverage

The test suite validates:

* ✔ Token metadata (name, symbol, decimals)
* ✔ Initial supply minting
* ✔ Owner-only minting
* ✔ Unauthorized mint protection
* ✔ Burn functionality
* ✔ Transfers
* ✔ Max supply enforcement

Tests are written using **forge-std/Test.sol** and run locally with zero external dependencies.

---

## 📤 Deployment (Base / Base Sepolia)

### Environment Variables

```bash
export PRIVATE_KEY=your_private_key
export RPC_URL=https://sepolia.base.org
```

### Deploy

```bash
forge script script/DeployAUSD.s.sol \
  --broadcast \
  --rpc-url $RPC_URL
```

---

## 🔐 Security Considerations

* Uses **OpenZeppelin ERC-20 & Ownable**
* No external calls
* No upgradeability (immutable logic)
* Supply cap enforced at contract level
* Minimal surface area for exploits

> ⚠️ Ownership should be transferred to a multisig or governance contract for production deployments.

---

## 🌐 Base Network Advantages

AUSD is optimized for Base:

* Low gas fees
* Fast confirmations
* Ethereum security
* Ideal for DeFi, payments, and AI-driven protocols

---

## 🧩 Extensibility (Optional Add-Ons)

This token can easily be extended with:

* EIP-2612 (`permit`)
* Pausable transfers
* Blacklist / freeze controls
* Bridging hooks
* Governance (ERC-20Votes)

---

## 📜 License

MIT License
© 2026 — AUSD Contributors

---

## 🤝 Contributing

Contributions are welcome:

1. Fork the repo
2. Create a feature branch
3. Write tests
4. Open a PR

---

## 📬 Contact

For integrations, audits, or partnerships:

* Base ecosystem builders
* DeFi protocols
* Infrastructure partners

---
