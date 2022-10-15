// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Humano {
    // variables definidas como 'private' no se heredan
    // 'private' variables solo se modifican si se definen setters y getters (para leer)
    string private saludo; // no se puede heredar
    mapping(address => uint256) private balances;

    // 'internal'
    // - se puede usar dentro del contrato donde fueron definidos
    // - se puede heredar a contratos derivados
    // - no puede leerse desde afuera
    mapping(address => uint256) internal balancesParaHeredar;

    // 'public'
    // - se puede usar dentro del contrato donde fueron definidos
    // - se puede heredar a contratos derivados
    // - se puede leer desde afuera
    mapping(address => uint256) public balancesParaLeerDesdeAfuera;

    function modificarBalances(address _account, uint256 _balance)
        internal
        virtual
    {
        balances[_account] = _balance;
    }

    function modificarSaludo(string memory _nuevoS) public {
        saludo = _nuevoS;
    }

    function saludar() public pure virtual returns (string memory) {
        return "Hola soy Humano";
    }

    // FUNCTION OVERLOADING - no tiene relacion con la herencia
    function saludar(string memory _saludo)
        public
        pure
        returns (string memory)
    {
        return _saludo;
    }

    function saludar(string memory _saludo, uint256 _edad)
        public
        pure
        returns (string memory)
    {
        require(_edad > 10);
        return _saludo;
    }

    function saludar2() public pure virtual returns (string memory) {
        return "Hola soy Humano";
    }

    // este metodo no se puede heredar
    function functionParaNoHeredar() private pure returns (uint256) {
        return 34;
    }

    //  metodo sí puede heredar
    function functionParaHeredar() internal pure virtual returns (uint256) {
        return 34;
    }

    // metodo sea visto desde afuera
    function functionParaVerseDesdeAfuera() public pure returns (uint256) {
        return 34;
    }
}

contract Hombre is Humano {
    string saludo;

    function saludar() public pure override returns (string memory) {
        return "Hola soy Hombre";
    }

    function leerSaludo() public view returns (string memory) {
        return saludo;
    }

    function mod() public {
        balancesParaHeredar[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4] = 33;
    }

    function functionParaHeredar() internal pure override returns (uint256) {
        return 34;
    }

    function funcQueHacePublicoUnInternal() public pure returns (uint256) {
        return functionParaHeredar();
    }

    function modificarBalancesPublico(address _account, uint256 _balance)
        public
    {
        modificarBalances(_account, _balance); // internal
    }
}

// contract Marcos is Hombre {
//     function saludar() public pure override returns(string memory) {
//         return "Hola soy Marcos";
//     }
// }
