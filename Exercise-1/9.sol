// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StringStorage {

    // Mapping to store values by user address
    mapping(address => string) private storedValues;

    // Function to store a string
    function store(string memory value) public {
        storedValues[msg.sender] = value;
    }

    // Function to retrieve the stored string
    function retrieve() public view returns (string memory) {
        return storedValues[msg.sender];
    }
}