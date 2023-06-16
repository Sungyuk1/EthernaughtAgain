// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DoMath{
    
    function CalculateHeader(string memory functionHeader) external pure returns(bytes4){
        return bytes4(abi.encodeWithSignature(functionHeader));
    }

    function attack() external {
        
    }


}