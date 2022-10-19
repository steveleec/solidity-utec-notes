// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract VisibilityOfMethods {
    // public
    // puede ser llamdado desde "afuera": que puede ser llamado por EOA u otros smart contracts
    // heredables
    // se puede usar dentro del contrato (ser llamado por otros metodos)
    // si se añade 'virtual', se puede sobreescribir
    // va a aparecer dentro del ABI
    function funcHeredablePublicaEInterna() public {}

    // internal
    // heredable
    // se puede usar dentro del contrato (ser llamado por otros metodos dentro del contrato)
    // si se añade 'virtual', se puede sobreescribir
    // NO puede ser llamado desde afuera
    // NO aparece en el ABI
    function funcHeredableEInterna() internal virtual {}

    // private
    // se usa dentro del contrato en el que fue definido
    // no es heredable
    // no se puede llamar desde afuera
    // no aparece en el abi
    // no es sobreescribible (ya que no es heredable)
    function funcInterna() private {}

    // external
    // heredable
    // si se añade 'virtual', se puede sobreescribir
    // puede ser llamdado desde "afuera": que puede ser llamado por EOA u otros smart contracts
    // va a aparecer dentro del ABI
    // NO se puede usar dentro del contrato
    function funcExternaYHeredable() external {}
}
