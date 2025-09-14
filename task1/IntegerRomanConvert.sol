// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntegerRomanConverter {

    mapping(bytes1 => uint) public romanMap;

    constructor() {
        romanMap['I'] = 1;
        romanMap['V'] = 5;
        romanMap['X'] = 10;
        romanMap['L'] = 50;
        romanMap['C'] = 100;
        romanMap['D'] = 500;
        romanMap['M'] = 1000;
    }

    function integerToRoman(uint n) public pure returns (string memory) {
        
    }

    function romanToInteger(string memory n) public view returns (uint) {

        bytes memory roman = bytes(n);
        uint result  = 0;

        for (uint i = 0; i < roman.length-1; i++) {
            if (roman[i] == 'I' && roman[i+1] == 'V') {
                result += 4;
                roman[i] = '';
                roman[i+1] = '';
            }
            if (roman[i] == 'I' && roman[i+1] == 'X') {
                result += 9;
                roman[i] = '';
                roman[i+1] = '';
            }
            if (roman[i] == 'X' && roman[i+1] == 'L') {
                result += 40;
                roman[i] = '';
                roman[i+1] = '';
            }
            if (roman[i] == 'X' && roman[i+1] == 'C') {
                result += 90;
                roman[i] = '';
                roman[i+1] = '';
            }
            if (roman[i] == 'C' && roman[i+1] == 'D') {
                result += 400;
                roman[i] = '';
                roman[i+1] = '';
            }
            if (roman[i] == 'C' && roman[i+1] == 'M') {
                result += 900;
                roman[i] = '';
                roman[i+1] = '';
            }
        }

        for (uint i = 0; i < roman.length; i++) {
            result += romanMap[roman[i]];
        }
        return result;
    }
}