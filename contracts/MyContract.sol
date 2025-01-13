// SPDX-License-Identifier: MIT

 pragma solidity 0.8.26;

contract DipoContract {

    string public name = "engineer dipo";

    function updateStringName(string memory _updatedname) public {
      name = _updatedname;
    }

}