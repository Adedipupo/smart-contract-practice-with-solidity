// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleMsgSender {
 
   address public someAddress;

   function updateMyAddress()public {
      someAddress = msg.sender;
   }

}