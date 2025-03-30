// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

abstract contract OROAccess is OwnableUpgradeable {
    function initializeAccess(address initialOwner) internal initializer {
        __Ownable_init(initialOwner);
        _transferOwnership(initialOwner);
    }
}