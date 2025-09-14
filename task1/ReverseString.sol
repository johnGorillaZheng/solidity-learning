// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReverseString {
    function reverseString(string memory _input) public pure returns (string memory){
        bytes memory temp = bytes(_input);
        bytes memory res = new bytes(temp.length);
        uint idx = 0;
        for (uint i = temp.length; i > 0; i--) {
            res[idx] = temp[i-1];
            idx ++;
        }
        return string(res);
    }



}