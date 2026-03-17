// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NumberMultiplier {

    // Event declaration
    event NumberMultiplied(uint product);

    // Function to multiply two numbers
    function multiplyNumbers(uint num1, uint num2) public returns (uint) {
        uint product = num1 * num2;

        // Emit the event with the product
        emit NumberMultiplied(product);

        return product;
    }
}