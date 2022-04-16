// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Bet {

    address user;
    address bank = 0x0a20cA23a99488cb3220d3125F39135e4bDa8063;
    uint256 bet_id;
    uint256 bet_odd;
    uint256 bet_amount;
    ERC20 token;




    constructor(uint256 id, uint256 odd, address token_address){
        user = msg.sender;
        bet_id = id;
        bet_odd = odd;
        token = ERC20(token_address);
    }

    function getContractTokenBalance() public view returns(uint256){
        return token.balanceOf(address(this));
   }


    function bet(uint256 amount) public returns (bool){

        bet_amount = amount;
        require(amount>0, "Trebuie sa joci ceva");
        require(msg.sender == user, "Pariaza pe pariurile tale");
        require(token.balanceOf(msg.sender)>bet_amount);
        token.approve(address(this), bet_amount);
        token.transfer(address(this), bet_amount);
        
        return true;
    }

    function fuelBet() public{
            require(msg.sender == bank);
            bet_amount = bet_amount*bet_odd;
            token.approve(address(this), bet_amount);
            token.transfer(address(this), bet_amount);

    }

    function betWin() public{
        token.transferFrom(address(this), user, bet_amount);

    }

    function betLose() public{
        token.transferFrom(address(this), bank, bet_amount);
    }





    
}