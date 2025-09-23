//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vault {
    mapping(address => uint256) public balance;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() {
        amount = balances[msg.sender];
        require(amount > 0, "insufficient Balance");
        bool(success,)=msg.sender.call{value:amount}("");
        require(success,"transfer failed");
         balances[msg.sender]=0;
    }
    // helper to check vault balnce 
    function getVaultBalance() view external return(uint 256) {
        return address[this].balances;
    }
}
