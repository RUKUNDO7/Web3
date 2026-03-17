// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "hardhat/console.sol";

contract TemperatureConverter {

    // declare celsius variable
    uint256 celsius = 25;

    // function to convert celsius to fahrenheit
    function toFahrenheit() public view returns (uint256 fahrenheit) {
        fahrenheit = (celsius * 9) / 5 + 32;
        console.log(fahrenheit);
    }
}
