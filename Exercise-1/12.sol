// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherSender {

    // Function to send Ether to a specified address with gas price and gas limit
    function sendEther(
        address payable recipient,
        uint256 amount,
        uint256 gasLimit,
        uint256 gasPrice
    ) public payable returns (bool) {
        require(msg.value >= amount, "Insufficient Ether sent");

        // Send Ether using call
        (bool success, ) = recipient.call{value: amount, gas: gasLimit}("");
        
        require(success, "Ether transfer failed");

        return success;
    }
}