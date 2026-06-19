// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script, console} from "forge-std/Script.sol";
import {ViaLumenLedger} from "../contracts/ViaLumenLedger.sol";

contract DeployScript is Script {
    function run() external {
        uint256 pk = vm.envUint("DEPLOY_PRIVATE_KEY");
        vm.startBroadcast(pk);
        ViaLumenLedger ledger = new ViaLumenLedger();
        ledger.log("Curiosity Creates Existence - ViaLumen paymaster-lab day1");
        vm.stopBroadcast();
        console.log("ViaLumenLedger deployed at:", address(ledger));
        console.log("entries:", ledger.count());
    }
}
