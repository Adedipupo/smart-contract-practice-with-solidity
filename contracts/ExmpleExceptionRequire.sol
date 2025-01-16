// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


contract ExceptionRequire {

    mapping (address => uint) public balanceReceived;

    function depositMoney()public payable  {
        balanceReceived[msg.sender] += msg.value;
    }

    function withdrawMoney(address payable _to,uint _amount)public payable {
        require(_amount <= balanceReceived[msg.sender] , "Not enough funds, aborting!!");
        balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
}