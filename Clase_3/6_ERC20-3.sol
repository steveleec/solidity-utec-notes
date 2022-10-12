// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ERC20Generic {
    string nameCrypto = "My Primer token";
    string symbolCrypto = "MPRTKN";

    uint256 totalSupply;
    uint256 MAX_TOTAL_SUPPLY = 10**6 * 10**18;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) _allowances;

    event Transfer(address from, address to, uint256 amount);
    event Approval(address owner, address spender, uint256 amount);

    function name() public view returns (string memory) {
        return nameCrypto;
    }

    function symbol() public view returns (string memory) {
        return symbolCrypto;
    }

    function decimals() public pure returns (uint256) {
        return 18;
    }

    // onlyAdmin: modifier
    // function mintProtegido(address _account, uint256 _amount) public onlyAdmin {
    //     _mint(_account, _amount);
    // }

    function _mint(address _account, uint256 _amount) internal {
        require(_account != address(0), "Acuniando a address 0");

        balances[_account] += _amount;
        totalSupply += _amount;
        require(totalSupply <= MAX_TOTAL_SUPPLY, "Supera el MAX TOTAL SUPPLY");

        emit Transfer(address(0), _account, _amount);
    }

    function burn(uint256 _amount) public {
        _burn(msg.sender, _amount);
    }

    function _burn(address _account, uint256 _amount) internal {
        require(_account != address(0), "Quemando de address 0");

        // uint256 miBalance = balances[_account];
        uint256 miBalance = balanceOf(_account);
        require(miBalance >= _amount, "Insuficientes tokens para quemar");

        balances[_account] -= _amount;
        totalSupply -= _amount;

        emit Transfer(_account, address(0), _amount);
    }

    // Se transfieren MIS TOKENS
    function transfer(address _to, uint256 _amount) public returns (bool) {
        // require(_to != address(0), "Envio a address zero");

        // uint256 miBalance = balanceOf(msg.sender);
        // require(miBalance >= _amount, "Insuficientes tokens para transferir");

        // balances[msg.sender] -= _amount;
        // balances[_to] += _amount;
        // emit Transfer(msg.sender, _to, _amount);
        return _transfer(msg.sender, _to, _amount);
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) public {
        uint256 permisoParaGastar = _allowances[_from][msg.sender];
        require(permisoParaGastar >= _amount, "No tengo suficiente permiso");

        // require(_from != address(0), "Enviado desde address zero");
        // require(_to != address(0), "Envio a address zero");

        // uint256 balanceFrom = balanceOf(_from);
        // require(balanceFrom >= _amount, "Insuficientes tokens del owner");

        // balances[_from] -= _amount;
        // balances[_to] += _amount;

        // emit Transfer(_from, _to, _amount);
        _transfer(_from, _to, _amount);

        _allowances[_from][msg.sender] = permisoParaGastar - _amount;
    }

    function _transfer(
        address _from,
        address _to,
        uint256 _amount
    ) internal returns (bool) {
        require(_from != address(0), "Enviado desde address zero");
        require(_to != address(0), "Enviado a address zero");

        uint256 balanceFrom = balanceOf(_from);
        require(balanceFrom >= _amount, "Insuficientes tokens");

        balances[_from] -= _amount;
        balances[_to] += _amount;

        emit Transfer(_from, _to, _amount);
        return true;
    }

    function approve(address _spender, uint256 _amount) public {
        require(_spender != address(0), "Spender es address zero");
        _allowances[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
    }

    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return _allowances[_owner][_spender];
    }
}
