// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract HelloDot3 {
    //string public hello = "hello 3.0";

    int public account = 100;

    uint public account2 = 2**256 - 1;

    address public addr = 0x26b2B90b406334A0A09EebAD155693885E5Cd5B3;

    enum status { OK, NOK}

    int[] arr;

    struct Person {
        uint age;
        bool sex;
        string name;
    }

    Person public person = Person(18, true, "zixuan");

    string public hello = "hello";


    function sayHello(string memory word) public view returns(string memory) {
        return string.concat(hello, word);
    }
}