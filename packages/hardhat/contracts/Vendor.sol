pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

uint256 public constant tokensPerEth = 100;

contract Vendor is Ownable {

  //event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

  YourToken public yourToken;

  constructor(address tokenAddress) {
    yourToken = YourToken(tokenAddress);
  }

  // ToDo: create a payable buyTokens() function:

  // ToDo: create a withdraw() function that lets the owner withdraw ETH

  // ToDo: create a sellTokens() function:

  // TODO: all ERC20 tokens must implement THESE
  // https://www.toptal.com/ethereum/create-erc20-token-tutorial
  /**
  function totalSupply() public view returns (uint256);
  function balanceOf(address tokenOwner) public view returns (uint);
  function allowance(address tokenOwner, address spender)
  public view returns (uint);
  function transfer(address to, uint tokens) public returns (bool);
  function approve(address spender, uint tokens)  public returns (bool);
  function transferFrom(address from, address to, uint tokens) public returns (bool);
  **/

}
