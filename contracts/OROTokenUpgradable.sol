// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "./OROStorage.sol";

contract OROTokenUpgradeable is ERC20Upgradeable, UUPSUpgradeable, OwnableUpgradeable, OROStorage {
    function initialize() public initializer {
        __ERC20_init("ORO Token", "ORO");
        __Ownable_init(msg.sender);
        __UUPSUpgradeable_init();

        // Set total supply
        _totalSupply = 1000000 * 10 ** decimals();
        _balances[msg.sender] = _totalSupply;
    }

    /// @dev Restricts upgrades to only the contract owner (which is Defender's Gnosis Safe)
    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
