// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "hardhat/console.sol";

contract DiscountCalculator {

    // constant discount rate (10%)
    uint256 constant DISCOUNT_RATE = 10; // percentage

    // original price
    uint256 originalPrice = 200;

    function calculateFinalPrice() public view returns (
        uint256 price,
        uint256 discountAmount,
        uint256 finalPrice
    ) {
        price = originalPrice;
        discountAmount = (originalPrice * DISCOUNT_RATE) / 100;
        finalPrice = originalPrice - discountAmount;
        console.log(finalPrice);
    }
}
