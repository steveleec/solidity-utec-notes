// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract A {
    string private saludo;

    function modificarSaludo(
        string memory _nuevoSaludos /**onlyAdmin*/
    ) public returns (string memory) {
        return saludo = _nuevoSaludos;
    }

    function leerSaludo() public view returns (string memory) {
        return saludo;
    }
}

// interface MethodsQueQuieroAccederDeA {
interface InterfaceA {
    function leerSaludo() external returns (string memory);

    function modificarSaludo(string memory _nuevoSaludos)
        external
        returns (string memory);
}

contract B {
    InterfaceA contractA =
        InterfaceA(0xcD6a42782d230D7c13A74ddec5dD140e55499Df9);

    function leerSaludoDeADesdeB() public returns (string memory) {
        return contractA.leerSaludo();
    }

    function modificarSaludoDeA(string memory _saludo) public {
        contractA.modificarSaludo(_saludo);
    }
}
