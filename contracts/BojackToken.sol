

pragma solidity ^0.8.0;

contract BojackToken {
    string public constant name = "Bojack";
    string public constant symbol = "BJK";
    uint8 public constant decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    constructor(uint256 initialSupply) {
        owner = msg.sender;
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[owner] = totalSupply;
    }

    function transfer(address to, uint256 value) external returns (bool success) {
        require(balanceOf[msg.sender] >= value, "Not enough balance.");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool success) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool success) {
        require(balanceOf[from] >= value, "Not enough balance.");
        require(allowance[from][msg.sender] >= value, "Not enough allowance.");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function changeOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }

    function destroy() external onlyOwner {
        selfdestruct(payable(owner));
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
