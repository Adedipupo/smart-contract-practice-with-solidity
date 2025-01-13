// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleAddress {
    address public myAddress;

    function setMyAddress(address _setMyAddress)public {
        myAddress = _setMyAddress;
    }

    function getAddressBalance()public view returns (uint) {
       return  myAddress.balance;
    }
}