# ERC20 Custom Token

This is a Solidity Smart Contract that extends the ERC20 standard to create a custom token. This is my submission for the ETH + AVAX Proof: Intermediate EVM Course.

## Description

It is a program written in Solidity. It has the main functionality of minting, transferring, and burning tokens.

### Smart Contract Modifiers & Functions

```javascript

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner of the contract can mint new tokens.");
        _;
    }

    function mint(uint256 amount) public onlyOwner {
        // mint tokens to owner
        super._mint(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        // transfer tokens and return bool
        super.transfer(to, amount);
        return true;
    }

    function burn(address from, uint256 amount) public {
        // burn tokens from
        super._burn(from, amount);
    }
```

A modifier called OnlyOwner is created to ensure that for the mint() function, only the owner of a contract can mint new tokens and extend the total supply. So, it is a given that mint() creates new tokens and updates the balance of the owner of the contract. While, the transfer() function simply calls the function taken from the parent contract ERC20, to provide the ability to transfer tokens between users. Finally, the burn() function burns tokens from a user, and reduces the total supply.

## Authors

Andre A. Aquino 

