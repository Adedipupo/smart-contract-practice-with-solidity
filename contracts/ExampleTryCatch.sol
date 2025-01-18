// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract WillThrow {

        error NotAllowedError(string);
    function aFunction() public pure{
        // require(false, "Error Message");
        // assert(false);
        revert NotAllowedError("You are not allowed");
    }

}

contract ErrorHandler {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowleveldata);
    function CatchError()public  {
        WillThrow will = new WillThrow();

        try will.aFunction(){
            // do this ...
        }catch Error(string memory reason){
           emit ErrorLogging(reason);
        }
        // catch Error(uint errorCode){
        //     emit ErrorLogCode(errorCode);
        // }catch(bytes memory lowLevelData){
        //     emit ErrorLogBytes(lowLevelData);
        // }
    }
}