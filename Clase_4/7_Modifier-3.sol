// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Modifier {
    modifier verificarAdmin() {
        // msg.sender => no queremos que esta cuenta llame al metodo
        require(msg.sender == owner, "No es el owner.");
        _;
    }

    uint256 totalSupply;
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

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

    bool public paused; // false
    modifier whenNotPaused() {
        require(!paused, "El contrato ha sido pausado");
        _;
    }

    // lista negra que filtra cuentas
    mapping(address => bool) listaNegra;

    function addToBlackList(address _account) public verificarAdmin {
        listaNegra[_account] = true;
    }

    function mintProtegidoPorModifier(address _account, uint256 _amount)
        public
        verificarAdmin
        whenNotPaused
    {
        _mint(_account, _amount);

        segundaFunction();
    }

    function segundaFunction() internal pure {
        // mas operacions
        require(true); // tambien revierte todo lo anterior
    }

    function pausarContrato() public verificarAdmin {
        paused = true;
    }

    function quitarPausaContrato() public verificarAdmin {
        paused = false;
    }

    mapping(address => uint256) attempts;
}
