// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract BlockchainMessager {

    uint public counter;
    string public myString;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    function updateString(string memory _setString)public {
     if (msg.sender == owner ) {
         myString = _setString;
         counter++;
     }
    }

}