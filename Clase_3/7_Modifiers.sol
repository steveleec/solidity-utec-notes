// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Modifier {
    modifier verificarAdmin() {
        require(msg.sender == owner, "No es el owner.");
        _;
    }

    uint256 totalSupply;
    address owner = 0x5387ddeec8ddC004a217d8e172241EB5F900B302;

    mapping(address => uint256) balances;
    event Transfer(address from, address to, uint256 value);

    function _mint(address _account, uint256 _amount) internal {
        require(_account != address(0), "Mint to the zero address");

        totalSupply += _amount;
        balances[_account] += _amount;

        emit Transfer(address(0), _account, _amount);
    }

    function mintProtegido(address _account, uint256 _amount) public {
        require(msg.sender == owner, "No es el owner.");
        _mint(_account, _amount);
    }

    function protegerMetodo() public view {
        require(msg.sender == owner, "No es el owner.");
    }

    function protegerMetodo2() public view {
        require(msg.sender == owner, "No es el owner.");
    }

    function protegerMetodo3() public view {
        require(msg.sender == owner, "No es el owner.");
    }

    function mintProtegidoPorModifier(address _account, uint256 _amount)
        public
        verificarAdmin
    {
        _mint(_account, _amount);
    }

    function protegerConModifier() public view verificarAdmin {}

    function protegerConModifier2() public view verificarAdmin {}

    function protegerConModifier3() public view verificarAdmin {}

    function protegerConModifier4() public view verificarAdmin {}
}
