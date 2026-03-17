// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherWallet {

    // Owner of the contract
    address public owner;

    // Mapping to track each user's deposited balance
    mapping(address => uint256) public balances;

    // Event emitted when Ether is deposited
    event Deposited(address indexed sender, uint256 amount);

    // Event emitted when Ether is withdrawn
    event Withdrawn(address indexed recipient, uint256 amount);

    // Set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Function to deposit Ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Must send some Ether");

        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    // Function to withdraw Ether from the contract
    function withdraw(uint256 amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");

        balances[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdrawal failed");

        emit Withdrawn(msg.sender, amount);
    }

    // Function to check contract balance
    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }
}