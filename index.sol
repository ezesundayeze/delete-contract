//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Kill {
    constructor() payable {}

    function kill() external {
        selfdestruct(payable(msg.sender));
    }

    function testCall() external pure returns (uint) {
        return 123;
    }

    
}


// We are using this helper contract to to transfer all the funds to another address while deleting it.
contract Helper{
    function getBalance() external view returns (uint){
        return address(this).balance;
    }

    function kill(Kill _kill) external payable {
        _kill.kill();
    }
}
