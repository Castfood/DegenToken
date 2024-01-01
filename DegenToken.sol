// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.9.2/access/Ownable.sol";

contract Degen is ERC20, ERC20Burnable, Ownable {
    struct StoreItem {
        string name;
        uint256 priceInDGN;
    }

    StoreItem[] public storeItems;

    constructor() ERC20("Degen", "DGN") {
        // Initialize the in-game store items for Fortnite
        storeItems.push(StoreItem("Fortnite Skin 1", 50));
        storeItems.push(StoreItem("Fortnite Emote Pack", 100));
        storeItems.push(StoreItem("Glider Upgrade", 200));
        storeItems.push(StoreItem("Legendary Pickaxe", 200));
        storeItems.push(StoreItem("Back Bling Collection", 250));
        storeItems.push(StoreItem("Mythic Outfit", 500));
        storeItems.push(StoreItem("Epic Weapon Wrap", 1000));
    }

    function mintToken(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function getStoreItem(
        uint256 index
    ) public view returns (string memory, uint256) {
        require(index < storeItems.length, "Item dosen't Exist");
        StoreItem storage item = storeItems[index];
        return (item.name, item.priceInDGN);
    }

    function redeemStoreItem(uint256 itemIndex) public {
        require(itemIndex < storeItems.length, "Item dosen't Exist");
        StoreItem storage item = storeItems[itemIndex];

        uint256 itemPrice = item.priceInDGN;
        require(balanceOf(msg.sender) >= itemPrice, "Insufficient balance");

        transfer(owner(), itemPrice);
    }

    function burnDGNs(uint256 amount) public {
        assert(balanceOf(msg.sender) >= amount);
        _burn(msg.sender, amount);
    }

    function checkBalance(address _address) public view returns (uint) {
        return balanceOf(_address);
    }

    function transferDGNs(address _address, uint _amount) public {
        _transfer(msg.sender, _address, _amount);
    }
}
