// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/AUSD.sol";
import "forge-std/Script.sol";

contract DeployAUSD is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY"); // <-- reads from .env

        vm.startBroadcast(deployerKey);

        uint256 initialSupply = 1_000_000 ether; // 1M AUSD
        AUSD ausd = new AUSD(initialSupply);

        vm.stopBroadcast();

        console2.log("AUSD deployed at:", address(ausd));
    }
}
