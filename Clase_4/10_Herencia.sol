// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Humano {
    function saludar() public pure virtual returns (string memory) {
        return "Hola soy Humano";
    }
}

contract Hombre is Humano {
    function saludar() public pure override returns (string memory) {
        return "Hola soy Hombre";
    }
}

// contract Marcos is Hombre {
//     function saludar() public pure override returns(string memory) {
//         return "Hola soy Marcos";
//     }
// }
