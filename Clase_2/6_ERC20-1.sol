// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ERC20Generic1 {
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
}
