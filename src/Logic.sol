// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./Initializable.sol";

contract CTFLogic is Initializable, ERC20("AppworksToken", "APT") {

    event generalMint(address indexed minter, uint256 amount);
    event privilegedMint(address indexed admin, uint256 amount);
    event CaptureTheFlag(address indexed solver);

    address public owner;
    mapping(address => uint256) public coolDown;

    modifier onlyOwner() {
        require(msg.sender == owner, "Logic: Caller is not the owner");
        _;
    }

    modifier whenNotBlacklist() {
        require(block.timestamp >= coolDown[msg.sender], "Logic: You're cooling down");
        _;
    }

    function initialize(address _owner) public initializer {
        owner = _owner;
    }
    
    function isChallengeSolve() external {
        require(balanceOf(msg.sender) >= 1000, unicode"🧙: YOU SHALL NOT PASS");
        emit CaptureTheFlag(msg.sender);
    }

    /// @dev Mint 100 amount of AppworksToken
    /// @notice Anyone can call, but need to wait 1 day before calling again
    function mint() external whenNotBlacklist {
        coolDown[msg.sender] = block.timestamp + 1 days;
        _mint(msg.sender, 100 * 10 ** decimals());
        emit generalMint(msg.sender, 100);
    }
    
    /// @dev Mint arbitrary amount of AppworksToken
    /// @param amount Mint amount
    /// @notice Only owner can call
    function mint(uint256 amount) external onlyOwner {
        _mint(msg.sender, amount * 10 ** decimals()); 
        emit privilegedMint(msg.sender, amount);
    }
}
