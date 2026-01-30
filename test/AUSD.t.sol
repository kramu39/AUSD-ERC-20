// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/AUSD.sol";

contract AUSDTest is Test {
    AUSD ausd;

    address owner = address(this);
    address user = address(0xBEEF);

    uint256 constant INITIAL_SUPPLY = 1_000_000 ether;

    function setUp() public {
        ausd = new AUSD(INITIAL_SUPPLY);
    }

    function testMetadata() public {
        assertEq(ausd.name(), "AUSD Stable Token");
        assertEq(ausd.symbol(), "AUSD");
        assertEq(ausd.decimals(), 18);
    }

    function testInitialSupplyMintedToOwner() public {
        assertEq(ausd.balanceOf(owner), INITIAL_SUPPLY);
    }

    function testOwnerCanMint() public {
        uint256 amount = 100 ether;
        ausd.mint(user, amount);

        assertEq(ausd.balanceOf(user), amount);
    }

    function testNonOwnerCannotMint() public {
        vm.prank(user);
        vm.expectRevert();
        ausd.mint(user, 1 ether);
    }

    function testBurn() public {
        uint256 burnAmount = 50 ether;

        ausd.burn(burnAmount);

        assertEq(ausd.totalSupply(), INITIAL_SUPPLY - burnAmount);
    }

    function testTransfer() public {
        uint256 amount = 10 ether;

        ausd.transfer(user, amount);

        assertEq(ausd.balanceOf(user), amount);
    }

    function testMaxSupplyEnforced() public {
        uint256 max = ausd.MAX_SUPPLY();
        uint256 remaining = max - ausd.totalSupply();

        ausd.mint(owner, remaining);

        vm.expectRevert();
        ausd.mint(owner, 1);
    }
}
