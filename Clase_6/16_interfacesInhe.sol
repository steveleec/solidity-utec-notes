// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Enforcer - camisa de fuerza
// en este caso se tiene que heredar la interface
interface IEnforcer {
    function balance(address _account) external returns (uint256);
}

contract AA is IEnforcer {
    function balance(address _account) external returns (uint256) {
        // aqui defino el comportamiento de la funcionalidad
    }
}

// Door
// nos sirve para comunicarnos con otros smart contracts
// en sete caso no es necesario heredar la interface
contract Door {
    uint256 bal = 333;

    function balance() public view returns (uint256) {
        return bal;
    }
}

interface IDoor {
    // los unicos modifiers que puedes usar son external y view/pure
    function balance() external view returns (uint256);
}

contract BB {
    address dorrAddress = 0x9396B453Fad71816cA9f152Ae785276a1D578492;

    function getBalanceFromAnotherContract() public view returns (uint256) {
        return IDoor(dorrAddress).balance();
    }
}

// HERENCIA DE INTERFACES
interface IA {
    function balanceOf(address _account) external view returns (uint256);
}

interface IB is IA {
    function totalSupply() external returns (uint256);
}

contract Token is IB {
    function balanceOf(address _account)
        external
        view
        virtual
        returns (uint256)
    {}

    function totalSupply() external virtual returns (uint256) {}
}

// FUNCTION OVERLOADING y EVENTOS
interface IERC20 {
    event Transfer(address _account);
    event TransferTwo(address _accountOne, address _accountTwo);

    function balanceOf(address _account) external returns (uint256);

    function balanceOf(address _accountOne, address _accountTwo)
        external
        view
        returns (uint256, uint256);
}

contract Token2 is IERC20 {
    function balanceOf(address _account) external returns (uint256) {
        require(_account != address(0));
        emit Transfer(_account);
        return 3;
    }

    function balanceOf(address _accountOne, address _accountTwo)
        external
        view
        returns (uint256, uint256)
    {}
}
