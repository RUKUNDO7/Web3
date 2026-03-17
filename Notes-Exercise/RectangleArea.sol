// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "hardhat/console.sol";

contract RectangleArea {
    uint256 constant LENGTH = 10;
    uint256 constant WIDTH = 5;

    function calculateArea() public pure returns (uint256 area) {
        area = LENGTH * WIDTH;
        console.log(area);
    }
}