// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string saludo;

    uint256 counter; // 0
    // asociando un entero con un string
    // entero => string
    // uint256 => [0 - 2^256-1]
    mapping(uint256 => string) listaDeSaludos;

    // almacenar la edad por de cada usuario usando su billetera (address);
    mapping(address => uint256) addressToInteger;
    // quiero leer:
    // addressToInteger[0x7987v98df7g89d789g7dfv89udf9v8ufdv89fdu9] // 0
    // addressToInteger[0x7987v98df7g89d789g7dfv89udf9v8ufdv89fdu9] = 300;
    // addressToInteger[???????] // ???

    mapping(address => bool) addressToBool;
    // quiero leer:
    // addressToBool[0x987c9v87cx98vcx987vxc979v87xc98v798c7] // false
    // addressToBool[0x987c9v87cx98vcx987vxc979v87xc98v798c7] = true;
    // delete addressToBool[0x987c9v87cx98vcx987vxc979v87xc98v798c7] => lo devuelve a su valor default
    // addressToBool[0x987c9v87cx98vcx987vxc979v87xc98v798c7] = true;

    // Matriz
    // i => j => string
    mapping(uint256 => mapping(uint256 => string)) mappingAnidado;
    uint256[] listIntegers;

    // uint256 => string
    // string => uint256
    // address => uin256
    // address => string

    function fijarSaludo(string memory _saludo) public {
        saludo = _saludo;

        listaDeSaludos[counter] = _saludo;
        counter++;
    }

    function leerSaludo() public view returns (string memory) {
        return saludo;
    }

    function leerMapping(uint256 ordenSaludo)
        public
        view
        returns (string memory)
    {
        return listaDeSaludos[ordenSaludo];
    }

    function guardarEnUno() public {
        listaDeSaludos[1] = "Hola";
    }

    function deleteMapping(uint256 _location) external {
        delete listaDeSaludos[_location];
    }
}
