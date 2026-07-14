// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title Calculator
 * @dev A decentralized calculator that also stores a user's name
 */
contract Calculator {
    // State variables
    string private userName;
    int256 private lastResult;
    address public owner;

    // Events
    event NameSet(address indexed user, string name);
    event CalculationPerformed(address indexed user, string operation, int256 a, int256 b, int256 result);

    constructor() {
        owner = msg.sender;
        userName = "";
        lastResult = 0;
    }

    // ─── Name Functions ───────────────────────────────────────────────────────

    /**
     * @dev Set the user's name
     * @param _name The name to store
     */
    function setName(string memory _name) public {
        require(bytes(_name).length > 0, "Name cannot be empty");
        userName = _name;
        emit NameSet(msg.sender, _name);
    }

    /**
     * @dev Get the stored name
     * @return The stored user name
     */
    function getName() public view returns (string memory) {
        return userName;
    }

    // ─── Arithmetic Functions ─────────────────────────────────────────────────

    /**
     * @dev Add two numbers
     */
    function add(int256 a, int256 b) public returns (int256) {
        int256 result = a + b;
        lastResult = result;
        emit CalculationPerformed(msg.sender, "add", a, b, result);
        return result;
    }

    /**
     * @dev Subtract b from a
     */
    function subtract(int256 a, int256 b) public returns (int256) {
        int256 result = a - b;
        lastResult = result;
        emit CalculationPerformed(msg.sender, "subtract", a, b, result);
        return result;
    }

    /**
     * @dev Multiply two numbers
     */
    function multiply(int256 a, int256 b) public returns (int256) {
        int256 result = a * b;
        lastResult = result;
        emit CalculationPerformed(msg.sender, "multiply", a, b, result);
        return result;
    }

    /**
     * @dev Divide a by b
     */
    function divide(int256 a, int256 b) public returns (int256) {
        require(b != 0, "Division by zero is not allowed");
        int256 result = a / b;
        lastResult = result;
        emit CalculationPerformed(msg.sender, "divide", a, b, result);
        return result;
    }

    /**
     * @dev Get the last computed result
     */
    function getLastResult() public view returns (int256) {
        return lastResult;
    }
}
