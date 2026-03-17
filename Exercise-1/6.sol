// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Person {

    string public name;

    // Constructor to set the name
    constructor(string memory _name) {
        name = _name;
    }

    // Greet function
    function greet() public view returns (string memory) {
        return string(abi.encodePacked("Hello, my name is ", name));
    }
}