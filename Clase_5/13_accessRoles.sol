// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

/**
 
    |  ROLES    | MINTER | BURNER | PAUSER |
    | --------- | ------ | ------ | ------ |
    | Account 1 | True   | True   | True   |
    | Account 2 | True   | False  | True   |
    | Account 3 | False  | False  | True   |

    1. definir un mapping doble para guardar una matriz de información
    mapping 1 -> address => role
    mapping 2 -> role => boolean
    mapping(address => mapping(bytes32 => bool)) roles;

    2. definir metodo de lectura de datos de la matriz
        hasRole

    3. definir método para escribir datos en la matriz
        grantRole
        mapping[accout 1][MINTER] = true
        mapping[accout 1][BURNER] = true
        mapping[accout 1][PAUSER] = true
        
        mapping[accout 2][MINTER] = true
        mapping[accout 2][PAUSER] = true
        
        mapping[accout 3][PAUSER] = true

    4. crear modifier que verifica el acceso de los roles
    
    5. utilizar el constructor para inicializar valores
  */

contract Roles {
    // bytes32 representa al role
    // bytes32/string = "kljdslfjdslfkjdslf";
    // string MINTER_ROLE = "MINTER_ROLE";
    // setter un role:
    // roles[0x5B38Da6a701c568545dCfcB03FcB875f56beddC4][MINTER_ROLE] = true;
    // bytes1, bytes2, ... bytes32
    // bytes1 => representa un valor de 8 bits
    // bytes1 letter = "c";
    // bytes1 letter = "cc"; => ERROR
    // bytes1 numero = 0x56; 5 => 4 bits, 6 => 4bits

    // keccak256 => metodo de hasheo nativo de solidity
    // nos ayuda a calcular valores bytes32
    // keccak256("MINTER_ROLE") => 0x9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a6
    bytes32 public DEFAULT_ADMIN_ROLE = 0x00;

    // 1.
    mapping(address => mapping(bytes32 => bool)) roles;

    // 2. metodo de lectura
    function hasRole(address _account, bytes32 _role)
        public
        view
        returns (bool)
    {
        return roles[_account][_role];
    }

    // 3. metodo para escribir
    function grantRole(address _account, bytes32 _role)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        roles[_account][_role] = true;
    }

    // 4. modifier que verifique el acceso a los roles
    modifier onlyRole(bytes32 _role) {
        bool tieneRole = roles[msg.sender][_role];
        require(tieneRole, "No tiene el rol/privilegio para llamar al metodo");
        _;
    }

    // 5. darle el primer privilegio al owner
    constructor() {
        roles[msg.sender][DEFAULT_ADMIN_ROLE] = true;
    }
}

contract MethodsProtectedByRoles is Roles {
    bytes32 public MINTER_ROLE = keccak256("MINTER_ROLE");
    // 0x3c11d16cbaffd01df69ce1c404f6340ee057498f5f00246190ea54220576a848
    // 0xc7467e41cb89817a25c6e9cb3ea366c6cc511a56111959f1105b80966650af09
    bytes32 public BURNER_ROLE = keccak256("BURNER_ROLE");
    bytes32 public BURNER_ROLEE = keccak256("BURNER_ROLEE");
    bytes32 public PAUSER_ROLE = keccak256("PAUSER_ROLE");

    bool public paused;

    modifier whenNotPaused() {
        require(!paused, "Los metodos estan pausados");
        _;
    }

    uint256 totalSupply;
    mapping(address => uint256) balances;
    event Transfer(address from, address to, uint256 value);

    function mint(address _to, uint256 _amount) public onlyRole(MINTER_ROLE) {
        _mint(_to, _amount);
    }

    function burn(address _to, uint256 _amount) public onlyRole(BURNER_ROLE) {
        _burn(_to, _amount);
    }

    function pause() public onlyRole(PAUSER_ROLE) {
        paused = true;
    }

    function unpase() public onlyRole(PAUSER_ROLE) {
        paused = false;
    }

    ///////////////////////////////////////////////////////////////
    ////                    HELPERS FUNCTIONS                  ////
    ///////////////////////////////////////////////////////////////
    function _mint(address _account, uint256 _amount) internal {
        require(_account != address(0), "Mint to the zero address");

        totalSupply += _amount;
        balances[_account] += _amount;

        emit Transfer(address(0), _account, _amount);
    }

    function _burn(address _account, uint256 _amount) internal {
        // 2. Validar que no se estén quemando los tokens del address(0)
        require(_account != address(0), "Burn from the zero address");

        uint256 balance_ = balances[_account];
        require(balance_ >= _amount, "Not enough tokens to burn");

        totalSupply -= _amount;
        balances[_account] -= _amount;
        emit Transfer(_account, address(0), _amount);
    }
}
