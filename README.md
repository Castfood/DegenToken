# Degen Token Contract (Fuji Chain)

This Solidity contract represents the "Degen" token deployed on the Fuji Chain. It is an ERC-20 token with additional features for managing an in-game store.

- Token Name: Degen 
- Token Symbol: DGN
- Decimals: 18
- Total Supply: 0 (initialized value)

## Features

1. **Minting**: The owner of the contract has the ability to mint new DGN tokens.

2. **Transfer DGNs**: Users can transfer DGN tokens to other addresses.

3. **In-Game Store**: This contract includes an in-game store where users can purchase various items using the DGN token

4. **Check Balance**: Users can check their DGN token balance.

5. **Burning**: Users can burn (destroy) their DGN tokens.

## In-Game Store

The in-game store includes the following items:

1. Glider Upgrade - 200 DGN
2. Legendary Pickaxe - 200 DGN
3. Mythic Outfit - 500 DGN


## Deploy Contract

1. Open contract in remix and change Environment to Inject Provider to connect to Metamask.
2. Deploy contract to Fuji Chain and interact in remix IDE.

## Functions

- `mintToken(address to, uint256 amount)`: Mint new DGN tokens. (Owner only)

- `getStoreItem(uint256 index)`: Get details of a specific store item.

- `redeemStoreItem(uint256 itemIndex)`: Redeem a store item by spending DGN tokens.

- `burnToken(uint256 amount)`: Burn (destroy) a specified amount of DGN tokens.

- `checkBalance(address _address)`: Check the DGN token balance of an address.

- `transferDGNs(address _address, uint _amount)`: Transfer DGN tokens from one address to another.

## Authors

- Akash Patel
- GitHub: [https://github.com/Castfood](https://github.com/Castfood)
