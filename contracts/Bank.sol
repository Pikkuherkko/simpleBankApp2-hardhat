// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Bank {
    uint256 public balanceDeposited;
    address owner;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function Deposit() public payable {
        balanceDeposited += msg.value;
    }

    function Withdraw(uint256 _amount) public onlyOwner {
        require(_amount <= balanceDeposited, "not enough ETH");
        (bool success,) = msg.sender.call{value: _amount}("");
        require(success, "withdraw failed");
        balanceDeposited -= _amount;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }


}