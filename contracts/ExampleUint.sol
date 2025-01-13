// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleUint {
    uint public MyUint;
    
    uint8 public myUint8 = 250;

    int public myInt;

    function updateUint(uint _MyUint)public {
        MyUint = _MyUint;
    }

    function increamentUnit8()public {
        myUint8++;
    }
    function increamentInt()public {
        myInt++;
    }
}