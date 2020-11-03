# Yellow Submarine

- En este juego debemos recolectar 15 monedas manejando el submarino para ganar evitando los obstáculos. 

- El submarino comienza con 3 vidas y sin escudo.

- Si el submarino pierde todas sus vidas el juego termina.

- El juego consta de un solo nivel el cual a medida que se recolectan monedas aumenta su dificultad. Una vez alcanzada una dificultad ya no disminuye aunque el submarino pierda todas sus monedas.

- El submarino no puede navegar por fuera del recuadro del juego.

## Controles

- Flechas: movimiento básico del submarino.

- (M) Mute: apaga la música del juego.
- (B) Buy: Entrar/Salir del mercado. Solo funciona estando en el mercado.
  - (V) Comprar vida.
  - (E) Comprar escudo.

## Obstáculos

### Piedra:
  - Resta 1 vida al submarino si la choca.

### Bomba:
  - Resta 2 vidas al submarino si la choca.

### Tiburón:
  - Se mueve siguiendo un movimiento recto (vertical u horizontal) con una velocidad y distancia determinadas.
  - Resta 1 vida al submarino si la choca.

### Imán:
  - Atrae al submarino un casillero hacia la izquierda dependiendo la frecuencia de atracción de este. 
  - Si la frecuencia es 3000, la atracción se produce cada 3 seg.
  - Si la frecuencia es 1000, la atracción se produce cada 1 seg.

### Pulpo:
  - Se mueve aleatoriamente con una velocidad determinada, si atrapa al submarino le saca todas las monedas que posea.

## Dificultades

### Dificultad fácil (entre 0 a 3 monedas)

- La dificultad fácil es la dificultad inicial del juego. 

- Obstáculos:	
  	- 10 piedras distribuidas en el mapa del juego (alrededor del borde del juego)
  	- 1 tiburón de movimiento horizontal (posición inicial aleatoria)
  	- 1 tiburón de movimiento vertical (posición inicial aleatoria)
 	- 1 tiburón de movimiento horizontal (custodiando el cofre)
 	- 6 bombas

### Dificultad media (entre 4 a 7 monedas)

- Esta dificultad se activa cuando el submarino recoge la 4ta moneda. 

- Se agregan los siguientes obstáculos:
	- 3 bombas
  	- 1 tiburón de movimiento horizontal (posición inicial aleatoria)
  	- 1 tiburón de movimiento vertical (posición inicial aleatoria)
  	- 1 pulpo el cual se mueve cada 2 segundos
  	- 1 imán en el borde izquierdo (Atrae 1 casillero hacia la izquierda cada 1 seg)

### Dificultad alta (entre 8 a 14 monedas)

- Esta dificultad se activa cuando el submarino recoge la 8va moneda.

- Se agregan los siguientes obstáculos:
	- 3 bombas
  	- Aumenta la fuerza de atracción del imán una unidad
  	- 1 pulpo el cual se mueve cada 1 segundo


## Monedas

- Al iniciar el juego aparece una moneda en una posición aleatoria.

- Solo puede haber una moneda al mismo tiempo en el juego, si el submarino recoge una moneda esta desaparece y se genera una nueva.

- La moneda cambia de posición en el mapa de manera aleatoria cada cierto tiempo, esta frecuencia depende de la dificultad actual del juego.
	- Dificultad fácil: las moneda cambia de posición cada 10 segundos
	- Dificultad media: las moneda cambia de posición cada 5 segundos
  	- Dificultad alta: las moneda cambia de posición cada 1 segundo

## Escudo

- Este objeto protege al submarino de un golpe, el escudo se rompe pero no pierde ninguna vida. 

- Para obtener el escudo el submarino debe dirigirse al mercado y comprarlo por un precio de 3 monedas. 

- El submarino sólo puede tener 1 escudo al mismo tiempo

- Cuando el escudo está activo se ve una burbuja de protección alrededor del submarino.

## Mercado
	
- La posición del mercado es fija y se encuentra disponible para vender items en todo momento. 

- Para poder comprar ítems el submarino debe estar en la misma posición que el mercado.

- El submarino puede comprar los siguientes items según su precio:
	- Vida: 2 monedas
	- Escudo: 3 monedas

## Cofre
	
- El cofre se encuentra escondido en el fondo del mar entre 2 piedras.

- Si el submarino pasa por el cofre recoge 3 monedas y pasará de estar cerrado a estar abierto.
