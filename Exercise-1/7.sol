// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Base class (contract)
contract Person {
    string public name;

    // Constructor to set name
    constructor(string memory _name) {
        name = _name;
    }

    // Greet method
    function greet() public view returns (string memory) {
        return string(abi.encodePacked("Hello, my name is ", name));
    }
}

// Subclass (contract) that extends Person
contract Student is Person {
    string public major;

    // Constructor to set name and major
    constructor(string memory _name, string memory _major) Person(_name) {
        major = _major;
    }

    // Method to get major
    function getMajor() public view returns (string memory) {
        return major;
    }
}