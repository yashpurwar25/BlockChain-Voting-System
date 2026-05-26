# BlockChain-Voting-System
# 🗳️ Decentralized Voting System - Blockbase Day 8

##  Overview
This project is a secure, transparent, and decentralized voting system built using Solidity. The goal of this contract is to eliminate voter fraud by ensuring that each wallet address can only vote once, while providing a transparent way to track results on the blockchain.

##  Core Features
- **Role-Based Access Control:** I used a `modifier` called `onlyAdmin` to ensure that only the contract deployer can add candidates or close the election.
- **Sybil Resistance:** By using a `mapping(address => bool)`, the contract tracks every voter's address. If a user tries to vote a second time, the transaction is automatically reverted.
- **Dynamic Candidate List:** The admin can add any number of candidates during the setup phase.
- **State Management:** The `votingOpen` variable allows the admin to start and stop the election process instantly.

##  Technical Stack
- **Language:** Solidity `^0.8.0`
- **IDE:** Remix Ethereum IDE
- **Blockchain:** Remix VM (Simulated Ethereum Network)

##  How to Run the Project
1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a file named `BlockbaseVoting.sol` and paste the code from this repository.
3. Compile the contract using the **Solidity Compiler** tab.
4. Go to the **Deploy & Run Transactions** tab and click **Deploy**.
5. **Admin Phase:** Use the `addCandidate` function to add participants.
6. **Voting Phase:** Switch accounts in the dropdown and use the `vote` function with a valid candidate ID.
7. **Verification:** Use the `getCandidate` function to view the current vote tally.

##  Proof of Work
I have uploaded screenshots of the contract's functionality in the `/screenshots` folder:
- `deployment.png`: Proof of contract deployment.
- `setup.png`: Admin adding candidates.
- `success_vote.png`: A user successfully casting a vote.
- `security_fail.png`: The system blocking a double-vote attempt.

## 👤 Author
- **Name:** [Your Name Here]
- **Course:** Blockbase Day 8 Task
