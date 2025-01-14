// SPDX-License-Identifier: MIT

pragma solidity 0.8.26;

contract ExampleMapping {

    mapping (uint => bool) public myMapping;
    mapping (address => bool) public myAddressMapping;
    mapping (uint => mapping (uint => bool)) public unitUintBoolMapping;

    function setValue(uint _index)public {
        myMapping[_index] = true;
    }

    function setAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _key1,uint _key2,bool _value) public {
        unitUintBoolMapping[_key1][_key2] = _value;
    }
}