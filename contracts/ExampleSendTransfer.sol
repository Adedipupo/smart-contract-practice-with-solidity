// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Sender{
    receive() external payable { }


    function withdrawTransfer(address payable _to)public {
        _to.transfer(10);
    }

    function withdrawSend(address payable _to)public {
     bool isSent = _to.send(10);
     require(isSent, "Sending the fund was unsuccessfull");
    }
}

contract ReceiverNoAction {

    function balance()public view returns (uint){
        return address(this).balance;
    }

    receive() external payable { }
}

contract ReceiverAction {
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value;
     }

    function balance()public view returns (uint){
        return address(this).balance;
    } 
}

// .send(...) which works like .transfer(...), but with a major difference: If the target address is a contract and the transfer fails, 
// then .transfer will result in an exception and .send will simply return false, but the transaction won't fail.