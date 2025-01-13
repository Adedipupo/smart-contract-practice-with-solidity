// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleConstructor {

    address public someAddress;

    constructor(address _myAddress){
        someAddress = _myAddress;
    }

    function setAddress(address _setSomeAddress)public {
        someAddress = _setSomeAddress;
    }

    function setAddressToMsgSender()public  {
        someAddress = msg.sender;
    }
}