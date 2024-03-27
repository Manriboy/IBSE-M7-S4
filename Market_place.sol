// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./ERC_20.sol"; 

contract MarketPlace is Ownable {
    
    MomBreY_5 public token;
    
    constructor(address initialOwner, address _tokenComercial) Ownable(initialOwner) {
        token = MomBreY_5(_tokenComercial);
    }

    struct NFT {
        address contractAddress;
        uint256 tokenId;
        uint256 price;
    }

    NFT[] public nfts;

    function Agrega_NFT(address contractAddress, uint256 tokenId, uint256 price) public onlyOwner {
        nfts.push(NFT(contractAddress, tokenId, price));
    }

    function Compra_NFT(uint256 index, address buyer) public {
        require(index < nfts.length, "NFT no existe");
        NFT storage nft = nfts[index];
        require(token.balanceOf(buyer) >= nft.price, "Saldo insuficiente");
        require(token.transferFrom(buyer, owner(), nft.price), "Pago fallido");

        IERC721(nft.contractAddress).transferFrom(owner(), buyer, nft.tokenId);
        nft.price *= 2;
    }

    function elimina_NFT(uint256 index) public onlyOwner {
        require(index < nfts.length, "NFT no existe");
        nfts[index] = nfts[nfts.length - 1];
        nfts.pop();
    }

    function lista_NFTs() public view returns (address[] memory, uint256[] memory, uint256[] memory) {
    address[] memory contractAddresses = new address[](nfts.length);
    uint256[] memory tokenIds = new uint256[](nfts.length);
    uint256[] memory prices = new uint256[](nfts.length);

    for (uint i = 0; i < nfts.length; i++) {
        NFT storage nft = nfts[i];
        contractAddresses[i] = nft.contractAddress;
        tokenIds[i] = nft.tokenId;
        prices[i] = nft.price;
    }
    
    return (contractAddresses, tokenIds, prices);
}

}
