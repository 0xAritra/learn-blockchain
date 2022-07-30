// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// library

library PriceConverter { 
    // gets eth / usd rate with chainlink data feed
    function getPrice() internal view returns(uint256) { // internal
        // 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e - Rinkeby
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price * 1e10);
    }

    // converts eth to usd w/ 18 decimals
    function getConversionRate(uint ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethAmount * ethPrice) / 1e18;
        return ethAmountInUsd;
    }
}