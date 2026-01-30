// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/AUSD.sol";

contract DeployAUSD is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        uint256 initialSupply = 1_000_000 ether; // 1M AUSD
        AUSD ausd = new AUSD(initialSupply);

        vm.stopBroadcast();

        console2.log("AUSD deployed at:", address(ausd));
    }
}
