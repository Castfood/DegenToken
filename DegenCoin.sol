// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.2/access/Ownable.sol";

contract Degen is ERC20, Ownable {
    struct StoreItem {
        string name;
        uint256 priceInDGN;
    }

    mapping(uint256 => StoreItem) private storeItems;
    uint256 private numStoreItems;

    event ItemRedeemed(address indexed player, uint256 itemId, uint256 quantity);

    constructor() ERC20("Degen", "DGN") {
        // Initialize item prices
        storeItems[1] = StoreItem("Glider Upgrade", 100); 
        storeItems[2] = StoreItem("Legendary Pickaxe", 200);
        storeItems[2] = StoreItem("Mythic Outfit", 500); 

        numStoreItems = 3; // Update the number of store items
    }

    function mintToken(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function redeemStoreItem(uint256 itemId, uint256 quantity) public {
        require(storeItems[itemId].priceInDGN > 0, "Invalid item ID");
        require(quantity > 0, "Redeem quantity must be greater than zero");
        require(balanceOf(msg.sender) >= storeItems[itemId].priceInDGN * quantity, "Insufficient balance");

        // Deduct tokens from the player
        uint256 cost = storeItems[itemId].priceInDGN * quantity;
        transfer(owner(), cost);

        // Implement the logic to give the player the corresponding in-game item
        // For demonstration purposes, emit an event
        emit ItemRedeemed(msg.sender, itemId, quantity);
    }

    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    function burnToken(uint256 amount) public {
        require(amount > 0, "Burn amount must be greater than zero");
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");

        _burn(msg.sender, amount);
    }

    function getStoreItem(uint256 index) public view returns (string memory, uint256) {
        require(index > 0 && index <= numStoreItems, "Item doesn't exist");
        StoreItem storage item = storeItems[index];
        return (item.name, item.priceInDGN);
    }

    function transferDGNs(address _address, uint256 _amount) public {
        _transfer(msg.sender, _address, _amount);
    }
}
