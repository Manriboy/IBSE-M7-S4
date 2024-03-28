# IBSE-M7-S4

# Sprint 4

## Objetivos del proyecto

Este proyecto tiene como objetivo el crear un contrato donde se puedan enlistar NFT (tokens ERC-721) creados y vendidos por la empresa dueña del proyecto quién tiene un token nuevo llamado MomBreY_Final (ERC-20) con el cuál poder invertir en dichos NFT. La idea es ofrecer la opción a artistas locales que no conocen mucho de tecnología la posibilidad de crear NFT y ponerlos a la venta en dicho contrato. El proyecto consta de tres (3) contratos: contrato ERC-20, contrato ERC-721 y un último contrato que interactua con el token ERC-20 y recibe tokens ERC-721.

## Explicación de contratos

### Contrato 1: ERC_20.sol

El primero es bastante simple e incluye la creación de un contrato que tiene como objetivo la creación del token ERC-20. Este contrato empieza con la creación de 1.000.000 de tokens a la cuenta de quien ejecuta el contrato y con la opción de crear más. Estos códigos son obtenidos de las clases y vienen todas las funciones correspondientes a la documentación ERC20. 

<img width="556" alt="Captura de pantalla 2024-03-27 a la(s) 19 07 40" src="https://github.com/Manriboy/masterIEBS/assets/156150473/660a5562-1e35-476a-b4ae-fd22a59c00c2">

### Contrato 2: NFT_creator.sol

En este segundo contrato, como se explica en los objetivos del proyecto, tiene como objetvio la creación de nuevos tokens ERC-721 para poder interactuar con el contrato 3. Este contrato además tiene la particularidad de restringir la creación de NFT para cualquier usuario. Por sus características de Ownable y public onlyOwner sólo el dueño del contrato puede ejecutar la creación de nuevos NFTs evitando el plagio y uso de este contrato por un tercero

<img width="864" alt="Captura de pantalla 2024-03-27 a la(s) 19 10 19" src="https://github.com/Manriboy/masterIEBS/assets/156150473/ddaeb9a1-931d-4343-97d6-c982bb1e6e3b">

### Contrato 3: Market_place.sol

Por último tenemos el contrato Market Place, qeu si bien no es un código tan completo con todas las opciones que debería tener un market place normal, cuenta con las mínimas funciones para sólo poder transar con el token ERC-20 creado, enlistar NFT, comprar NFT, agregar NFT y eliminar NFT ya vendidos.

Primera imagen, definición de token a utilizar y condición de privada (además de las librerías correspondientes y la importación contrato ERC-20 correspondientes)

<img width="811" alt="Captura de pantalla 2024-03-27 a la(s) 19 14 54" src="https://github.com/Manriboy/masterIEBS/assets/156150473/08e761b5-87a3-4512-a396-02b407b18d23">

Luego de esto, viene la definición de estructura por parte de los NFT y la función Agregar_NFT, la que precisamente usa dicha estructura para solicitar un NFT nuevo y agregarlo al listado existente

<img width="825" alt="Captura de pantalla 2024-03-27 a la(s) 19 17 24" src="https://github.com/Manriboy/masterIEBS/assets/156150473/f483866f-c646-4b51-8c61-fc57b95e8093">

Seguido de esto, viene la función Compra_NFT, que se preocupa de que el comprador (buyer) tenga saldo suficiente y que esté ingresando una posición real (los NFTs a comprar se eligen por su posición en el listado). En caso de haber problemas se responde que el pago no fue realizado y se agrega un condición particular (al final) donde se observa que una vez comprado el NFT, este llega al nuevo dueño con el doble de valor que antes

<img width="583" alt="Captura de pantalla 2024-03-27 a la(s) 19 18 37" src="https://github.com/Manriboy/masterIEBS/assets/156150473/c1d4c4a7-cd39-4a7d-be59-fa2c748e244b">

Después de esto, viene la función elimina_NFT que funciona muy similar a la de Agregar_NFT, pero con la diferencia de que aquí sólo pide como input la posición en la que está actualmente el NFT que se quiere eliminar de la lista. La función verifica que sea una posición válida 

<img width="536" alt="Captura de pantalla 2024-03-27 a la(s) 19 21 26" src="https://github.com/Manriboy/masterIEBS/assets/156150473/298a720d-7268-4770-8bae-432a26b492de">

Por último, tenemos la función lista_NFTs. Esta función es útil para revisar los NFTs actuales en la lista y saber que posición tienen. Esta función no requiere ningún input y lo que hace básicamente es recorrer el arreglo NFT almacenado en el storage del contrato para crear un nuevo arreglo temporal y mostrar el output al usuario que interactua con este contrato

<img width="833" alt="Captura de pantalla 2024-03-27 a la(s) 19 25 03" src="https://github.com/Manriboy/masterIEBS/assets/156150473/e8cbbf8f-1416-4304-973b-fb6dd390046c">

## Direcciones y transacciones involucradas

### Ambiente Sepholia Testnet

### Contrato 1: Creación de token

Hash de transacción

0xf42a9643d4fe85bbaeb77c27be14914d1df4d4d405651e8ea69bc061f752f371

<img width="1430" alt="Captura de pantalla 2024-03-27 a la(s) 19 27 03" src="https://github.com/Manriboy/masterIEBS/assets/156150473/7a6083e8-fa3b-4f8c-b8e7-d002fc499ad5">

Address de contrato

0x83168186691B8294B5169D70A0f56614044bbc16

### Verificación contrato 1

0x83168186691B8294B5169D70A0f56614044bbc16

<img width="1440" alt="Captura de pantalla 2024-03-27 a la(s) 19 29 14" src="https://github.com/Manriboy/masterIEBS/assets/156150473/d4e99040-3548-4c53-97e5-5b968064fb4d">

### Contrato 2: Creación de NFT

Hash de transacción

0xdaa652b8b8506f773317b6f46da4bf63e2aba4f6c26c99e98821887de45affbb

<img width="1440" alt="Captura de pantalla 2024-03-27 a la(s) 19 34 32" src="https://github.com/Manriboy/masterIEBS/assets/156150473/9e53abcd-93ed-4a18-b48f-e699fe75e1da">

Address de contrato

0xAe0af213227f1867FaDD6713e0420E91eeE5264F

### Verificación contrato 2

0xAe0af213227f1867FaDD6713e0420E91eeE5264F

<img width="1421" alt="Captura de pantalla 2024-03-27 a la(s) 19 36 30" src="https://github.com/Manriboy/masterIEBS/assets/156150473/1d9a69c9-e3a8-4213-8357-56c471ea1996">

### Contrato 3: Creación de Marketplace

Hash de transacción

0xcb7b4baf99347648133fc3fcf567f8d6dbf12b7e8bdf43df57878d6ef1a21b8c

<img width="1440" alt="Captura de pantalla 2024-03-27 a la(s) 19 38 33" src="https://github.com/Manriboy/masterIEBS/assets/156150473/741830d1-3baf-4f5a-89f3-7c7d95cb2c15">

Address de contrato

0x0b3123d85427C319B0efc2176d62aEcAf4f3476c

## Preguntas y respuestas

¿Qué caso de uso pretende resolver tu caso de uso basado en criptomonedas y NFT?

Dar más acceso al mundo de los NFT a pequeños artistas o creadores de contenido que no conocen este mundo, pero les gustaría participar en él. Simplemente se ponen en contacto con el dueño de los contratos y presentan su NFT. El dueño del contrato lo transforma en metadata y crea un NFT con el contrato de NFT creator. Se acuerda un precio específico y el NFT se pone a la venta. Además, el token para interactuar con el market place es un token propio por lo que la empresa puede mannejar el precio al cuál vende las monedas en caso de haber subidas o bajadas de valor en el mercado en general 

¿Qué valor añadido puede aportar sobre otros proyectos existentes?

Pudiese crear NFT para otros marketplace, se podría utilizar la moneda en otro tipo de proyectos y el Marketplace también permite ingresar NFT de otros lados. Finalmente todos los contratos pueden aportar a otros proyectos por separado

¿Cómo crees que puede mejorarse técnicamente?

El contrato de NFT está bastante escueto. Podría tener muchas otras funciones que ofrezcan una mejor experiencia al usuario que lo use. Este contrato además requiere el ingreso manual de los NFT y falta una conexión más directa entre el contrato de NFT_creator y el Marketplace (este último punto haría que la sinergia entre los tres contratos sea mejor, pero quitando quizás la posibilidad de usar el NFT en un cuarto contrato)



