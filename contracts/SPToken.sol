// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract SPToken is ERC20 {
    address private owner;

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner of the contract can mint new tokens.");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // set contract owner
        owner = msg.sender;

        // mint an initial supply of tokens to owner
        _mint(owner, 25 * 10**uint(decimals()));
    }

    function mint(uint256 amount) public onlyOwner {
        // mint tokens to owner
        super._mint(msg.sender, amount);
    }

    function burn(address from, uint256 amount) public {
        // burn tokens from
        super._burn(from, amount);
    }
}
