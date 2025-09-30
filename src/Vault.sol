//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract Vault {
    mapping(address => uint256) public balance;

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        amount = balance[msg.sender];
        require(amount > 0, "insufficient Balance");
        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "transfer failed");
        balance[msg.sender] = 0;
    }

    // helper to check vault balnce
    function getVaultBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
