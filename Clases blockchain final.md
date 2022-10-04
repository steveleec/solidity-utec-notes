# **BLOCKCHAIN DEVELOPMENT en UTEC**

## **Ponente**

Senior Smart Contract Developer en [dcSpark.io](http://dcSpark.io), el primer side chain de Cardano. Cofundador y Líder en Blockchain del juego [Pachacuy.io](http://Pachacuy.io) (El Axie Infinity de South America). Desarollador Blockchain en [CuyToken.com](http://CuyToken.com), la primera empresa de criptocréditos del Perú. 5+ años de experiencia en compañías Fintech (e.g. Yodlee, Tenpo, FIDIS y CuyToken). Estudió Computer Programming Certificate en la Universidad de Santa Clara, California, USA. Graduado del bootcamp del programa inmersivo de Ingeniería de Software Hack Reactor, Los Ángeles. Graduado de Lean UX and Service Design Program (UTEC) y del diplomado de Finanzas Corporativas (UPC).

## **Objetivo**

Explicar y transmitir las herramientas que usan en el día a día los desarrolladores blockchain. Comunicar las buenas prácticas de la industria. Exponer casos de negocio y aplicaciones reales que se han creado dentro del Blockchain.

## **Modalidad de Trabajo**

1. El desarrollo de las clases de programación está basado en casos de la vida real
2. Las herramientas de blockchain que se usarán en el desarrollo del código son consideradas estándar y buenas prácticas
3. Se planteará el desarrollo de una startup blockchain ficticia que será el punto de partida para el desarrollo de los Smart Contracts

## **Proyectos a desarrollar**

1. Creación de una criptomoneda (ERC20)
2. Creación de un contrato de compra/venta de tokens
3. Desarrollo de un contrato Airdrop (lista blanca y merkle tree)
4. Desarrollo de una colección de 10,000 NFTs
5. Desarrollo de una librería NPM agnóstica (para front y back) que permita interactuar con los contratos inteligentes
6. Front end minimalista para interactuar con los smart contracts usando la librearía NPM

## **Proyectos desarrollados**

A continuación es una lista de projectos en los que trabajo de princpio a fin. Servirá de inspiración para los proyectos finales.

**<u>Cuy Token</u>**

![image](/Users/steveleec/Documents/UTEC/repo-notes/Classes blockchain.assets/image-20220930232557988.png)

- Sinopsis: Vender el token para poder otorgar préstamos a diferentes tipos de proyectos con potencial. El primer proyecto financiado fue Pachacuy que logró recaudar 30,000 USD por su propia cuenta.
- Criptomoneda creada usando el estándar ERC20
- Publicado en Binance
- Lanzado en Lima, Perú
- Recaudación 8,000 USD en menos de dos horas
- [Código del token](https://github.com/cuytoken/smartcontract/blob/main/cuyToken.sol)
- [Testing](https://github.com/cuytoken/smartcontract/blob/testing-01/test/Test.js)

**<u>_Crypto Index (FIDIS)_</u>**

![image-20221001000025596](https://user-images.githubusercontent.com/3300958/193497019-ac7ee071-b3ee-4f08-bca3-af4c2aabe18e.png)

- Sinopsis: Comprar una sola criptomoneda que represente a las veinticinco criptomonedas más importantes (tipo S&P 500). Esta lista variará dependiendo de la importancia de cada token.
- Índice de las 25 primero criptomonedas
- Se publicó en Optimism (Layer 2, costos de transacción son exponencialmente diminutos en comparación a Ethereum)
- Multifirma - La ejecución de métodos tiene que ser aprobado por varios administradores antes de ser aprobado
- [Código del token](https://optimistic.etherscan.io/address/0x2735e0080638f8a5373393f3d083ed2777651931#code)
- [Unit Testing](https://github.com/steveleec/25-token-index/blob/main/test/Test.js)
- [Whitepaper](https://github.com/FIDISCorp/FI25/blob/main/docs/FIDIS%20FI25%20Crypto%20Index%20White%20Paper.pdf)

**<u>_Pachacuy (Axie Infinity de America del Sur)_</u>**

![image-20221001000121020](https://user-images.githubusercontent.com/3300958/193497016-7cb60c31-7a31-42a6-9ea1-18d74aafe9a1.png)

- Sinopsis: Juego que representa un mundo virtual en el cual un cuy (personaje principal - NFT) puede comprar tierras y establecer negocios dentro. Los cuyes visitantes hacen uso de los negocios. Estas transacciones tienen el potencial de generar ingresos para dueños y clientes.
- Hay creado su propia moneda llamada Pachacuy
- Toda la lógica del juego está desarrollado en Smart Contracts
- Publicado en Polygon
- Familia (17) de Smart Contracts interconectados
- Implementa diferentes estándares de tokens (ERC777, ERC1155)
- [Código del juego](https://github.com/cuytoken/pachacuy-smart-contracts/tree/master/contracts)
- [Testing](https://github.com/cuytoken/pachacuy-smart-contracts/tree/master/test)
- [White Paper](https://pachacuy.gitbook.io/pachacuy/)
- [Juego en producción](https://play.pachacuy.io/)

**<u>_Colección Moche_</u>**

![image-20221001161514110](https://user-images.githubusercontent.com/3300958/193497010-c53836d7-02f4-4236-8684-09623f5b5943.png)

1. Sinospsis: colección de 10,000 NFTs lanzado en la red Binance. El personaje principal es un cuy y fue creado con un algoritmo de generación de imágenes por capas.
2. Se utilizó un smart contract que sigue el estándar ERC721
3. [Página de compra](https://www.pachacuy.io/moches.php)
4. [Collección en vitrina de Tofu](https://tofunft.com/collection/pachacuy-moche/items)

**<u>_Rand Network_</u>**

![image-20221001154441301](https://user-images.githubusercontent.com/3300958/193497014-16c3c730-4df8-4569-a680-9e98536db28b.png)

![image-20221001155204926](https://user-images.githubusercontent.com/3300958/193497012-f2193f37-90cb-4d80-ac05-236a1cdc622c.png)

1. Sinopsis: Los usuarios depositan USDC (una moneda estable) en Ethereum. Al juntarse, se invierte en diferentes protocolos de Finanzas Decentralizadas (DeFi) que generan intereses y/o recompensas sobre lo depositado. Luego de un tiempo, se retiran los intereses generados para ser repartidos entre los usuarios iniciales
2. Se utilizan dos diferentes blockchain Ethereum y Moonbeam. En la red Ethereum se manejan los fondos e inversiones. En Polygon se realizan las transacciones y procesamientos pesados. La razón de la separación es el costo de transacción.
3. Utiliza contratos actualizables que le permiten arreglar bugs futuros o crear nuevas estructuras de datos internat para albergar información relevante adicional.

**<u>_dcSpark_</u>**

![image-20221001162033296](https://user-images.githubusercontent.com/3300958/193497009-06fe33d3-378b-4182-bed1-36afc35b28af.png)

1. Sinopsis: Crear compatibilidad para blockchains que no son compatible con la Maquina Virtual de Ethereum. Lo hace a través de la creación de Sidechains o la implementación de Layer 2.
2. En la actualidad, mi trabajo es crear un contrato de Staking. Es decir, un contrato que otorga beneficios por realizar depósitos, muy parecido a un depósito a plazo fijo.

## **Blockchain Framework:**

![image-20221001173609057](https://user-images.githubusercontent.com/3300958/193497008-44d89e72-3b9d-413c-af32-68bc8a3a5b54.png)

1. Transacción: unidad fundamental dentro de un blockchain. Cualquier operación llevada a cabo se atomiza en una transacción que es enviada por un usuario para ser incluida en el siguiente blocke.
2. Wallet: Es como una cuenta de banco. Se usa para ejecutar transacciones. Así mismo, una wallet puede llevar la cuenta de los activos de una dirección (address). La wallet en sí misma no almacena los activos, solo muestra los balances.
3. Signature: Una firma digital por el usuario es necesaria firmar una transacción antes de que sea incluida en la network,
4. Mempool: Luego de que una transacción es firmada, se incluye en la Mempool. Este es el lugar donde todas las transacciones esperan por un validador para que puede incluirlo en el bloque.
5. Network: la naturaleza de la red de nodos que mantiene en pie al Blockchain es distribuida. Cualquiera está en la posibilidad de obtener una copia desde la primera hasta la última transacción del Blockchain (no centralización de la información). Bajo este modelo, la red es capaz de determinar qué transacciones son válidas.
6. Consensus: Es una manera de crear un mecanismo de votación entre los nodos. PoS, PoW.
7. Hashing: es el proceso de generar una huella digital única. Se utilizan funciones que hacen Hash cuyo input es la data. Un cambio infinitesimal en la data y el hash obtenido es completamente diferente. Ello invalidaría al bloque.
8. Block: Es un contenedor de todas las transacciones que se añadirán al blockchain. Estos bloques están linkeados unos con otros mediante valores de hash.
9. Blockchain: Es un libro público en el cual los bloques están linkeados, lo cual nos permite ver si las transacciones son validas o no.

## **Ethereum Virtual Machine**

***Ambiente virtual***

EVM significa Máquina Virtual de Ethereum. En simple, EVM es el sistema operativo de Ethereum. Dentro de esto, una máquina virtual puede proporcionar un entorno de ejecución para ejecutar contratos inteligentes.

Por lo general, una vez que se compila un contrato inteligente, genera dos salidas: Bytecode y ABI. El primero se carga en el EVM para el cálculo. El segundo es más legible por humanos. El código de bytes se distribuye a cada nodo que se ejecuta dentro de la red. El código de bytes se ejecuta y genera un "cambio de estado", que solo podría lograrse mediante el consenso de cada nodo. Eso convierte a la EVM en una "máquina de estado distribuida": rastrea el estado del Blockchain en cada transacción.

Existen diferentes lenguajes de programación que pueden ser entendidos por la EVM (Solidity, Vyper, etc.).

***Computadora Mundial***

La máquina virtual de Ethereum funciona como una sola entidad mantenida por miles de computadoras interconectadas llamadas nodos, que también se conoce como la computadora mundial. Estas computadoras ejecutan una implementación del cliente Ethereum y tienen una estructura de igual a igual (Peer to Peer - P2P). Su trabajo principal es procesar y validar transacciones, así como asegurar y estabilizar todo el ecosistema. Por eso, el EVM podría verse como un motor de procesamiento y una plataforma de software que utiliza computación descentralizada.

***Estado de la cadena de bloques***

Dentro de la EVM se definen las reglas para crear un nuevo estado válido de bloque a bloque. Una vez que se ejecutan los contratos inteligentes, el EVM calcula el nuevo estado de la red después de agregar un nuevo bloque a la cadena. En cualquier momento dado, la EVM tiene un y solo un estado 'canónico'. Es en este entorno que viven las cuentas de Ethereum y los contratos inteligentes. El protocolo Ethereum tiene como objetivo mantener esta máquina especial realizando operaciones ininterrumpidas.

En otras palabras, el objetivo de EVM es averiguar el estado general de Ethereum para cada bloque en el Blockchain. Utiliza un libro mayor (public ledger) distribuido donde se rastrean las transacciones y, al mismo tiempo, impone reglas a los usuarios sobre cómo interactuar con la red.

**_Capa_**

Se encuentra en la parte superior de la capa de red de nodos y hardware de Ethereum.

**_Turing completo_**

Puede realizar pasos lógicos para la función computacional. Es capaz de hacer cualquier cálculo o programa informático posible. Detrás de esta característica se encuentran los OPCODES que son como una lista operaciones aisladas que arman como piezas de lego.

**_Gas_**

A cada instrucción de EVM se le asigna un costo. Eso ayuda a mantener un recuento de los costos totales de cualquier transacción determinada. Las unidades de gas miden el costo de ejecutar operaciones en EVM. Para calcular el total de gas a gastar se cuentan el total de OPCODES a usar dado que cada uno de ellos tiene un costo espécifico. Cualquier transacción empieza en 21000 gas.

**_OPCODES (códigos de operación)_**

El EVM es capaz de ejecutar instrucciones a nivel de máquina conocidas como OPCODES (códigos de operación). Estos códigos de operación se utilizan para definir cualquier operación particular dentro del EVM. Hay códigos de operación especiales para operaciones aritméticas, así como para leer desde el almacenamiento. Cada código de operación es un byte. Se puede utilizar un máximo de 256 códigos de operación. [Ver lista completa](https://ethereum.org/en/developers/docs/evm/opcodes/).

![image-20221001194415274](https://user-images.githubusercontent.com/3300958/193497004-445908d4-23d9-4054-acaf-2f455a784a26.png)

**_Contratos inteligentes_**

Los contratos inteligentes son líneas de código utilizadas por diferentes dos o más partes para realizar transacciones entre sí. Dado que los contratos inteligentes se cargan y ejecutan en el EVM, no se necesita un tercero fiscalizador. Un contrato inteligente es una lista de operaciones que se ejecutarán cuando se cumplan ciertas condiciones. Estas operaciones pueden ser muy diferentes (por ejemplo, creación de tokens, transferencia de fondos) y estarán guiadas por código y ejecutados por máquina.

**_Bytecode_**

![image-20221001200726257](https://user-images.githubusercontent.com/3300958/193497003-3d281061-3387-4ce1-b9c0-bca9b56d0bb6.png)

El Smart Contract se compila a bytcode y ABI. El bytecode se puede traducir en OPCODES.

[Ver ejemplo de NFT del juego Pachacuy](https://polygonscan.com/address/0xc9Fd34bDA1965f2965C5238838EbB230482167B0#code)

**_ABI (application binary interface)_**

![image-20221001202149628](https://user-images.githubusercontent.com/3300958/193497002-f9fa12d0-e1cb-47b6-8019-fce5682d79e2.png)

Usado por el front para poder instanciar el objeto 'Contrato' de las librerías como Ethers.js. Es una interface en el cual se definen qué parámetros serán pasados, qué valores ser retornarán, nombres de los métodos y otras características de los métodos y propiedades del smart contract.

## **Stack (tooling) de desarrollo web 3**

Las herramientas de un blockchain developer son variadas e incluyen herramientas de testing, auditoría, computación en la nube y demás. Estas son las herramientas que uso en mi día a día como desarrollador blockchain:

- Hardhat
- Ethers.js
- Metamask
- Gnosis safe
- Open Zeppelin (standards)
- Open Zeppelin Defender
- Remix
- Mythril (by ConsenSys)
- Alchemy/Infura/Moralis
- Etherscan
- Solidity
- Faucets
- MythX

**<u>Hardhat</u>**

![image-20220927070644523](https://user-images.githubusercontent.com/3300958/193497041-1ebf903c-14d3-44de-997c-e710601ec89c.png)

1. Es un ambiente de desarrollo profesional para Ethereum.
2. Te permite publicar contratos en diferentes blockchain (Polygon, Ethereum, Binance, Mumbai, etc.) con simples configuraciones, así como también publicar en un blockchain local para poder verificar que el script de deployment es válido.
3. Provee las bases para poder realizar tests complejos de Smart Contracts de manera automatizada.
4. Incluye un Smart Contract que te permite ver lo logs en Solidity. Es decir, se puede usar 'console.log' dentro del código para analizar ciertos outputs.
5. Es posible programar la verificación de Smart Contracts en el mismo script de deployment, lo cual evita hacerlo manualmente en Etherscan.
6. Dentro de un ambiente de testing, te permite hacer un fork del blockchain Ethereum para interactuar directamente con Smart Contracts publicados en dicha red. Esto es relevante porque algunos Smart Contracts no están en Testnet y no hay otra manera de probarlos.
7. Permite configurar diferentes tipos de versión de compiladores de Solidty, así como también especificar la precisón de la optimización (runs) de los Smart Contracts.

**<u>Ethers.js</u>**

![image-20220927070621500](https://user-images.githubusercontent.com/3300958/193497043-6194550b-0af5-4673-b55e-11398e9993e6.png)

1. Librería compacta y completa que te permite interactuar con diferentes blockchain de manera programática. Es decir, puedes leer información del Blockchain, así como también acceder a métodos y propiedades de Smart Contracts publicados en el Blockchain.
2. Puede ser usado tanto el front-end como en el back-end para crear tareas o procesos automatizados que involucren interactuar con Smart Contracts publicados en el Blockchain.
3. Si es usado desde el front, por lo general se usa con Metamask (u otra billetera que funciona en el navegador). A través de Metamask, las operaciones definidas con Ether.js será firmadas con la billetera de Metamask (donde se alberga la llave privada del usuario)
4. Para ser usado desde el back, se requiere tener la llave privada alojada en un archivo .env e instanciar el objeto 'Contract' en el código del backend.

**<u>Metamask</u>**

![image-20220927070334618](https://user-images.githubusercontent.com/3300958/193497046-581118bb-6ca5-4f3a-b552-f69525c56219.png)

1. Es una billetera de criptomonedas que funciona como extensión del browser o aplicación de celular.
2. Te permite interactuar (conectar y autenticarte) con aplicaciones decentralizadas con previa confirmación del usuario antes de firmar cada transacción.
3. Con Metamask, se pueden crear llaves privadas y públicas a demanda.
4. Puedes agregar diferentes criptomonedas para visualizar el balance de las mismas, así como también realizar transferencias a diferentes cuentas (addresses) con una simple interface.

**<u>Gnosis safe</u>**

![image-20220927070450265](https://user-images.githubusercontent.com/3300958/193497044-cbaa4914-8519-40a2-8744-9a137b90958c.png)

1. Platarforma para manejar activos (criptomonedas) dentro del Blockchain
2. Se pueden crear diferentes vaúles seguros (Safe) que tienen una dirección (address) propia para poder recibir fondos
3. Estos vaúles pueden realizar transferencias con la aprobación de diferentes personas (multisig). Cada persona involucrada debe firmar de manera separada para poder aprobar una transacción. Firmar esta transacción no incurre en ningún costo.

![img](https://134244847-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2F-MhyEZtd5TVytPJtyS7v-2910905616%2Fuploads%2Fgit-blob-6b2d55c528d4c659bb0c725c4046aa2302962b9a%2Fimage.png?alt=media)

**<u>OpenZeppelin</u>**

![image-20220927070739298](https://user-images.githubusercontent.com/3300958/193497039-cb2b77cd-9b1d-4401-8b02-917b9fe8d3c4.png)

1. Provee Smart Contracts base que sirven como los fundamentos para crear otras aplicaciones más complejas.
2. En esencia, provee los implementaciones de los estándares más usados en el desarrollo de Smart Contracts (ERC20, ERC721, ERC1155, ERC777, etc.)
3. Estos Smart Contracts base siguen buenas prácticas y han sido auditados y testeados innumerables veces
4. OZ es aceptado y usado en la industria del Blockchain como un estándar de desarrollo
5. Sigue un desarrollo simple, modular y robusto. Como piezas de lego, se pueden unir y separar según la conveniencia

**<u>OpenZeppelin Defender</u>**

![image-20220927071709970](https://user-images.githubusercontent.com/3300958/193497038-137b31f1-6e5a-4e43-b48f-408b40c897d6.png)

1. Son cuatro los principales servicios que ofrece Defender: Admin, Relay, Autotask y Sentinel.
2. Admin: Te permite ejecutar funciones de algún Smart Contract usando credenciales multifirma. Es decir, dos o más cuentas podran firmar una transaccón.
3. Relayer: son intermediarios que pueden tener privilegios para ejecutar smart contracts. Un intermediario consta de una llave privada y dirección (address). Se pueden crear credenciales compartidas por múltiples desarrolladores para usar el mismo intermediario. Se puede automatizar desde el front-end con una librería de NPM.
4. Autotask: desarrolla scripts usando NodeJS que permite ejecutar ciertos métodos en un Smart Contract. Estos scripts se ejecutan en un servidor privado (serverless) a demanda. Se puede llamar a un autotask mediante un web hook (url).
5. Sentinel: Es capaz de escuchar eventos y ejecuciones de funciones provenientes de smart contracts y actuar en consecuencia. Es posible concatenar un sentinel con un autotask. El sentinel puede disparar mensajes de correo electrónico o Slack.

**<u>Remix IDE</u>**

![image-20220929222705695](https://user-images.githubusercontent.com/3300958/193497037-7deb6580-8df9-416e-a835-fbf2b75219d0.png)

1. Es una interfaz de desarrollo que permite la creación rápida de Smart Contracts. Es usado normalmente para crear rápidos prototipos o pruebas de concepto de Smart Contracts.
2. Gracias a su gran variedad de compiladores de Solidty, es ideal para debuguear entre diferentes versiones y comprobar lo que funciona.
3. Permite la publicación de Smart Contracts en diferentes blockchain a través de Metamask.
4. Se puede sincronizar el desarrollo local de smart contracts (e.g. en Visual Studio Code) con Remix IDE para propósitos de compilación y publicación

**<u>Mythril (by ConsenSys)</u>**

![image-20220929223007352](https://user-images.githubusercontent.com/3300958/193497036-2ad9cb0b-2aae-4bb2-874b-b93f6edf5935.png)

1. Herramienta de análisis de seguridad (vulnerabilidades) para Smart Contracts. Usa el bytecode que se genera al compilar los Smart Contracts.
2. Es utilizado para proceso de auditoría dado que sugiere potenciales vectores de ataque a Smart Contracts. Luego del análisis, esta herramienta señala buenas prácticas usadas para combatir las falencias encontradas.
3. Herramienta gratuita. Se ejecuta en python y la manera más sencilla de usarlo es crear un entorno virtual en PyCharm (gratuito) y ejecutar el comando de mythril que analiza el Smart Contract.
4. Permite crear graphos que muestran las conecciones entre los diferentes Smart Contracts.

**<u>Alchemy/Infura/Moralis</u>**

![image-20220929225715377](https://user-images.githubusercontent.com/3300958/193497034-3992d844-a203-47f0-b16f-5b03d5bd1c9c.png)

1. Son servicios de conexión privado a nodos de blockchain.
2. Incrementan la velocidad de respuesta ante una transacción en el blockchain
3. Disminuye drásticamente los fallos de conexión entre una aplicación decentralizada y el Blockchain

**<u>Etherscan</u>**

![image-20220929234626271](https://user-images.githubusercontent.com/3300958/193497030-622b4c34-6fc7-4948-b9f3-bdc90bc48ff6.png)

1. Es un explorador de bloques y analítica para blockchain. Además permite revisar el código de los smart contracts publicados así como también su verificación.
2. Permite indagar detalles (quién llamó el metodo, qué contrato se llamó, cuánto gas consumió la operación, qué método se ejecutó) de transacciones hash y contratos.
3. Para poder verificar contratos de manera programática, se puede obtener un API KEY y usarlo en librearías como Hardhat.

**<u>Solidity (lenguaje de programación)</u>**

![image-20220930000916248](https://user-images.githubusercontent.com/3300958/193497028-a90f9d7a-0336-4def-b45c-41af0086bec7.png)

1. Solidity es el lenguage de programación preferido entre desarrolladores así como también la gran mayoría de blockchains usan Solidity como su primer lenguage para desarrollar.
2. Es muy parecido a Javascript, C++ y Python. Es estáticamente tipado, soporta herencia de contratos, el uso de librerías y la definición de typos complejos por parte del usuario.
3. El punto de partida es definir una categoría llamada 'contract' (muy parecido al concepto de clase de Java) y crear métodos y variables dentro.
4. Su compilación product bytecode y ABI. El primero es entendido por máquinas y el segundo por seres humanos.
5. Con Solidity se pueden creara contratos de votaciones, subastas, billeteras multifirmas, entre otros.

**<u>Faucets</u>**

![image-20220930001735070](https://user-images.githubusercontent.com/3300958/193497026-dee07fcd-2dba-4835-aadd-6c98f87b80e6.png)

1. Proveen token nativos (ether) que sirven para pagar el gas de las transacciones en el blockchain.
2. Solo las redes Testnet tienen faucets. Cada testnet (mumbai, BSC testnet, Goerli, etc) posee un faucet donde pedir tokens nativos gratuitos.
3. Si se requiren tokens en mayor cantidad se puede contactar directamente a cada Blockchain en Telegram o Discord.

**<u>MythX (auditoría automatizada)</u>**

![image-20220930002626352](https://user-images.githubusercontent.com/3300958/193497023-28e7419d-3308-44b4-855c-75ce8a06e46a.png)

1. Servicio de análisis de Smart Contracts a demanda. A través de una simple interface gráfica, se muestran los resultados del análisis de vulnerabilidades de Smart Contracts.
2. Desde el Visual Studio Code, se puede usar una extensión para enviar a analizar los Smart Contracts. Del mismo modo, existen comandos de terminal para realizar la misma acción

## **Programando en Solidity**

Vamos a aprender a programar en Solidity con el objetivo de desarrollar una startup ficticia que desea llevar al mercado sus NFTs. A medida que aprendemos Solidity, iremos desarrollando diferentes Smart Contracts requeridos.

El primer Smart Contract que vamos a desarrollar será la criptomoneda (token ERC20) de la empresa que será publicado en una Testnet llamada Goerli. Antes de lograr ello, revisemos algunos conceptos sobre Solidity.

**_¿Qué es Solidity?_**

- Es un lenguaje orientado a objetos
- Lenguaje de alto nivel para la implementación de Smart Contracts
- "El código es la ley": un smart contract luego de publicado imposibilia su modificación y se ejecuta por una máquina tal cual fue redactado
- Lenguaje de llaves diseñado para desarrollar código compatible con la Máquina Virtual de Ethereum (EVM)
- Influenciado por C++, Python y Javascript
- Es estáticamente tipado, soporta la herencia (de objetos), librerías y definición de tipos de datos complejos definidos por el usuario

**_Dos tipo de cuentas en Ethereum_**

![image-20221001222155465](https://user-images.githubusercontent.com/3300958/193497001-1ad024fe-ed54-4ead-a926-b45d7c58bdb1.png)

- EOA (Externally owned account): Son usuarios (personas) que posee una llave privada. No posee código. Pueden mantener un balance positivo de Ether. Firma transacciones. Puede transferir activos (assets).
- CA (Contract Account): Son cuentas controladas por código dentro del Smart Contract.

**_Mi primer contrato en Solidity_**

En [Remix](https://remix.ethereum.org/), crear un nuevo archivo llamada

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string saludo;

    function set(string memory _nuevoSaludo) public {
        saludo = _nuevoSaludo; // no se necesita 'this'
    }

    function get() public view returns (string memory) {
        return saludo;
    }
}
```

- La primera línea nos indica la licencia del código a ser publicado de una manera en que la máquina puede entender. Imprescindible cuando se desea publicar el contrato en una red blockchain.
- La siguiente línea nos indica la versión de Solidity en la cual el código fue escrito. La palabra clave `pragma` hace referencia a instrucciones para que el compilador sepa cómo tratar el código. Cada versión de compilador podría generar un diferente output con respecto al anterior. Al especificiar versiones te aseguras compile como lo especificas según las versiones.
- Un contrato es una colección de código y estado (code + state) que vive dentro de una dirección específica en el Blokchain. En este contrato definimos una variable llamda `saludo` del tipo `string`. Se puede entender esta variable como si fuera una entrada en una base de datos que se puede consultar (usando `get`) y modificar (mediante `set`).

La gran diferencia de escribr este mismo código en otro lenguage de programación, como Javascript, es que para lograr lo mismo tendríamos que levantar un servidor y una base de datos. Además de la creación de la clase (Class - ES6) que lleve los mismo métodos, se requiriría métodos para poder guardar y leer información de la base de datos. Ello sin contar la creación de la conexión con la base de datos.

Usando Smart Contracts, el "servidor" y la "base de datos" están dados por la Máquina Virtual de Ethereum (EVM). Las lecturas y escrituras a raíz de la ejecución del código, se hace desde y sobre el blockchain.

**_Publicar el Smart Contract_**

1. Para publicar el contrato usar Metamask en la red Testnet de Goerli. Previamente solicitar Ether en algún [faucet de Goerli](https://goerlifaucet.com/).

![image-20221002063129132](https://user-images.githubusercontent.com/3300958/193497000-4ac8b832-d990-4631-8f83-d303c4b27494.png)

2. En `ENVIROMENT` escoger `Injected Provider - Metamask`, lo cual conectará el IDE de Remix con una billetera de Metamask.
3. En `CONTRACT` asegurar que está seleccionado el contrato que se desa publicar
4. Al hacer clic en `Deploy`, abrirá un pop-up de Metamask para poder confirmar y firmar la transacción, lo cual hará posible la creación del Smart Contract en el Blockchain.

<img src="https://user-images.githubusercontent.com/3300958/193496997-8adc83b8-bc59-446e-b748-add08ad19be0.png" alt="image-20221002063404065" style="zoom:30%;" />

5. Cuando la transacción haya terminado, se podrá visualizar dentro de la pestaña de `Actividad`. Hacer click en `Implementación de contrato` y se abrirá otra ventana. En dicha ventana hacer click en `Ver en el explorador de blockes`.

<img src="https://user-images.githubusercontent.com/3300958/193496996-6e1893fe-7356-4f8f-9626-6e8d978efb3a.png" alt="image-20221002065253371" style="zoom:30%;" />

6. Serás dirigido a Goerli.etherescan.io donde podrás ver los detalles de la transacción (publicación del Smart Contract). Se puede observar que el contrato ha sido creado en la siguiente dirección: `0xc5bccf767704432a3a22318a0df3067d9a3fc217`. Esta misma dirección servirá para hacer su posterior verificación.

![image-20221002070341543](https://user-images.githubusercontent.com/3300958/193496993-ecfc7741-1d7e-4e69-a7ec-2e07f0b593b3.png)

**_Verificación de un Smart Contract_**

1. Para verificar, hacer click en la dirección del contrato creado en el anterior paso. O en su defecto, ir al siguiente link `https://goerli.etherscan.io/address/0xc5bccf767704432a3a22318a0df3067d9a3fc217`, del cual la última parte será reemplazada por la dirección (address) de tu contrato.

![image-20221002071148343](https://user-images.githubusercontent.com/3300958/193496991-3ff9fb42-5b9b-4442-8e88-30999e588e1e.png)

2. Hacer click en la pestaña `Contract` que te permitirá ver el bytecode generado del Smart Contract. Para verificar, hacer clic en `Verify and Publish`.

![image-20221002072149755](https://user-images.githubusercontent.com/3300958/193496987-b6646c29-213c-470d-a925-2fe2a33a7a07.png)

3. Se abrirá una lista de opciones que tienen que ser llenadas de la siguiente manera: address del smart contract, Single File, versión del compilador (debe ser la misma usada en Remix), MIT de licencia.

![image-20221002072916426](https://user-images.githubusercontent.com/3300958/193496585-8fbdb073-48b2-407c-8308-45be845286d1.png)

4. En esta ventana copias y pegas el código de Remix. Verificas el CAPTCHA. Luego clic en `Verify and Publish`.

![image-20221002074129280](https://user-images.githubusercontent.com/3300958/193496578-46b72f49-0855-4915-acfb-67d2c78d3832.png)

4. Si todos los valores fueron incluidos correctamente, se verá el siguiente resultado:

![image-20221002073334433](https://user-images.githubusercontent.com/3300958/193496583-67848f32-7e90-48a2-b7dc-b727020e191a.png)

6. Al dirigirte a tu contrato en Goerli.etherscan.io con el siguiente link `https://goerli.etherscan.io/address/0xc5bccf767704432a3a22318a0df3067d9a3fc217`, del cual la última parte será reemplazada por la dirección (address) de tu contrato, podrás (1) encontrar el código del Smart Contract, (2) interactuar con el contrato directamente (`Read Contract` y `Write Contract`) y (3) observar otros detalles del mismo.

![image-20221002073616250](https://user-images.githubusercontent.com/3300958/193496581-80b79e6a-78df-4718-9c28-fb779aaabf85.png)

**_Hash table en contratos inteligentes_**

La estructura de datos llamado mapping es uno de los más usados en Solidity. `mapping(_KeyType => _ValueType)` Es el equivalente a un Hash Table o un objeto (`var obj = {}`) en Javascript. A cada `key` le corresopnde un `value` dentro del mapping.

![image-20221002122245338](https://user-images.githubusercontent.com/3300958/193496570-606c0ff9-4e69-4fe0-92af-24c07e9de6c0.png)

`_KeyType` no puede ser otro mapping, struct o array. `_ValueType` puede ser de cualquier tipo, incluyendo mapping, arrays y structs.

Un `mapping` empieza con una inicialización de todos los posibles valores de `_KeyType` que están mapeados a un valor por defecto que es 0. Además, con `mapping` no se lleva la cuenta de los keys cuyos valores sea 0. Ello justamente impide que no se pueda borrar un `mapping` a menos que se sepa el `key`.

Los `mapping`s solo pueden tener un tipo de ubicación de información: `storage`. No se pueden usar `mapping`s como parámetros de una función o como el valor de retorno.

Un `mapping` no tiene longitud (`length`), como lo puede tener un array. Un `mapping` tampoco es iterable porque no hay manera de conocer sus `key`s mediante ningún método. Se puede guardar las llaves del `mapping` en otro array para poder iterar luego.

En el siguiente ejemplo se incluye un `mapping` para guardar una lista de saludos en el cual el `_KeyType` se va incrementando en uno a medida que la función `set` es llamada.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string saludo; // empieza como un string vacío ('') por definición

    uint256 counter; // empieza en zero por definición
    mapping(uint256 => string) listaSaludos;

    function set(string memory _nuevoSaludo) public {
        saludo = _nuevoSaludo;

        // guardando en el mapping;
        listaSaludos[counter] = _nuevoSaludo;
        counter++; // counter += 1; // counter = counter + 1;
    }

    function get() public view returns (string memory) {
        return saludo;
    }
}
```

**_El tipo de data `Address`_**

Cada EOA (externally owned account) y Smart Contract Account tiene una dirección (`address`). Se guarda como un valor de 20 bytes (160 bits o 40 caractéres hexadecimales). Siempre se le prefija el `0x` por el formato hexadecimal. Es usado para enviar y recibir Ether, así como también otras criptomonedas no nativas.

Ejemplo: 0x5387ddeec8ddC004a217d8e172241EB5F900B302

Puede ser considerado como una indentidad pública en el Blockchain, más como un seudónimo. Para ser más preciso, se puede entender como una cuenta de banco. En el mismo modo en que necesitas una cuenta de banco para recibir y enviar dinero, se usará el `address` para enviar y/o recibir dinero, además de realizar transacciones.

En lo sucesivo se usará `address` como identificador único de un usuario involucrado en realizar alguna transacción dentro del Smart Contract.

Supongamos que deseamos asociar la edad (`uint256`) de cada usuario con su `address`. Para ello usaremos un mapping:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string saludo; // empieza como un string vacío ('') por definición

    uint256 counter; // empieza en zero por definición
    mapping(uint256 => string) listaSaludos;

    // mapping address a edad
    mapping(address => uint256) public edadPorAddress;

    function set(string memory _nuevoSaludo) public {
        saludo = _nuevoSaludo;

        // guardando en el mapping;
        listaSaludos[counter] = _nuevoSaludo;
        counter++; // counter += 1; // counter = counter + 1;
    }

    function get() public view returns (string memory) {
        return saludo;
    }

    function setEdadPorAddress(address _account, uint256 _edad) public {
        edadPorAddress[_account] = _edad;
    }
}
```

El método `setEdadPorAddress` nos ayuda a maper un `address` a una `edad` en particular.

Cabe resaltar que la palabra clave `public` se ha utilizado cuando se define el mapping de `edadPorAddress`. Al usar esta palabra clave, Solidity, automáticamente, ha creado un getter. Sin la palabra clave `public`, se tendría que añadir el siguiente código:

```solidity
    function getEdadporAddress(address _account) public view returns (uint256 _edad) {
        return edadPorAddress[_account];
    }
```

***Propagación de un Error vía `require` o `revert`***

`require` o `revert` en Solidity es usado para validar ciertas condiciones dentro del código y lanzar una excepción si dicha condición no es cumplida. Esto es importante para prevenir la finalización de una transacción si se detecta una condición indeseada.

Cabe mencionar que esta propagación del error será notada por el usuario en el front-end (dApp) antes de firmar una transacción mediante su billetera (de Metamask u otra).

Veamos cómo aplicamos `require` o `revert` en el código:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
		//...

    function setEdadPorAddressManejaError(address _account, uint256 _edad)
        public
    {
        require(_edad >= 30, "Edad menor a 30");
        edadPorAddress[_account] = _edad;
    }

    function setEdadPorAddressManejaError2(address _account, uint256 _edad)
        public
    {
        if (_edad <= 29) {
            revert("Edad menor a 30");
        }
        edadPorAddress[_account] = _edad;
    }
}
```

`revert` y `require` propagarán el error si es que no cumple las condiciones allí definidas. La única diferencia entre uno y otro es que `require` lleva el condicional y el mensaje de error como argumentos de un método. En cambio, `revert` ofrece mayor flexibilidad para validar y plantear las condiciones a cumplir. `revert` solo lleva como argumento el mensaje del error.

**_Usando eventos a modo de notificación_**

`Events` dentro de Solidity son disparados cuando algún metodo en particular es ejecutado. Los eventos pueden llevar información adicional para explicar lo que esá sucediendo. Normalmente, el nombre del evento seguido de la información que contiene, explica muy bien un suceso dentro del blockchain.

Los eventos disparados desde un Smart Contract son prograpagos en el Blockchain. Dichos eventos quedan registrados por siempre. En un futuro se pueden hacer queries de eventos disparados anteriormente. Incluso se puede usar para almacenar información de manera económica. Estos eventos pueden ser captados desde el front-end en un dApp si se establece una conexión.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.16 <0.9.0;

contract MiPrimerContrato {
    string saludo; // empieza como un string vacío ('') por definición

    uint256 counter; // empieza en zero por definición
    mapping(uint256 => string) listaSaludos;

    // mapping address a edad
    mapping(address => uint256) public edadPorAddress;

    // Eventos
    // 1 - Disparar un evento cada vez que se cambia el saludo
    // _account - address de la persona que está llamando el método
    // _nuevoSaludo - string que representa al nuevo saludo
    event CambioDeSaludo(address _account, string _nuevoSaludo);

    // 2 - Disparar un evento cuando se asocia un 'address' con una edad
    // _account - address para el cual se asocia la edad
    // _edad - nueva edad para asociar con un address
    event NuevaEdadParaAddress(address _account, uint256 _edad);

    function set(string memory _nuevoSaludo) public {
        saludo = _nuevoSaludo;

        // guardando en el mapping;
        listaSaludos[counter] = _nuevoSaludo;
        counter++; // counter += 1; // counter = counter + 1;
        emit CambioDeSaludo(msg.sender, _nuevoSaludo);
    }

    function get() public view returns (string memory) {
        return saludo;
    }

    function setEdadPorAddress(address _account, uint256 _edad) public {
        edadPorAddress[_account] = _edad;
        emit NuevaEdadParaAddress(_account, _edad);
    }
}
```

**_Consideraciones para la creación de una criptomoneda_**

Comenzaremos con la creación de una criptomoneda desde cero. Sin librerías. En la actualidad se crean critptomonedas con diez líneas de código. Como desarrolladores, es imporante conocer el funcionamiento interno. Más adelante, utilizaremos librerías que acelaran el proceso mediante templates testeados y auditados. Repasemos los elementos esenciales de todo token (escrito en código en un Smart Contract):

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

A continuación se muestra el primer borrador en base a las consideraciones expuestas:

```solidity
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

    //   5. Llevar la <u>cuenta del total de tokens</u> repartidos
    uint256 totalSupply;

    //   4. Internamente debería llevar la <u>cuenta de los balances</u> de cada persona que tiene criptomoneda
    //      Es decir, a cada billetere se le debe asociar la cantidad de tokens que tiene
    mapping(address => uint256) balances;

    //   9. Llevar la cuenta de los balances de tokens a gastar que los mismos dueños (del token) han <u>autorizado a otras cuentas para gastar</u> en su representación
    mapping(address => mapping(address => uint256)) _allowances; // permisos

    //   12. Disparar eventos de Transferencia cada vez que se transfieren tokens de un lado a otro. Dispararar eventos de Aprobación cada vez que una cuenta le da permiso a otra para gastar sus tokens
    event Transfer(address from, address to, uint256 value);

    //   1. Una criptomoneda debería tener un <u>nombre</u> que lo identifique
    function name() public pure returns (string memory) {
        return "My primer token";
    }

    //   2. Una criptomoneda debería tener un <u>símbolo</u> que lo identifique
    function symbol() public pure returns (string memory) {
        return "MPTK";
    }

    //   3. Definir la cantidad de <u>decimales</u> del token (normalmente hay 18 pero otros tokens tienen 6, como el USDC)
    function decimals() public pure returns (uint256) {
        return 18;
    }

    //   6. Método que permite la <u>acuñación</u> de tokens a favor de una cuenta en particular (`mint`)
    //      Los parámetros son la billetera (address) que recibirá los tokens y la cantidad de tokens
    function mint(address _account, uint256 _amount) public {
        totalSupply += _amount;
        balances[_account] += _amount;

        emit Transfer(address(0), _account, _amount);
    }

    // 7. Método que permite <u>quemar</u> (burn) tokens. La lógica detrás de esto es que genera deflación (menos dinero en la economía)
    function burn(address _account, uint256 _amount) public {
        totalSupply -= _amount;
        balances[_account] -= _amount;
        emit Transfer(_account, address(0), _amount);
    }

    // 8. Método que permite <u>transferir</u> tus propios tokens a una segunda persona (método `transfer`)
    function transfer(address _account, uint256 _amount) public {
        balances[msg.sender] -= _amount;
        balances[_account] += _amount;

        emit Transfer(msg.sender, _account, _amount);
    }

    //   10. Método que permite <u>transferir tokens en nombre</u> de una segunda persona con previa aprobación de la segunda persona (método `transferFrom`)
    //       Lleva parámetros
    //       - la cuenta de la persona que autorizó la transferencia
    //       - La cuenta de la emprepsa que recibirá los toens
    //       - la cantidad de tokens ser transferidos
    function transferFrom(
        address _sender,
        address _recipient,
        uint256 _amount
    ) public {
        // verificar permiso
        uint256 allowance_ = _allowances[_sender][msg.sender];
        require(allowance_ >= _amount, "No tiene permiso");

        // tranferir entre dos cuentas
        balances[_sender] -= _amount;
        balances[_recipient] += _amount;

        _allowances[_sender][msg.sender] = allowance_ - _amount;
    }

    //   11. Definir métodos para incrementar el permiso de gastar tokens de otra persona
    //       Este método solo puede ser llamado por la persona que desea otorgar el permiso a otra
    function approve(address spender, uint256 amount) public returns (bool) {
        _allowances[msg.sender][spender] = amount;
        return true;
    }

    // 13. Método para visualizar el total de tokens de una cuenta
    function balanceOf(address _account) public view returns (uint256) {
        return balances[_account];
    }

    // 14. Método para visualizar la cantidad de tokens a gastar en nombre de otra persona con su previo permiso
    function allowance(address _owner, address _spender)
        public
        view
        returns (uint256)
    {
        return _allowances[_owner][_spender];
    }
}
```

Publicar y verificar el Smart Contract en la red Goerli Testnet del mismo modo que se publicó [aquí](https://goerli.etherscan.io/address/0x94591A9A48eF62737017BCF5dA7e89F354e99D3c#code).

Sin embargo, este Smart Contract no tiene las verificaciones necesarias y requeridas para evitar errores. Por ejemplo, no se verifica si un usuario antes de transferir tokens, tenga el balance suficiente. Tampoco se verifica que en una transferencia, el destinatario sea una cuenta sin llave privada. A continuación se muestra un Smart Contract que hace exactamente lo mismo que el anterio y además incluyes las validaciones necesarias:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract ERC20Generic {
    uint256 totalSupply;

    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) _allowances; // permisos

    event Transfer(address from, address to, uint256 value);
    event Approval(address owner, address spender, uint256 value);

    function name() public pure returns (string memory) {
        return "My primer token";
    }

    function symbol() public pure returns (string memory) {
        return "MPTK";
    }

    function decimals() public pure returns (uint256) {
        return 18;
    }

    // 1. Esta función está expuesta para ser llamada por cualquier persona
    //    Solo cuentas (addresses) con privilegios deberían poder llamar el método de acuñación de tokens
    //    Vamos a convertirla a una función 'interna', es decir, que solo puede ser usada dentro del Smart Contract y no llamada públicamente
    //    Más adelante aprenderemos sobre 'modifiers' para poder otorgar privilegios de ejecución a ciertas cuenntas (addresses)
    // 2. Es una buena práctica verificar que el destinatario no sea un address sin llave privada (e.g. address(0) === 0x000000...000)
    function _mint(address _account, uint256 _amount) internal {
        // 2. Es una buena práctica verificar que el destinatario no sea un address sin llave privada (e.g. address(0) === 0x000000...000)
        require(_account != address(0), "Mint to the zero address");

        totalSupply += _amount;
        balances[_account] += _amount;

        emit Transfer(address(0), _account, _amount);
    }

    // 1. Con este método se pueden quemar los tokens de cualquier cuenta
    //    Vamos a convertir este método en una función interna
    // 2. Validar que no se estén quemando los tokens del address(0)
    // 3. Vamos a validar que la cuenta tenga la cantidad suficiente de tokens para quemar
    function _burn(address _account, uint256 _amount) internal {
        // 2. Validar que no se estén quemando los tokens del address(0)
        require(_account != address(0), "Burn from the zero address");

        uint256 balance_ = balances[_account];
        require(balance_ >= _amount, "Not enough tokens to burn");

        totalSupply -= _amount;
        balances[_account] -= _amount;
        emit Transfer(_account, address(0), _amount);
    }

    // Solución al burn sin protección
    // _burn es una función más generica pero interna
    // burn obliga a que el que llama el método (msg.sender), se vea afecatdo. Método público
    function burn(uint256 _amount) public {
        _burn(msg.sender, _amount);
    }

    // 1. Es buena práctica verificar que el que envia y el que recibe no sean un address sin clave privada (e.g. address(0))
    // 2. El que envía los tokens debería tener la suficiente cantidad de tokens
    function transfer(address _to, uint256 _amount) public returns (bool) {
        // 1. Es buena práctica verificar que el que envia y el que recibe no sean un address sin clave privada (e.g. address(0))
        require(_to != address(0), "Sending to zero address");

        // 2. El que envía los tokens debería tener la suficiente cantidad de tokens
        uint256 senderBalance = balances[msg.sender];
        require(senderBalance >= _amount, "Sender does not enough tokens");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;

        emit Transfer(msg.sender, _to, _amount);
        // _transfer(msg.sender, _to, _amount);

        return true;
    }

    // 1. Es buena práctica verificar que el que envia y el que recibe no sean un address sin clave privada (e.g. address(0))
    // 2. De la persona que se envía los tokens, debería tener la suficiente cantidad de tokens
    function transferFrom(
        address _sender,
        address _recipient,
        uint256 _amount
    ) public {
        // verificar permiso
        uint256 allowance_ = _allowances[_sender][msg.sender];
        require(
            allowance_ >= _amount,
            "No hay permiso para manejar esta cantidad de tokens"
        );

        // 1. Es buena práctica verificar que el que envia y el que recibe no sean un address sin clave privada (e.g. address(0))
        require(_sender != address(0), "Sending from zero address");
        require(_recipient != address(0), "Sending to zero address");

        // 2. De la persona que se envía los tokens, debería tener la suficiente cantidad de tokens
        uint256 senderBalance = balances[_sender];
        require(senderBalance >= _amount, "Sender does not enough tokens");

        // tranferir entre dos cuentas
        balances[_sender] -= _amount;
        balances[_recipient] += _amount;

        emit Transfer(_sender, _recipient, _amount);
        // _transfer(_sender, _recipient, _amount);

        // disminuir la cantidad del permiso de tokens otorgados
        _allowances[_sender][msg.sender] = allowance_ - _amount;
    }

    //  Los métodos 'transfer' y 'transferFrom' repiten código que puede ser abstraído en '_transfer', un método interno
    function _transfer(
        address _sender,
        address _recipient,
        uint256 _amount
    ) internal {
        require(_sender != address(0), "Sending from zero address");
        require(_recipient != address(0), "Sending to zero address");

        uint256 senderBalance = balances[_sender];
        require(senderBalance >= _amount, "Sender does not enough tokens");

        balances[_sender] -= _amount;
        balances[_recipient] += _amount;

        emit Transfer(_sender, _recipient, _amount);
    }

    // Este método es llamado por la persona que desee dar el permiso a otra cuenta
    // Es buena práctica no darle permiso a una cuenta sin llave privada (address(0))
    function approve(address spender, uint256 amount) public returns (bool) {
        require(spender != address(0), "Spender is address zero");
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
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
```

