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

    function faucet(address user) external{
        require(nextRequestAt[user] < block.timestamp, "FaucetError: Try again later");
        
        nextRequestAt[user] = block.timestamp + (5 seconds); //pentru test 5 secunde, planificat 7 zile
        _mint(user, faucetDripAmount*(10 ** decimals()));
    }


}