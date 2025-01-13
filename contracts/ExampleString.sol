// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleString {
    string public greeting = "Hello Dipo";
    bytes public name = "dipi bytes";

    function setMyString(string memory _setMyGreeating)public {
        greeting = _setMyGreeating;
    }

    function compareString(string memory _setGreeting)public view returns (bool){
       return keccak256(abi.encode(greeting)) == keccak256(abi.encode(_setGreeting));
    }
}