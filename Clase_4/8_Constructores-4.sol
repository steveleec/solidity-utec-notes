// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ConstructorContract {
    bool paused;
    address owner; // 0x00000...0000
    string public saludo;

    mapping(address => bool) blackList;

    constructor() {
        // se llama solo una vez en la vida entera del contrato
        // no se incluye en el bytecode luego de hacer la compilacion del contrato
        // se utiliza para inicializar variables
        paused = true;

        // msg.sender => también es el que publica o deploya el contrato
        // msg.sender => admin del contrato
        owner = msg.sender;

        llamarDentroDelC();
    }

    function llamarDentroDelC() public {
        saludo = "hola;";
        blackList[0x5387ddeec8ddC004a217d8e172241EB5F900B302] = true;
    }

    modifier verificarAdmin() {
        // msg.sender => no queremos que esta cuenta llame al metodo
        require(msg.sender == owner, "No es el owner.");
        _;
    }

    uint256 totalSupply;

    mapping(address => uint256) balances;
    event Transfer(address from, address to, uint256 value);

    function _mint(address _account, uint256 _amount) internal {
        require(_account != address(0), "Mint to the zero address");

        totalSupply += _amount;
        balances[_account] += _amount;

        emit Transfer(address(0), _account, _amount);
    }
}
