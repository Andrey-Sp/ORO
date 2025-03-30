// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

abstract contract OROStorage {
    mapping(address => uint256) internal _balances;
    mapping(address => mapping(address => uint256)) internal _allowances;
    uint256 internal _totalSupply;
    address internal _reserveVault;
}