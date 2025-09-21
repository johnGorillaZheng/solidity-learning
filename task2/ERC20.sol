// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyFirstERC20 {

    mapping(address=>uint) private _balance;
    mapping(address account => mapping(address spender => uint256)) private _allowances;
    string name;

    event Transfer(address from, address to, uint amount);
    event Approval(address from, address to, uint amount);

    constructor(string memory _name) {
        name = _name;
    }

    function balanceOf(address addr) public view returns(uint) {
        return _balance[addr];
    }

    function approval(address spender, uint256 amount) external {
        require(spender > address(0), "Address cannot be 0");
        require(amount > 0, "Transfer credit cannot be 0");
        address owner = msg.sender;
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);

    }

    function transfer(address to, uint amount) external {
        require(to != address(0), "Address cannot be 0");
        require(amount > 0, "Transfer credit cannot be 0");
        require(_balance[msg.sender] >= amount, "Insufficient balance");
        _balance[msg.sender] -= amount;
        _balance[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function _mint(address to, uint amount) external {
        require(to != address(0), "Address cannot be 0");
        require(amount > 0, "Transfer credit cannot be 0");
        _balance[to] += amount;
    }

}