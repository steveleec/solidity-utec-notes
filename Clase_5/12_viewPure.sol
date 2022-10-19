// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Pure {
    event Puro();
    uint256 numero;

    // 1
    // no lee de las variables del smart contract
    // no lee ningun tipo de informacion almacenado en el SC (storage)

    // 2
    // una funcion  pura no genera efectos secundarios
    // no genera cambios en el state
    // no altera otras variables
    // no crea una transacción

    // 3
    // sí se pueden definir variables (temporales) dentro del cuerpo
    function functionPura(uint256 _num) public pure returns (uint256) {
        uint256 n = 3;
        return n * _num;
    }

    function functionPura1() internal pure {}

    function functionPura2() external pure {}
}

contract View {
    // event View();

    uint256 numeroUno = 123;
    uint256 numeroDos = 456;

    // 1
    // solo de lectura
    // no hace cambios en el state del smart contract
    // sí puede leer variables del smart contract
    function functionView() public view returns (uint256, uint256) {
        // emit View(); // esto es escribir en el blockchain
        // return numeroUno + numeroDos;
        return (numeroUno, numeroDos);
    }

    function functionView1() internal view {}

    function functionView2() external view {}
}
