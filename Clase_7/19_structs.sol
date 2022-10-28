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
            fecha: 123343,
            nombre: "lee",
            monto: 3243,
            interes: 34
        });

        listaDeEstadosCuenta[msg.sender] = estadoCuenta;
    }

    function actualizarEstadoDeCuenta() public {
        // Se crea una copia cuando se usa 'memory'
        // Cuando se modifica dicha copia, no se modifica el original que esta en el mapping
        EstadoCuenta memory estadoDeCuenta = listaDeEstadosCuenta[msg.sender];
        estadoDeCuenta.fecha = 12324;
        estadoDeCuenta.nombre = "Steve";
        // "chancar"
        // este es el mas costoso
        listaDeEstadosCuenta[msg.sender] = estadoDeCuenta;

        // no he creado una copia
        // he creado un puntero a la informacion del mapping
        EstadoCuenta storage estadoDeCuentaStorage = listaDeEstadosCuenta[
            msg.sender
        ];
        // solo cobran la escritura en el SC (gas)
        estadoDeCuentaStorage.fecha = 45555;
        estadoDeCuentaStorage.nombre = "Marcxo";

        // Se puede lograr lo mismo sin usar el keyword 'storage'
        // se lee informacion del mapping -> costo de gas
        // se guarda informacion en el mapping -< costo de gas
        listaDeEstadosCuenta[msg.sender].fecha = 45555;
        listaDeEstadosCuenta[msg.sender].nombre = "Marcxo";
        listaDeEstadosCuenta[msg.sender].interes = 123;
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

    // Arrays y Structs
    struct DNI {
        uint256 numero;
        uint256 fechaNac;
        uint256 fechaExp;
        string nombre;
        string segundoNombre;
        string apellido;
    }
    // Array definido en 'storage'
    DNI[] public listaDeVotantes;

    // uint256[] public arrayDeEnteros;
    // string[] public arrayDeCadenas;
    // REGLA PARA ARRAYS
    // Se puede hacer 'push' a un array siempre y cuando sea definido en 'storage'
    function guardarVotanteConDNI() public {
        DNI memory nuevoVotante = DNI({
            numero: 44444444,
            fechaNac: 234352,
            fechaExp: 2423423,
            nombre: "Lee",
            segundoNombre: "C",
            apellido: "M"
        });
        listaDeVotantes.push(nuevoVotante);

        // El uso de array dentro de los metodos es de manera temporal
        // El array tiene que definir a priori su longitud
        // Guardar informacion usando el indice del array
        DNI[] memory temp = new DNI[](3); // el array tiene un solo espacio
        temp[0] = nuevoVotante;
        temp[1] = nuevoVotante;
        temp[2] = nuevoVotante;
        // temp.push(nuevoVotante);
    }

    // Struct anidado en mapping
    struct Persona {
        DNI dni;
        uint256 altura;
        uint256 peso;
        // "Carro" -> 100.000
        mapping(string => uint256) listaDeActivos;
    }
    mapping(address => Persona) listaDePersonas;

    function guardarPersona() public {
        DNI memory dniPersona = DNI({
            numero: 44444444,
            fechaNac: 234352,
            fechaExp: 2423423,
            nombre: "Lee",
            segundoNombre: "C",
            apellido: "M"
        });

        // no se puede inicializar el struct de la manera legible
        // Persona memory persona = Persona({
        //     dni: dniPersona,
        //     altura: 166,
        //     peso: 66,
        //     listaDeActivos: ???
        // });

        Persona storage persona = listaDePersonas[msg.sender];
        persona.dni = dniPersona;
        persona.altura = 166;
        persona.peso = 66;
        persona.listaDeActivos["Carro"] = 100000;
    }

    function leerActivos(address _account) public view returns (uint256) {
        return listaDePersonas[_account].listaDeActivos["Carro"];
    }
}
