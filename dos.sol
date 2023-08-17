// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract dos{
    mapping (address => uint) public balances;
    mapping (address => uint) public repetation;//solution
    uint constant public Repetation_threshold = 10;//soution2
    function deposit() public payable {
        require(msg.value>=1 ether || (msg.value>0 && repetation[msg.sender] < 100));
        balances[msg.sender] += msg.value;
        repetation[msg.sender]++;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount && repetation[msg.sender]>=Repetation_threshold);
        balances[msg.sender] -= amount;
        payable (msg.sender).transfer(amount);
    }
}
