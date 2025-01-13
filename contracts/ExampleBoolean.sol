// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleBool {
    bool public myBool;

    function updateBool(bool _updateBoolValue)public {
        myBool = !_updateBoolValue;
    }
}