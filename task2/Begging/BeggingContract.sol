// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract BeggingContract {

    mapping(address => uint) private donateRecord;
    address[] private donaters;
    address owner;
    event Donate(address addr, uint amount);

    constructor() {
        owner = msg.sender;
    }


    function getDonation(address addr) external view returns(uint) {
        return donateRecord[addr];
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    function withdraw() external onlyOwner {
        (bool success, ) = payable(owner).call{value: address(this).balance}("");
        require(success, "Withdraw failed");
    }

    function donate() external payable {
        donateRecord[msg.sender] += msg.value;
        emit Donate(msg.sender, msg.value);
    }

    function getTop3() external view returns(uint top1, uint top2, uint top3) {
        uint[3] memory temp;
        uint max = donaters.length > 3 ? donaters.length : 3;
        for (uint8 i = 0; i < max; ++i) {
            uint max = i == 0 ? 2**256-1 : temp[i];
            temp[i] = ((max >= donateRecord[donaters[i]] && donateRecord[donaters[i]] >= temp[i]) ? donateRecord[donaters[i]] : temp[i]);
        }
        return (temp[0], temp[1], temp[2]);
    }
}