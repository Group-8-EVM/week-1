// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloWorld {
    string private text;
    address public owner;

    // if any function use this monifier, just owner of contract can call it
    modifier onlyOwner()
    {
        require (msg.sender == owner, "Caller is not the owner");
        _;
    }

    // this will run on deploing contract
    constructor() {
        text = "Hello World";
        owner = msg.sender;
    }

    // this function will return the text that set with the setText function (default is Hello World)
    // everyone can call this view function and they don't need to pay gas for calling this function
    function helloWorld() public view returns (string memory) {
        return text;
    }

    // with this function only owner of this contract can set the text that will return on hello world function
    // only owner can call with function and the owner have to pay gas for this transaction because it will change the state of blockchain
    function setText(string calldata newText) public onlyOwner {
        text = newText;
    }

    // This function transfers the ownership of the Smart Contract to the new owner address and it can be only called by the owner
    function transferOwnership(address newOwner) public onlyOwner {
        owner = newOwner;
    }
}