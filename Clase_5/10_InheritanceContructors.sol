// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Humano {
    string description;
    string origin;
    uint256 year;

    constructor(
        string memory _description,
        string memory _origin,
        uint256 _year
    ) {
        // constructor no vacio
        description = _description;
        origin = _origin;
        year = _year;
    }
}

// 1. Directamente en la lista de herencia
//    definiendo los valores a priori
contract Hombre is Humano("homo sapiens", "planeta tierra", 2022) {

}

// 2. Inicializar en el "modifier" del constructor derivado
//    Manera más dinámica de inicializar
contract HombreV2 is Humano {
    constructor(
        string memory _description,
        string memory _origin,
        uint256 _year,
        string memory _name
    ) Humano(_description, _origin, _year) {
        // constructor vacio - sin cuerpo
    }
}

// MULTIPLE HERENCIA
contract HombreV3 {
    uint256 altura;

    constructor(uint256 _altura) {
        altura = _altura;
    }

    function updateHeight(uint256 _nuevaAltura) internal {
        altura = _nuevaAltura;
    }
}

// HombreV3 y Humano no son de la misma jerarquia
// No aplica la regla de linearization C3
contract Programador is HombreV3, Humano {
    constructor(
        string memory _description, // arg de HUMANO
        string memory _origin, // arg de HUMANO
        uint256 _year, // arg de HUMANO
        uint256 _altura // arg de HombreV3
    ) HombreV3(_altura) Humano(_description, _origin, _year) {
        // cuerpo
    }

    /**
    function updateHeight(uint256 _nuevaAltura) internal {
        altura = _nuevaAltura;
    }
    */
}

// Linearizacion
contract HombreV4 is Humano {
    uint256 altura;

    constructor(
        string memory _description,
        string memory _origin,
        uint256 _year,
        uint256 _altura
    ) Humano(_description, _origin, _year) {}

    // metodos HombreV4
    // override de metodos de Humano
}

// Programdor hereda HombreV4 y Humano
// HombreV4 y Humano son parte de una jerarquia
// aplica regla de linearizacion C3
// contract Programador2 is HombreV4 { <= HombreV4 ya hereda todo lo de Humano
contract Programador2 is Humano, HombreV4 {
    constructor(
        string memory _description,
        string memory _origin,
        uint256 _year,
        uint256 _altura
    ) HombreV4(_description, _origin, _year, _altura) {}

    // override de metodos de Hombre4
}
