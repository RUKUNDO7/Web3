// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnedWithdrawal {

    address public owner;

    // Set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Function to receive Ether
    receive() external payable {}

    // Withdraw function - only callable by owner
    function withdraw(uint256 amount) public onlyOwner {
        require(amount <= address(this).balance, "Insufficient contract balance");

        // Transfer Ether to the owner
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Withdrawal failed");
    }
}