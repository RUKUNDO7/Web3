// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhoneBook {

    mapping(string => string) public phoneNumbers;

    function addPhoneNumber(string memory name, string memory phoneNumber) public {
        phoneNumbers[name] = phoneNumber;
    }
}