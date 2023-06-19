Introduction


The BojackToken is a basic ERC-20 token smart contract that can be used to represent any asset or utility on the Ethereum blockchain. This contract enables the creation of tokens with a fixed supply, which can be transferred between addresses and also approved for spending by other addresses.

This readme file provides an overview of the BojackToken smart contract and the deployment code.

Smart Contract Overview

The BojackToken smart contract is written in Solidity version 0.8.0. The contract contains the following variables and functions:

Variables

name: A string that represents the name of the token.

symbol: A string that represents the symbol of the token.

decimals: An integer that represents the number of decimal places used for the token.

totalSupply: An unsigned 256-bit integer that stores the total supply of tokens.

balanceOf: A mapping of address to unsigned 256-bit integers that stores the balance of each address.

allowance: A double mapping of address to address to unsigned 256-bit integers that stores the amount of tokens that an address is allowed to spend on behalf of another address.

owner: An address that represents the owner of the contract.


Functions

constructor: A constructor function that initializes the contract with an initial supply of tokens. It sets the owner variable as the address calling it and assigns the totalSupply to the product of the initialSupply and 10^18 (the number of decimals).

transfer: A function that allows an address to transfer tokens to another address. It first checks that the sender has enough balance before transferring the tokens and emits a Transfer event.

approve: A function that allows an address to approve another address to spend tokens on its behalf. It updates the allowance mapping and emits an Approval event.

transferFrom: A function that allows an address to spend tokens on behalf of another address after being approved using the approve function. It first checks that the spender has enough allowance before transferring the tokens and emits a Transfer event.

changeOwner: A function that allows the owner to change the ownership of the contract to another address.

destroy: A function that allows the owner to destroy the contract and transfer any remaining tokens to the owner's address.

Deployment Code Overview

The deployment code for the BojackToken smart contract is written in JavaScript and uses the Truffle framework to deploy the contract to the blockchain. The deployment code contains the following:

Variables

BojackToken: A reference to the BojackToken smart contract.
Functions
module.exports: A function that exports the deployment code as a module. It deploys the BojackToken smart contract and sets the initial supply of tokens to 1000000.

Conclusion

The BojackToken smart contract and deployment code provided in this readme file can be used as a starting point to create ERC-20 tokens on the Ethereum blockchain. It is recommended to study the code and test it thoroughly before deploying it to the mainnet.
