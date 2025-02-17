// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Consumer {
    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function deposit() public payable  {}
}

contract SmartContractWallet {

    address payable public owner;

    mapping (address => uint) public allowance;
    mapping (address => bool) public isAllowedToSend;
    mapping (address => bool) public guardians;

    address payable nextOwner;
    uint guardiansResetCount;
    uint public constant confirmationFromFuardianForReset = 3;

    mapping (address => mapping (address => bool)) public nextGuardianVotedBool;


    constructor() {
        owner = payable(msg.sender);
    }


    function setGuardian(address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "You are not allowed to send, aborting");
         guardians[_guardian] = _isGuardian;
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(guardians[msg.sender], "You are not allowed to send, aborting");
        require(nextGuardianVotedBool[_newOwner][msg.sender], "You are already voted, aborting");

     if(_newOwner != nextOwner){
        _newOwner = nextOwner;
        guardiansResetCount=0;
     }
     guardiansResetCount++;

    if (confirmationFromFuardianForReset >= 3) {
        owner = nextOwner;
        nextOwner = payable(address(0));
    }
    }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "You are not allowed to send, aborting");
        allowance[_for] = _amount;


        if(_amount > 0){
            isAllowedToSend[_for] = true;
        }else{
            isAllowedToSend[_for] = false;
        }
    }

    function transferMoney(address payable _to, uint _amount,bytes memory _payload) public returns (bytes memory) {
        // require(msg.sender == owner , "You're not the owner, aborting ... ");
        if (msg.sender != owner) {
           require(allowance[msg.sender] >= _amount , "You're trying to send more than you're allowed to, aborting"); 
           require(isAllowedToSend[msg.sender] ,"You're trying to send more than you're allowed to, aborting"); 

           allowance[msg.sender] -= _amount;
        }

       (bool success, bytes memory returnData ) = _to.call{value : _amount}(_payload);
       require(success, "Aborting, call was not successfull");
       return returnData;
    }

    receive() external payable { }


}