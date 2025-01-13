// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleViewPure {
    uint8 public myVar;

    function getVar()public view returns (uint8){
        return myVar;
    }

    function setVar(uint8 _setVar)public {
      myVar = _setVar;
    }

    function addition(uint8 a,uint8 b) public pure returns (uint8){
        return a + b;
    }
}