//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";


contract BetCoin is ERC20{

    mapping(address=>uint256) nextRequestAt;
    uint256 faucetDripAmount = 10;


    constructor(uint256 initialSupply) public ERC20("BetCoin", "BET") {
        _mint(msg.sender, initialSupply*(10 ** decimals()));
    }

    function faucet() external{
        require(nextRequestAt[msg.sender] < block.timestamp, "FaucetError: Try again later");
        
        nextRequestAt[msg.sender] = block.timestamp + (5 minutes); //pentru test 5 secunde, planificat 7 zile
        _mint(msg.sender, faucetDripAmount*(10 ** decimals()));
    }


}