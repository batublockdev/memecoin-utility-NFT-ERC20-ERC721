// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ChocoCoin is ERC20 {
    address public deployer;

    constructor() ERC20("ChocoCoin", "CHCOIN") {
        deployer = msg.sender; // Stores the deployer's address
        _mint(msg.sender, 1_000_000 * 10 ** decimals());
    }

    function getDeployer() external view returns (address) {
        return deployer;
    }
}
