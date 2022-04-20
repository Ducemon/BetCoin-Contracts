// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "./bet.sol";


contract BetFactory {


    function newBet(uint256 id, uint256 odd, address token_address) public returns (address){
        Bet bet = new Bet(id, odd, token_address, msg.sender);
        return address(bet);
    }

}