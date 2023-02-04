//SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Nft is ERC721{
    address public owner;
    uint private maxSupply;
    uint public price = 0.0001 ether;
    uint public currentSupply = 1;
    event NFTMinted(address _to, uint _tokenId);

    constructor(string memory _name, string memory _symbol) ERC721 (_name, _symbol){
            owner = msg.sender;
            maxSupply = 20;
    }

    function mint() public payable{
        require(msg.value >= price, "Transaction failed! not enough ether set!!");
        require(currentSupply <= 20, "Maximum supply reached!");
        _safeMint( msg.sender, currentSupply);
        emit NFTMinted(msg.sender, currentSupply);
        currentSupply = currentSupply + 1;
    }
}