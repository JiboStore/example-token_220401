pragma solidity 0.8.4;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// learn more: https://docs.openzeppelin.com/contracts/3.x/erc20

contract YourToken is ERC20 {

    // string public constant name; // function name() public view virtual override returns (string memory)
    // string public constant symbol; // function symbol() public view virtual override returns (string memory)
    // uint8 public constant decimals; // function decimals() public view virtual override returns (uint8)

    uint256 totalSupply_;
    constructor(uint256 total) ERC20("Stormy", "STRMY") public {
        //_mint( ~~~YOUR FRONTEND ADDRESS HERE~~~~ , 1000 * 10 ** 18);
        // _mint( 0xcd15cefF2C47590DE91E3CbCDb85165EF29C4BbF , 1000 * 10 ** 18);
        _mint( 0xcd15cefF2C47590DE91E3CbCDb85165EF29C4BbF , 1000 * 10 ** 18);
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
    }

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    // already declared in @openzeppelin/contracts/token/ERC20/IERC20.sol:80:5:
    //event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    //event Transfer(address indexed from, address indexed to, uint tokens);

    function totalSupply() public view override returns (uint256) {
      return totalSupply_;
    }

    function balanceOf(address tokenOwner) public view override returns (uint) {
      return balances[tokenOwner];
    }

    function allowance(address tokenOwner, address spender) public view override returns (uint) {
      return allowed[tokenOwner][spender];
    }

    function transfer(address receiver, uint numTokens) public override returns (bool) {
      require(numTokens <= balances[msg.sender]);
      balances[msg.sender] = balances[msg.sender] - numTokens;
      balances[receiver] = balances[receiver] + numTokens;
      emit Transfer(msg.sender, receiver, numTokens);
      return true;
    }

    function approve(address delegate, uint numTokens) public override returns (bool) {
      allowed[msg.sender][delegate] = numTokens;
      emit Approval(msg.sender, delegate, numTokens);
      return true;
    }

    function transferFrom(address owner, address buyer, uint numTokens) public override returns (bool) {
      require(numTokens <= balances[owner]);
      require(numTokens <= allowed[owner][msg.sender]);
      balances[owner] = balances[owner] - numTokens;
      allowed[owner][msg.sender] = allowed[owner][msg.sender] - numTokens;
      balances[buyer] = balances[buyer] + numTokens;
      emit Transfer(owner, buyer, numTokens);
      return true;
    }

    // TODO: all ERC20 tokens must implement THESE
    // https://www.toptal.com/ethereum/create-erc20-token-tutorial
    /**
    string public constant name;
    string public constant symbol;
    uint8 public constant decimals;

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    function totalSupply() public view returns (uint256);
    function balanceOf(address tokenOwner) public view returns (uint);
    function allowance(address tokenOwner, address spender) public view returns (uint);
    function transfer(address to, uint tokens) public returns (bool);
    function approve(address spender, uint tokens)  public returns (bool);
    function transferFrom(address from, address to, uint tokens) public returns (bool);
    **/
}
