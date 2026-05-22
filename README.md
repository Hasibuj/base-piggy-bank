# 🔵 BaseMultiPiggyBank

A decentralized, multi-user Piggy Bank smart contract deployed on the **Base Mainnet**. This project allows users to securely deposit and lock their ETH for a custom duration, preventing impulsive spending until the locking period expires.

## 🚀 Live Deployment Details
- **Network:** Base Mainnet
- **Contract Address:** `0xb1FdB911C4F98EEDb8B05273bAaA019E1b1E4e8C`
- **Compiler Version:** Solidity ^0.8.20

## ✨ Features
- **Multi-User Support:** Anyone can use this contract to create their own personal piggy bank.
- **Custom Time-Lock:** Set your own lock duration in seconds during deposit.
- **Secure Architecture:** Follows the Checks-Effects-Interactions pattern to prevent reentrancy attacks.
- **Modern ETH Transfers:** Uses the secure low-level `.call()` method for withdrawals instead of the deprecated `.transfer()`.

## 🛠️ Smart Contract Functions

### 1. `deposit(uint256 _durationInSeconds)`
- Allows users to lock their sent ETH.
- Automatically sets or updates the `unlockTime` based on the current block timestamp.

### 2. `withdraw()`
- Checks if the user has a balance and if the locking period has expired.
- Resets the user's balance to `0` before transferring the funds to ensure top-notch security.

### 3. `checkAccount(address _user)`
- A view function to easily check any user's locked balance and unlock time.

## 💻 Tech Stack
- **Language:** Solidity
- **Development Tool:** Remix IDE
- **Wallet:** MetaMask
- **Network Infrastructure:** Base (Layer 2)

---
*Built with 💙 as part of my Web3 & Solidity learning journey on Base!*
