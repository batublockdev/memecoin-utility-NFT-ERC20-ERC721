// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ChocoNft is ERC721URIStorage {
    error ChocoNft_NotEnough_token_tomint();
    error ChocoNft_Nottheowner();
    error ChocoNft_Price_cant_be_0();
    error ChocoNft_NFT_NotForSale();
    error ChocoNft__TransferFailed();

    uint256 public nextTokenId = 0;
    IERC20 public token; // ERC-20 token contract address
    uint256 public minTokens; // Minimum tokens required to mint NFT
    mapping(uint256 => uint256) public salePrices; // Store prices for each NFT
    string[30] private tokenURIs; // Array of predefined URIs

    constructor(
        string[30] memory _tokenURIs,
        address _token,
        uint256 _minTokens
    ) ERC721("ChocoNFT", "CHNFT") {
        tokenURIs = _tokenURIs; // Set predefined URIs at deployment
        token = IERC20(_token);
        minTokens = _minTokens;
    }

    function mint() public {
        if (token.balanceOf(msg.sender) <= minTokens) {
            revert ChocoNft_NotEnough_token_tomint();
        }
        uint256 tokenId = nextTokenId;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURIs[tokenId]);
        nextTokenId++;
    }

    function listForSale(uint256 tokenId, uint256 price) public {
        if (ownerOf(tokenId) != msg.sender) {
            revert ChocoNft_Nottheowner();
        }
        if (price <= 0) {
            revert ChocoNft_Price_cant_be_0();
        }
        salePrices[tokenId] = price; // Store the sale price
    }

    function buyNFT(uint256 tokenId) public {
        uint256 price = salePrices[tokenId];
        address seller = ownerOf(tokenId);
        if (price == 0) {
            revert ChocoNft_NFT_NotForSale();
        }
        bool success = token.transferFrom(msg.sender, seller, price);
        if (!success) {
            revert ChocoNft__TransferFailed();
        }

        _transfer(seller, msg.sender, tokenId); // Transfer ownership

        salePrices[tokenId] = 0; // Remove NFT from sale
    }
}
