//SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import "forge-std/Test.sol";
import "../src/Vault.sol";
import "../src/reentrancyattack.sol";

contract ReentrancyAttackSimulation is Test {
    Vault vault;
    reentrancyAttack attacker;

    function setUp() public {
        vault = new Vault();
        attacker = new reentrancyAttack(address(vault));
        // fund attack with granting eth to attacker
        vm.deal(address(attacker), 2 ether);
        //fund balance to vault
        vm.deal(address(vault), 10 ether);
    }

    function testReentrancyAttack() public {
        vm.prank(address(attacker));
        attacker.attack{value: 1 ether}();
        assertGt(address(attacker).balance, 2 ether, "attack failed");
        assertLt(address(vault).balance, 10 ether, "attack failed");
    }
}
