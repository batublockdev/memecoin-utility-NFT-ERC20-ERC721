# ChocoNFT - Smart Contract

## Introduction

ChocoNFT is a smart contract based on the ERC-721 standard, implemented on the Ethereum network. Its purpose is to allow users to create (mint), sell, and buy NFTs that represent different towns in Chocó, Colombia. To mint an NFT, users must hold a minimum amount of ChocoCoin (an ERC-20 token). Additionally, NFT owners can list their NFTs for sale by setting a price in ChocoCoin, and other users can purchase them securely.

## Features

- **NFT Creation**: Any user who holds at least the required minimum amount of ChocoCoin can mint an NFT.
- **Predefined URI Assignment**: Each NFT receives a unique identifier with predefined information upon creation.
- **Listing for Sale**: NFT owners can list their assets on the marketplace by setting a price in ChocoCoin.
- **Buying NFTs**: Users can purchase NFTs by paying the listed price in ChocoCoin. The transaction is securely processed between the buyer and seller.

## Smart Contract Details

### File: ChocoNft.sol

This contract defines the necessary functions for minting, listing, and trading NFTs.

### How to Deploy the Contract

To deploy the contract, use the following code:

```solidity
vm.startBroadcast();
ChocoCoin coin = new ChocoCoin();
ChocoNft chocoNft = new ChocoNft(_tokenURIs, address(coin), 10);
vm.stopBroadcast();
return (chocoNft, coin);
```

## Prerequisites

To work with this project, you need:

- **Solidity** version 0.8.0 or higher
- **OpenZeppelin Contracts** (for security and compatibility features)
- **Foundry or Hardhat** (for testing and deploying the contract)

## Installation and Setup

Follow these steps to install and configure the project:

1. Clone the repository to your computer:
   ```sh
   git clone https://github.com/your-repository/ChocoNFT.git
   cd ChocoNFT
   ```
2. Install the required dependencies:
   ```sh
   npm install
   ```
3. Compile the contracts to ensure there are no errors:
   ```sh
   forge build  # Using Foundry
   ```

## How to Use the Contract

### Minting an NFT

To create a new NFT, call the `mint` function:

```solidity
chocoNft.mint();
```

### Listing an NFT for Sale

If you own an NFT, you can list it for sale by specifying a price in ChocoCoin:

```solidity
chocoNft.listForSale(tokenId, price);
```

### Buying an NFT

If an NFT is listed for sale, you can purchase it by paying its price in ChocoCoin:

```solidity
chocoNft.buyNFT(tokenId);
```

## Possible Errors and Their Causes

Here are some errors that may occur when interacting with the contract:

- `ChocoNft_NotEnough_token_tomint`: Occurs when the user does not have enough ChocoCoins to mint an NFT.
- `ChocoNft_Nottheowner`: Only the NFT owner can list it for sale.
- `ChocoNft_Price_cant_be_0`: The sale price cannot be zero.
- `ChocoNft_NFT_NotForSale`: The NFT you are trying to buy is not listed for sale.
- `ChocoNft__TransferFailed`: Token transfer failure between the buyer and seller.

## Security Considerations

When interacting with smart contracts, keep the following in mind:

- Ensure the contract has been audited before investing large amounts of ChocoCoin.
- Verify the contract address on the blockchain to avoid scams.
- Never share your private keys with anyone.

## License

This project is licensed under the MIT License, meaning you can use, modify, and distribute the code freely as long as the original license remains in the source code.

