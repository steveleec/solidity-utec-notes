// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract RandomNumber {
    function keccak256Bytes32() public pure returns (bytes32) {
        return keccak256("NUMERO_RANDOM");
    }

    function keccak256Uint256() public pure returns (uint256) {
        return uint256(keccak256("NUMERO_RANDOM"));
    }

    function keccak256Packed(address _account) public view returns (uint256) {
        // 92135706953622971080243596853568959307085536936030272369747682965262669331145
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        _account,
                        block.timestamp,
                        msg.sender,
                        "asdf"
                    )
                )
            );
    }

    // Como encuentro un numero random entre 1 y 100;
    function numeroRandomMenorA100(address _account)
        public
        view
        returns (uint256)
    {
        // 123 % 100 ==> 23
        // 999 % 100 ==> 99
        // 10000 % 100 => 0
        // N % div => R siempre estara entre 0 y (div - 1)
        // El operador modulo me devuelve valores menores (a 100)

        return (keccak256Packed(_account) % 16) + 1;
    }
}
