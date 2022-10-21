// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Structs {
    // struct - grupo de variables
    // definidos por el usuario
    // nivel complejido definido por el usuario
    struct EstadoCuenta {
        uint256 monto;
        uint256 fecha;
        string nombre;
        uint256 interes;
        // seguir definiendo otras variables
    }

    // fuera de los metodos => storage
    // dentro de los metodos => storage/memory

    mapping(address => EstadoCuenta) public listaDeEstadosCuenta;

    function guardarEstadoCeunta() public {
        // manera mas legible
        EstadoCuenta memory estadoCuenta = EstadoCuenta({
            monto: 3243,
            fecha: 123343,
            nombre: "lee",
            interes: 34
        });

        listaDeEstadosCuenta[msg.sender] = estadoCuenta;
    }

    function guardarEstadoCeuntaTwo() public {
        // manera corta
        listaDeEstadosCuenta[msg.sender] = EstadoCuenta(
            3243,
            123343,
            "lee",
            34
        );
    }
}
