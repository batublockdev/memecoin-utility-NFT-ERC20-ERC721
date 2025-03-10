// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Script} from "forge-std/Script.sol";
import {ChocoNft} from "../src/ChocoNft.sol";
import {ChocoCoin} from "../src/ChocoCoin.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";
import {console} from "forge-std/console.sol";

contract DeployCoin is Script {
    function run() external returns (ChocoCoin) {
        vm.startBroadcast();
        ChocoCoin moodNft = new ChocoCoin();
        vm.stopBroadcast();
        return moodNft;
    }
}
