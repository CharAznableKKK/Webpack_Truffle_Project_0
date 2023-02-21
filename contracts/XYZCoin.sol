pragma solidity ^0.5.1;
 
import "./ERC20.sol";
 
contract XYZCoin is ERC20 {
    string public name = "XYZCoin";
    string public symbol = "XYZ";
    uint8 public decimals = 0;
    uint256 public total_supply = 1000;
 
    mapping (address => uint) public balances;
    mapping (address => mapping (address => uint)) public allowed;

    constructor() public {
        balances[msg.sender] = total_supply;
    }
 
    function totalSupply() public view returns (uint256) {
        return total_supply;
    }
 
    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    } 
     
    function transfer(address _to, uint256 _value) public returns (bool) {
        // require(_to != address(0x0));
        require(_value <= balances[msg.sender]);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        // require(_to != address(0x0));
        require(_value <= balances[_from]);
        require(_value <= allowed[_from][msg.sender]);

        balances[_to] += _value;
        balances[_from] -= _value;
        allowed[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
 
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender];
    }
}