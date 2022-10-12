// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string public saludo; // empieza como un string vacío ('') por definición

    uint256 public counter; // empieza en zero por definición
    mapping(uint256 => string) listaSaludos;

    // mapping address a edad
    mapping(address => uint256) public edadPorAddress;

    function set(string memory _nuevoSaludo) public {
        saludo = _nuevoSaludo;

        // guardando en el mapping;
        listaSaludos[counter] = _nuevoSaludo;
        counter++; // counter += 1; // counter = counter + 1;
    }

    // function get() public view returns (string memory) {
    //     return saludo;
    // }

    function getFromMapping(uint256 _location)
        public
        view
        returns (string memory)
    {
        return listaSaludos[_location];
    }

    function setEdadPorAddress(address _account, uint256 _edad) public {
        edadPorAddress[_account] = _edad;
    }

    // function leerEdadPorAddress(address _account) public view returns (uint256) {
    //     return edadPorAddress[_account];
    // }
}
