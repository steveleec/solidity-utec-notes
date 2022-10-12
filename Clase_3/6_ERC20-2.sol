// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ERC20Generic {
    /**
      1. Una criptomoneda debería tener un <u>nombre</u> que lo identifique
      2. Una criptomoneda debería tener un <u>símbolo</u> que lo identifique
      3. Definir la cantidad de <u>decimales</u> del token (normalmente hay 18 pero otros tokens tienen 6, como el USDC)
      4. Internamente debería llevar la <u>cuenta de los balances</u> de cada persona que tiene criptomoneda
      5. Llevar la <u>cuenta del total de tokens</u> repartidos
      6. Método que permite la <u>acuñación</u> de tokens a favor de una cuenta en particular (`mint`)
      7. Método que permite <u>quemar</u> (burn) tokens. La lógica detrás de esto es que genera deflación (menos dinero en la economía)
      8. Método que permite <u>transferir</u> tus propios tokens a una segunda persona (método `transfer`)
          * Internamente validar que el usuario tiene más tokens de los que quiere enviar
      9. Llevar la cuenta de los balances de tokens a gastar que los mismos dueños (del token) han <u>autorizado a otras cuentas para gastar</u> en su representación
      10. Método que permite <u>transferir tokens en nombre</u> de una segunda persona con previa aprobación de la segunda persona (método `transferFrom`)
          * Validar que esa segunda persona tiene más tokens de lo que se planea enviar
      11. Definir métodos para incrementar el permiso de gastar tokens de otra persona
      12. Disparar eventos de Transferencia cada vez que se transfieren tokens de un lado a otro. Dispararar eventos de Aprobación cada vez que una cuenta le da permiso a otra para gastar sus tokens 
      13. Método para visualizar el total de tokens de una cuenta
      14. Método para visualizar la cantidad de tokens a gastar en nombre de otra persona con su previo permiso
   */

    // 1. Una criptomoneda debería tener un <u>nombre</u> que lo identifique
    string nameCrypto = "My Primer token";

    function name() public view returns (string memory) {
        return nameCrypto;
    }

    // 2. Una criptomoneda debería tener un <u>símbolo</u> que lo identifique
    string symbolCrypto = "MPRTKN";

    function symbol() public view returns (string memory) {
        return symbolCrypto;
    }

    // 3. Definir la cantidad de <u>decimales</u> del token
    //  (normalmente hay 18 pero otros tokens tienen 6, como el USDC)
    /**
        En Solidity se usa división de enteros:
        3/5 = 0
        199/200 = 0

        1   => 1000000 (6 decimals)
        0.5 =>  500000
        0.001 =>  1000
        0.000001 =>  1
        0.0000001 => 0

        1        =>  1000000000000000000000000 (18 decimals)
        10e-18   =>                          1
    */
    function decimals() public pure returns (uint256) {
        return 18;
    }

    //  4. Internamente debería llevar la <u>cuenta de los balances</u> de cada persona que tiene criptomoneda
    mapping(address => uint256) balances;

    // 5. Llevar la <u>cuenta del total de tokens</u> repartidos
    uint256 totalSupply;

    // 6. Método que permite la <u>acuñación</u> de tokens a favor de una cuenta en particular (`mint`)
    function mint(address _account, uint256 _amount) public {
        // acuñar a favor de una cuenta
        balances[_account] += _amount;

        // incrementar total supply
        totalSupply += _amount;

        emit Transfer(address(0), _account, _amount);
    }

    // 7. Método que permite <u>quemar</u> (burn) tokens. La lógica detrás de esto es que genera deflación (menos dinero en la economía)
    function burn(address _account, uint256 _amount) public {
        balances[_account] -= _amount;
        totalSupply -= _amount;

        emit Transfer(_account, address(0), _amount);
    }

    // 8. Método que permite <u>transferir</u> tus propios tokens a una segunda persona (método `transfer`)
    // YO envío los tokens (msg.sender)
    // No tiene llave privada: 0x000000000000000000000000000000000000 (address(0))
    uint256 fee = 10;
    address admin = address(this);

    function transfer(address _to, uint256 _amount) public {
        balances[msg.sender] -= _amount; // 100

        uint256 _fee = (_amount * fee) / 100;
        uint256 net = _amount - fee;
        balances[_to] += net;
        balances[admin] += _fee;

        emit Transfer(msg.sender, _to, _amount);
    }

    // 9. Llevar la cuenta de los balances de tokens a gastar que los mismos dueños (del token) han <u>autorizado a otras cuentas para gastar</u> en su representación
    // owner => spender => Q de tokens
    // el spender en el futuro, con base a este mapping, puede gastar lo tokens
    mapping(address => mapping(address => uint256)) _allowances;

    // 10. Método que permite <u>transferir tokens en nombre</u> de una segunda persona con previa aprobación de la segunda persona (método `transferFrom`)
    // function transferFrom(address _sender, address _recipient, uint256 _amount) public {
    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) public {
        uint256 permisoParaGastar = _allowances[_from][msg.sender];
        require(permisoParaGastar >= _amount, "No tengo suficiente permiso");

        balances[_from] -= _amount;
        balances[_to] += _amount;

        _allowances[_from][msg.sender] = permisoParaGastar - _amount;

        emit Transfer(_from, _to, _amount);
    }

    // 11. Definir métodos para incrementar el permiso de gastar tokens de otra persona
    function approve(address _spender, uint256 _amount) public {
        _allowances[msg.sender][_spender] = _amount;
    }

    // function increaseAllowance(address _spender, uint256 _amount) public {
    //     _allowances[msg.sender][_spender] += _amount*2;
    // }

    // function decreaseAllowance(address _spender, uint256 _amount) public {
    //     _allowances[msg.sender][_spender] -= _amount;
    // }

    // 12. Disparar eventos de Transferencia cada vez que se transfieren tokens de un lado a otro.
    //     Dispararar eventos de Aprobación cada vez que una cuenta le da permiso a otra para gastar sus tokens
    event Transfer(address from, address to, uint256 amount);

    // 13. Método para visualizar el total de tokens de una cuenta
    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    // 14. Método para visualizar la cantidad de tokens a gastar en nombre de otra persona
    //     con su previo permiso
    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return _allowances[_owner][_spender];
    }
}
