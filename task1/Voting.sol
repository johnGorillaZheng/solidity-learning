// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {
    
    mapping(string => uint32) public votings;
    string[] public nameList;

    function vote(string memory _option) public {
        if (votings[_option] == 0) {
            nameList.push(_option);
        }
        votings[_option] += 1;
    }

    function getVotes(string memory _option) public view returns(uint32) {
        return votings[_option];
    }

    function resetVotes() public payable {
        for (uint i = 0; i < nameList.length; i++) {
            votings[nameList[i]] = 0;
        }
    } 

}