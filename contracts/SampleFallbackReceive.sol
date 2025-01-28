// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract ExampleFallback {

    uint public lastValueSent;
    string public lastFunctionCalled;

    receive() external payable { 

        lastValueSent = msg.value;
        lastFunctionCalled = "receive";

    }

    fallback() external payable {
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
     }
}

// if you have a receive function, you can do alow level transcation without passing data
// To pass data, you need a fallback function
// if you dont have a receive functiona nd you only have callback function, you can do low level transaction and
// pass data so far the fallbaack function is payable