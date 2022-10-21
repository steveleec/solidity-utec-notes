// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract AccessRoles {
    bytes32 public constant DEFAULT_ADMIN_ROLE = 0x00;

    mapping(address => mapping(bytes32 => bool)) roles;

    constructor() {
        roles[msg.sender][DEFAULT_ADMIN_ROLE] = true;
    }

    modifier onlyRole(bytes32 _role) {
        require(roles[msg.sender][_role], "Account has no role/privilege");
        _;
    }

    function grantRole(address _account, bytes32 _role)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        roles[_account][_role] = true;
    }

    function revokeRole(address _account, bytes32 _role)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        roles[_account][_role] = false;
    }

    function hasRole(address _account, bytes32 _role)
        public
        view
        returns (bool)
    {
        return roles[_account][_role];
    }
}

contract ContratoParaSerLeidoYEjecutado is AccessRoles {
    bytes32 public constant SMART_C_ROLE = keccak256("SMART_C_ROLE");

    uint256 _totalBalance = 10**6 * 10**18;
    uint256 public balance;

    function totalBalance() public view returns (uint256) {
        return _totalBalance;
    }

    function funcWithPrivilege() public virtual onlyRole(SMART_C_ROLE) {
        _totalBalance += _totalBalance;
    }
}

// 1 - definir interfaces
/// incluir aqui los metodos con los cuales deseas interactuar
interface IContratoParaSerLeidoYEjecutado {
    // totalBalance
    // funcWithPrivilege
    // definir firmas de los metodos

    // totalBalance
    function totalBalance() external view returns (uint256);

    // funcWithPrivilege
    function funcWithPrivilege() external;

    // balance (que es public)
    function balance() external returns (uint256);
}

contract ContratoQueLeeYEjecuta {
    // 2 - obtener el address del contrato
    address contratoParaLeerAddress =
        0x838F9b8228a5C95a7c431bcDAb58E289f5D2A4DC;

    // PRIMERA MANERA DE UTILIZAR LA INTERFACE (llamada intercontrato)
    function leerBalanceContratoExterno() public view returns (uint256) {
        return
            IContratoParaSerLeidoYEjecutado(contratoParaLeerAddress)
                .totalBalance();
    }

    function ejecutarFuncConPrivilegio() public {
        IContratoParaSerLeidoYEjecutado(contratoParaLeerAddress)
            .funcWithPrivilege();
    }

    // SEGUNDA MANERA (llamadas intercontrato)
    // Estamos definiendo una variable
    IContratoParaSerLeidoYEjecutado cParaLeer =
        IContratoParaSerLeidoYEjecutado(contratoParaLeerAddress);

    function leerBalanceContratoExternoTwo() public view returns (uint256) {
        return cParaLeer.totalBalance();
    }

    function ejecutarFuncConPrivilegioTwo() public {
        cParaLeer.funcWithPrivilege();
    }
}

contract Leer {
    string public name = "Contrato Leer";
    uint256 public edad = 100;
}

interface ILeer {
    function name() external returns (string memory);

    function edad() external returns (uint256);
}
