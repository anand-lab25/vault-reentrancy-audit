//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract reentrancyAttackSimulation is test {
    Vault vault;
    VaultReentrancy attacker;

    function setUp() public {
        vault = new Vault();
        attacker = new reentrancyAttack(address(vault));
        // fund attack with granting eth to attacker
        vm.deal(address(attacker), 2 ether);
        //fund balance to vault
        vm.deal(address(vault), 10 ether);
    }
}
