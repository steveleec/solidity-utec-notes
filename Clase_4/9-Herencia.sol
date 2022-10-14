// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract A {

} // contrato base (seria el contrato más base)

contract B is A {

} // Contrato B herada el contrato A // Contrato derivado

contract C is A, B {

} // Contrato C hereda B y A // contrato derivado (el mas derivado)

contract D is A, C {

} // no hereda B

// contract Humano {}
// contract Hombre is Humano {}
// contract Marcos is Humano, Hombre {} // se hereda del base al mas derivado (de izquierda a derecha)

// super
contract Humano {
    function saludoHumano() public pure returns (string memory) {
        return "Hola, soy Humano";
    }
}

contract Hombre is
    Humano /**, A, C*/
{
    function saludoDeHumanoDesdeHombre() public pure returns (string memory) {
        // cuando se busca 'saludoHumano' en los contratos papá (en los contratos base)
        // se comienza la búsqueda en los contratos más derivados (en los que están en la derecha)
        // la búsqueda del método 'saludoHumano' se hace desde el contrato C hasta el contrato Humano
        // hará la busqueda en todos los papás en orden (<-)
        return super.saludoHumano();
    }

    function saludoDeHumanoDesdeHombre2() public pure returns (string memory) {
        // apunta directamente a Humano
        return Humano.saludoHumano();
    }
}

// no aplica regla de linearization
contract E {

}

contract X {

} // no pertecena a la jerarquia de Y o E

contract Y is E {}

contract Z is X, Y {}
