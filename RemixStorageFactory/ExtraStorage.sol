// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import './SimpleStorage.sol';

// inheritance
contract ExtraStorage is SimpleStorage {

    // override, virtual
    function store(uint256 _favNum) public override {
        favNum = _favNum + 5;
    }

}