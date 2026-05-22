// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseMultiPiggyBank {
    struct Account {
        uint256 balance;
        uint256 unlockTime;
    }

    mapping(address => Account) public accounts;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event Withdrawn(address indexed user, uint256 amount);

    function deposit(uint256 _durationInSeconds) external payable {
        require(msg.value > 0, "Obossoi kicu ETH pathate hobe!");
        require(_durationInSeconds > 0, "Somoy obossoi 0 er beshi hote hobe!");

        Account storage userAccount = accounts[msg.sender];

        // FIX: Reset unlock time based on current timestamp on every new deposit to prevent forever-locking bug
        userAccount.unlockTime = block.timestamp + _durationInSeconds;
        
        userAccount.balance += msg.value;

        emit Deposited(msg.sender, msg.value, userAccount.unlockTime);
    }

    function withdraw() external {
        Account storage userAccount = accounts[msg.sender];
        require(userAccount.balance > 0, "Apnar ekhane kono taka nei!");
        require(block.timestamp >= userAccount.unlockTime, "Ekhono apnar loking somoy sesh hoy ni!");

        uint256 amountToWithdraw = userAccount.balance;
        userAccount.balance = 0;

        // Modern and secure way to transfer ETH instead of using .transfer()
        (bool success, ) = payable(msg.sender).call{value: amountToWithdraw}("");
        require(success, "Transfer baddho hoyeche!");

        emit Withdrawn(msg.sender, amountToWithdraw);
    }

    function checkAccount(address _user) external view returns (uint256 balance, uint256 unlockTime) {
        return (accounts[_user].balance, accounts[_user].unlockTime);
    }
}
