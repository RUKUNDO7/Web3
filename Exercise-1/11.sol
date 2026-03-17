// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EventEmitter {

    // Event declaration
    event MessageLogged(string message, uint value);

    // Function that emits the event
    function logMessage(string memory message, uint value) public {
        emit MessageLogged(message, value);
    }
}