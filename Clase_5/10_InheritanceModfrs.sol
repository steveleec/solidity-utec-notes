// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Admin {
    address owner;

    constructor() {
        owner = msg.sender; // tambin es el que publica el smart contract
    }

    modifier onlyAdmin() {
        require(msg.sender == owner, "No es el owner");
        _;
    }

    modifier onlyPauser() {
        require(msg.sender == owner, "No es el owner");
        _;
    }
}

contract Paused {
    bool paused; // false

    modifier whenNotPaused() {
        require(!paused, "Contrato pausado");
        _;
    }

    function _pause() internal {
        paused = true;
    }

    function _unpause() internal {
        paused = false;
    }
}

contract InheritanceModifiers is Admin, Paused {
    uint256 totalSupply;
    mapping(address => uint256) balances;
    event Transfer(address from, address to, uint256 value);

    function _mint(address _account, uint256 _amount) internal {
        require(_account != address(0), "Mint to the zero address");
        totalSupply += _amount;
        balances[_account] += _amount;
        emit Transfer(address(0), _account, _amount);
    }

    function mint(address _account, uint256 _amount)
        public
        onlyAdmin
        whenNotPaused
    {
        _mint(_account, _amount);
    }

    //  funcion burn() onlyBurner

    function pause() public onlyPauser {
        _pause();
    }

    function unpause() public onlyAdmin {
        _unpause();
    }

    /**
    // METODOS HEREDADOS DE PAUSED
    function pause() public {
        paused = true;
    }
    
    function unpause() public {
        paused = false;
    }
    */
}
