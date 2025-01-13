// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleUint {
    uint public MyUint;

    function decreament()public {
        unchecked {
         MyUint--;
        }
    }
}