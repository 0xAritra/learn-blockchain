// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './SimpleStorage.sol';

// Goerli: 0x8359c7F6D829C72951694F5a1B248dA742c5D079

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray; // array of deployed SimpleStorage contracts

    // deploy
    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage(); // deploys SimpleStorage contract and returns deployed address
        simpleStorageArray.push(simpleStorage);
    }

    // interact - ABI, address
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNum) public {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex]; // 
        simpleStorage.store(_simpleStorageNum); // calls store func from Simple Storage
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex]; 
        return simpleStorage.retrieve();
    }

}