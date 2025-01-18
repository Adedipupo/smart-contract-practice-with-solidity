// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract ExceptionRequire {

    mapping (address => uint8) public balanceReceived;

    function depositMoney()public payable  {
        assert(msg.value == uint8(msg.value));
        balanceReceived[msg.sender] += uint8(msg.value);
    }

    function withdrawMoney(address payable _to,uint8 _amount)public payable {
        require(_amount <= balanceReceived[msg.sender] , "Not enough funds, aborting!!");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}