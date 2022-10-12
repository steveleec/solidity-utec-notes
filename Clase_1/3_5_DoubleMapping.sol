// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract DoubleMapping {
    // Queremos llevar una contabilidad de las deudas de cada persona (usando su nombre)
    // Esto requiere de un simple 'mapping' que asocia string => uint256

    // mapping(string => uint256) public saldos;

    // function fijarSaldo(string memory _name, uint256 _saldo) public {
    //     saldos[_name] = _saldo;
    // }

    /**
     Realizar las siguientes operaciones
     1. Registrar que Lee tiene un saldo de 10,000
     2. Registrar que Jen tiene un saldo de 100,000

     Desarrollo:
     fijarSaldo("Lee", 10000)
     fijarSaldo("Jen", 100000)
     */

    // Queremos llevar la contabilidad de cuanto debe una persona a otra usando su nombre
    // Esto require de un doble mapping porque una persona puede deber a varias personas
    //  Lee -> Carmen: debe 100
    //  Lee -> Jen: debe 200
    //  Lee -> Lea: debe 300
    //  Carmen -> Lee: 200
    //  Carmen -> Jhon: 400

    // nombre person A => nombre persona B => saldo
    mapping(string => mapping(string => uint256[])) saldosMatriz;

    function fijarSaldoMatriz(
        string memory _acreedor,
        string memory _deudor,
        uint256 _saldo
    ) public {
        saldosMatriz[_acreedor][_deudor].push(_saldo);
    }

    function leetSaldoMatrix(string memory _acreedor, string memory _deudor)
        public
        view
        returns (uint256[] memory)
    {
        return saldosMatriz[_acreedor][_deudor];
    }

    function corregirMatrix(string memory _acreedor, string memory _deudor)
        public
    {
        // saldosMatriz[_acreedor][_deudor] = 0;
        delete saldosMatriz[_acreedor][_deudor];
    }
}
