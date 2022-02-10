// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {

    uint256 public tokenCounter = 0;
    uint256 public maxTokens;
    uint256 public mintPrice = 0.05 ether;

    constructor(string memory _name, string memory _symbol, uint256 _maxTokens) ERC721(_name, _symbol) {
        maxTokens = _maxTokens;
    }

    function mint() public payable {
        require(msg.value == mintPrice, "Wrong amount value sent to function");
        require(tokenCounter < maxTokens, "All tokens minted");
        _mint(msg.sender, tokenCounter);

        tokenCounter++;
    }
}