// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string saludo; // empieza como un string vacío ('') por definición

    uint256 counter; // empieza en zero por definición
    mapping(uint256 => string) listaSaludos;

    mapping(address => uint256) public edadPorAddress;

    // Eventos
    // 1 - Disparar un evento cada vez que se cambia el saludo
    // _account - address de la persona que está llamando el método - msg.sender
    // _nuevoSaludo - string que representa al nuevo saludo
    event CambioDeSaludo(address _account, string _nuevoSaludo);

    // 2 - Disparar un evento cuando se asocia un 'address' con una edad
    // _account - address para el cual se asocia la edad
    // _edad - nueva edad para asociar con un address
    event NuevaEdadParaAddress(address _account, uint256 _edad);

    event NuevaEdadParaAddress2(
        uint256 _timestamp,
        uint256 _edad,
        string _saludo
    );

    /**
    bool
    string
    uint256
    mapping X
    bytes
    array (bool, strings, uint256)
    address
    struct X
    */

    function set(string memory _nuevoSaludo) public {
        saludo = _nuevoSaludo;

        listaSaludos[counter] = _nuevoSaludo;
        counter++; // counter += 1; // counter = counter + 1;

        emit CambioDeSaludo(msg.sender, _nuevoSaludo);
    }

    function get() public view returns (string memory) {
        return saludo;
    }

    function setEdadPorAddress(address _account, uint256 _edad) public {
        edadPorAddress[_account] = _edad;
        emit NuevaEdadParaAddress(_account, _edad);
        emit NuevaEdadParaAddress2(block.timestamp, _edad, saludo);
    }

    function setEdadPorAddressManejarError(address _account, uint256 _edad)
        public
    {
        require(_edad >= 21 && _edad <= 30, "Edad menor a 21");
        edadPorAddress[_account] = _edad;
    }

    function setEdadPorAddressManejarErro2(address _account, uint256 _edad)
        public
    {
        if (
            _edad <= 21 /** mas validaciones*/
        ) {
            revert("Edad menor a 21");
        }
        edadPorAddress[_account] = _edad;
    }
}
