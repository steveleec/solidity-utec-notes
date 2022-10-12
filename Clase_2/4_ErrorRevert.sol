// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string saludo; // empieza como un string vacío ('') por definición

    uint256 counter; // empieza en zero por definición
    mapping(uint256 => string) listaSaludos;

    // mapping address a edad
    // billetera => edad
    mapping(address => uint256) public edadPorAddress;

    function set(string memory _nuevoSaludo) public {
        saludo = _nuevoSaludo;

        // guardando en el mapping;
        listaSaludos[counter] = _nuevoSaludo;
        counter++; // counter += 1; // counter = counter + 1;
    }

    function get() public view returns (string memory) {
        return saludo;
    }

    function setEdadPorAddress(address _account, uint256 _edad) public {
        edadPorAddress[_account] = _edad;
    }

    // revert y el require
    function setEdadPorAddressManejarError(address _account, uint256 _edad)
        public
    {
        // saludo = "Hola";
        saludo = "";
        // require falla si la condición no se cumple
        // si falla, propaga un error con el mensaje 'Edad menor a 21'
        // si la condición se cumple, continúa con la ejecución del codigo
        require(_edad >= 21 && _edad <= 30, "Edad menor a 21");
        edadPorAddress[_account] = _edad;
    }

    function setEdadPorAddressManejarErro2(address _account, uint256 _edad)
        public
    {
        // require falla si la condición no se cumple
        // si falla, propaga un error con el mensaje 'Edad menor a 21'
        // si la condición se cumple, continúa con la ejecución del codigo
        // revert solo acepta un string como argumento
        if (
            _edad <= 21 /** mas validaciones*/
        ) {
            // if () {}
            revert("Edad menor a 21");
        }

        edadPorAddress[_account] = _edad;
    }
}
