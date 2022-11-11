// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

interface IERC721 {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    function name() external view returns (string memory);

    function symbol() external view returns (string memory);

    function tokenURI(uint256 tokenId) external view returns (string memory);

    function balanceOf(address owner) external view returns (uint256 balance);

    function ownerOf(uint256 tokenId) external view returns (address owner);

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    function approve(address to, uint256 tokenId) external;

    function setApprovalForAll(address operator, bool _approved) external;

    function getApproved(uint256 tokenId)
        external
        view
        returns (address operator);

    function isApprovedForAll(address owner, address operator)
        external
        view
        returns (bool);
}

interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return its Solidity selector to confirm the token transfer.
     * If any other value is returned or the interface is not implemented by the recipient, the transfer will be reverted.
     *
     * The selector can be obtained in Solidity with `IERC721Receiver.onERC721Received.selector`.
     */
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

library Strings {
    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT licence
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}

contract MiPrimerNFT is IERC721 {
    // 1. balanceOf: lleva la cuenta de los NFTs de un address. un argumento: owner(address)
    // 2. name: devuelve el nombre de la coleccion
    // 3. symbol: devuelve el simbolo de la collecion
    // 4. burn: quema el NFT. lo pasa al address 0. un argumento: tokenId(uint256)
            // * si otra persona tiene permiso, lo puede quemar
    // 5. safeMint: acuña un NFT a un address. secuencial.  un argumento: to (address)
            // * es safe porque verifica que el recipiento, si es un SC, puede manejar NFTs
            // 5.1 ownerOf: me devuelve quien es el duenio de un tokenId
                // un argumento: tokenId(uint256)
    // 6. approve: da permiso a una cuenta de manejar UN NFT
        // dos argumentos: to (address), tokenId(uint256)
        // 6.1 getApproved: me indica quien es el operador de UN nft con el tokenId
            // un argumento: tokenId(uint256)
    // 7. transferFrom: transfiere un NFT usando el tokenId, de una cuenta from a una cuenta to.
            // 3 argumentos: from(address), to(address), tokenId(uint256)
    // 8. safeTransferFrom: transfiere un NFT usando el tokenId, de una cuenta from a una cuenta to.
            // 3 argumentos: from(address), to(address), tokenId(uint256)
            // * además de transferir, revisa que el recipiento puede manejar NFTs
    // 9. safeTransferFrom: transfiere un NFT usando el tokenId, de una cuenta from a una cuenta to.
            // 4 argumentos: from(address), to(address), tokenId(uint256), data(bytes)
            // * además de transferir, revisa que el recipiento puede manejar NFTs

    // 10. setApprovalForAll: otorga el permiso a todos los NFTs de una cuenta
            // 2 argumentos: operator (address), approved(bool)
            // * approved: true => da permiso, false => quita permiso
            // 10.1 isApprovedForAll: me devuelve el address que puede operar todos los NFTs
                // 2 argumentos: owner (address), operator(address)

    // 11. tokenURI: nos devuelve (de manera dinámica) la ruta de la metadata para un tokenId
        // un argumento: tokenId(uint256)

    using Strings for uint256;

    // 1. balanceOf: lleva la cuenta de los NFTs de un address. un argumento: owner(address)
    // address => uint256
    mapping(address => uint256) _balances;
    function balanceOf(address owner) public view returns(uint256) {
        return _balances[owner];
    }

    string _nameCollection;
    string _symbolCollection;
    constructor(string memory _name, string memory _symbol) {
        _nameCollection = _name;
        _symbolCollection = _symbol;
    }

    // 2. name: devuelve el nombre de la coleccion
    function name() public view returns(string memory) {
        return _nameCollection;
    }

    // 3. symbol: devuelve el simbolo de la collecion
    function symbol() public view returns(string memory) {
        return _symbolCollection;
    }

    // 5. safeMint: acuña un NFT a un address. secuencial.  un argumento: to (address)
            // * es safe porque verifica que el recipiento, si es un SC, puede manejar NFTs
            // 5.1 ownerOf: me devuelve quien es el duenio de un tokenId
                // un argumento: tokenId(uint256)

    /**
        tokenId     |       addresses
        0           |         Lee
        1           |         Lee
        2           |         Pedro
        3           |         Jhon
        mapping(uint256 => address) _owners;
    */
    mapping(uint256 => address) _owners;
    uint256 counter;
    function safeMint(address to) public {
        uint256 tokenId = getCurrentCounter();
        
        _owners[tokenId] = to;
        _balances[to]++;
        
        incCounter();

        // hacer el checking
        require(_checkOnERC721Received(address(0), to, tokenId, ""), "El recipiente no soporta NFTs");

        emit Transfer(address(0), to, tokenId);
    }
    function ownerOf(uint256 tokenId) public view returns(address) {
        return _owners[tokenId];
    }

    // 4. burn: quema el NFT. lo pasa al address 0. un argumento: tokenId(uint256)
            // * si otra persona tiene permiso, lo puede quemar
    function burn(uint256 tokenId) public {
        // si le dio permiso
        address segundoDuenio = _aprobadoParaUno[tokenId];

        // si es el duenio
        address owner = _owners[tokenId];

        // si tiene el permios de TODOS los NFTs
        bool permisoTotal = _approbadoTodos[owner][msg.sender];
        
        require(
            msg.sender == owner || segundoDuenio == msg.sender || permisoTotal , 
            "No eres el duenio para quemar el NFT o no tienes permiso"
        );
        
        _owners[tokenId] = address(0);
        _balances[msg.sender]--;

        emit Transfer(msg.sender, address(0), tokenId);
    }

    // 6. approve: da permiso a una cuenta de manejar UN NFT
        // dos argumentos: to (address), tokenId(uint256)
        // 6.1 getApproved: me indica quien es el operador de UN nft con el tokenId
            // un argumento: tokenId(uint256)
    
    /** El segundo "duenio"
        tokenId     |       addresses
        0           |         Lee
        1           |         Lee
        2           |         Pedro
        3           |         Jhon
        mapping(uint256 => address) _aprobadoParaUno;
    */
    mapping(uint256 => address) _aprobadoParaUno;
    function approve(address operator, uint256 tokenId) public {
        require(msg.sender != operator, "No puedes darte permiso (a ti mismo)");

        address owner = _owners[tokenId];
        require(msg.sender == owner, "No eres el duenio del NFT");

        _aprobadoParaUno[tokenId] = operator;

        emit Approval(msg.sender, operator, tokenId);
    }
    function getApproved(uint256 tokenId) public view returns(address) {
        return _aprobadoParaUno[tokenId];
    }

    // 7. transferFrom: transfiere un NFT usando el tokenId, de una cuenta from a una cuenta to.
            // 3 argumentos: from(address), to(address), tokenId(uint256)
    function transferFrom(address from, address to, uint256 tokenId) public {
        // si le dio permiso de un NFT
        address segundoDuenio = _aprobadoParaUno[tokenId];
        
        // si es el duenio
        address owner = _owners[tokenId];
        
        // si le dio permiso de TODOS los NFTs
        bool permisoTotal = _approbadoTodos[owner][msg.sender];
        
        require(
            msg.sender == owner || segundoDuenio == msg.sender || permisoTotal, 
            "No eres el duenio del NFT o no tienes permiso"
        );

        _owners[tokenId] = to;
        _balances[from]--;
        _balances[to]++;

        emit Transfer(from, to, tokenId);
    }
    function safeTransferFrom(address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId, "");
    }

    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory data) public {
        transferFrom(from, to, tokenId);
        // adicional hace un checking
        require(_checkOnERC721Received(from, to, tokenId, data), "El recipiente no soporta NFTs");
    }

    // 10. setApprovalForAll: otorga el permiso a todos los NFTs de una cuenta
            // 2 argumentos: operator (address), approved(bool)
            // * approved: true => da permiso, false => quita permiso
            // 10.1 isApprovedForAll: me devuelve el address que puede operar todos los NFTs
                // 2 argumentos: owner (address), operator(address)
    /**
(duenios de NFTS)               Pedro               Juan              Carlos
        Lee                      Sí                 No                  Sí
        Marcos                  NO                  No                  No  
        Jhon                    Sí                  Sí                  Sí
        owner => operator => approved
        mapping(address => mapping(address => bool)) _approbadoTodos;
    */
    mapping(address => mapping(address => bool)) _approbadoTodos;
    function setApprovalForAll(address operator, bool approved) public {
        require(msg.sender != operator, "No puedes darte permiso (a ti mismo)");

        _approbadoTodos[msg.sender][operator] = approved;
        
        emit ApprovalForAll(msg.sender, operator, approved);
    }
    function isApprovedForAll(address owner, address operator) public view returns(bool) {
        return _approbadoTodos[owner][operator];
    }

    // 11. tokenURI: nos devuelve (de manera dinámica) la ruta de la metadata para un tokenId
        // un argumento: tokenId(uint256)
    string baseURI = "ipfs://QmVZkuCVeMStEYnYj1vFYDEdggwoQ2evHFn7wmj97RMUmf/";
    function tokenURI(uint256 tokenId) public view returns(string memory) {
        return string(
            abi.encodePacked(baseURI, tokenId.toString(), ".json")
        );
    }

    ////////////////////////////////////////////////////////////////////////////////////////////////
    //////                                      HELPERS                                       //////
    ////////////////////////////////////////////////////////////////////////////////////////////////

    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) private returns (bool) {
        if (to.code.length > 0) { // esto valida que es un SC
            try
                IERC721Receiver(to).onERC721Received(
                    msg.sender,
                    from,
                    tokenId,
                    data
                )
            returns (bytes4 retval) {
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert(
                        "ERC721: transfer to non ERC721Receiver implementer"
                    );
                } else {
                    /// @solidity memory-safe-assembly
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        } else {
            return true; // sino se trata de un EOA
        }
    }

    function getCurrentCounter() internal view returns(uint256) {
        return counter;
    }

    function incCounter() internal {
        counter++;
    }
}