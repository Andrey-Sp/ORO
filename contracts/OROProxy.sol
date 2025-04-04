// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract OROProxy is TransparentUpgradeableProxy {
    constructor(address _logic, address _admin, bytes memory _data) 
        TransparentUpgradeableProxy(_logic, _admin, _data) 
    {}
}