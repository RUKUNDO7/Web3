// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PhoneBook {

    mapping(string => string) public phoneNumbers;

    function addPhoneNumber(string memory name, string memory phoneNumber) public {
        phoneNumbers[name] = phoneNumber;
    }

    function getPhoneNumber(string memory name) public view returns (string memory) {
        return phoneNumbers[name];
    }

    function deletePhoneNumber(string memory name) public {
        delete phoneNumbers[name];
    }
}