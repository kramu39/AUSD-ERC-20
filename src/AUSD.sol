// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract AUSD is ERC20, Ownable {
    uint256 public constant MAX_SUPPLY = 1_000_000_000 ether; // 1B AUSD

    constructor(uint256 initialSupply) ERC20("AUSD Stable Token", "AUSD") {
        require(initialSupply <= MAX_SUPPLY, "Max supply exceeded");
        _mint(msg.sender, initialSupply);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(totalSupply() + amount <= MAX_SUPPLY, "Max supply exceeded");
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
