// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleWebProvider {
    string public name = "dipo";

    function updateName(string memory _setName) public payable {
      if (msg.value == 1 ether) {
      name = _setName;
      }else {
       payable (msg.sender).transfer(msg.value);
      }
    }
}