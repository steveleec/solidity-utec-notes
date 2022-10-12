// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Modifier2 {
    modifier MiModificador() {
        _; // <- insert aqui el codigo de la función donde está el modifier
        // cuerpo del  modifier
        _; // <- insert aqui el codigo de la función donde está el modifier
    }

    modifier MiModificador2() {
        _;
    }

    modifier MiModificadorWithArgs(uint256 a, uint256 b) {
        require(a >= 10, "ERROR");
        _;
    }

    function funcionConModifierConArgs(uint256 a, uint256 b)
        public
        MiModificadorWithArgs(a, b)
    {}

    function todoEstaMuyBien() public pure returns (bool) {
        // otras validaciones
        return true;
    }

    function estaAutorizadoDeOperar() public pure returns (bool) {
        // validaciones complejas
        return true;
    }

    modifier soloSiTodoEstaEnOrden() {
        require(todoEstaMuyBien());
        require(estaAutorizadoDeOperar());
        _;
    }

    function functWithSeveralModifiers(uint256 a, uint256 b)
        public
        pure
        MiModificadorWithArgs(a, b)
        soloSiTodoEstaEnOrden
        returns (bool)
    {
        return a > b;
    }
}
