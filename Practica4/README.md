# Objetivo de la práctica
1. Implementar funciones nuevas
2. Definir un tipo de dato propio
3. Aprender a usar archivos auxiliares
4. Implementar recursión en las funciones 

## Tiempo en completar la práctica y comentarios
Aproximadamente unas 3-4 horas. Además, esta práctica me gustó por el hecho de tener que usar archivos que sean auxiliares para completar el trabajo de las funciones que queremos implementar

### Descripción de las funciones 
1. a_natural: El caso base es el 0 y este a su vez es el 'Cero' natural. Para el caso recursivo hice que si el número es mayor que 0 se representa como el sucesor de algún número n, basicamente, se quita 1 y se crea el sucesor de él.
2. a_entero: si el 'cero' natura también es 0. En el caso recursivo pasa que si está de la forma 'S n' lo vuelve un sucesor de n, es decir, suma 1 de n.
3. potenciaNat: Para el caso base sabemos que cualquier número elevado a la 0 da 1 (todo en la forma natural 'S Cero'). De forma recursiva para elevar n a la potencia S m, se multiplica n por n^m, siendo como una multiplicación repetida
4. facNat: Aquí el factorial de 0 es 1 (S Cero). De manera recursiva hice que el factorial de 'S n' se pueda obtener multiplicando 'S n' por el factorial de n, similar a como se hace de manera "normal".
5. mayorIgual: Aquí la matrioska más simple es Mati, de forma que si hay dos Mati se cumple la igualdad. Si hay una matrioska de la forma 'Cont m' tiene un tamaño mayor, es decir, que se compara los tamaños hasta llegar a Mati sola.
6. aplana: Creo que esta función fue la más complicada, ya que Mati es una sola matrioska y por ende esta ella sola en la lista pero para el caso recursivo cambia algo, debido a que si hay una matrioska de forma 'Cont m' la lista se empieza aplanar y a acomodar en la lista que es"aplanar"
#### Recursión en la canción "El pollito pio"
Escuchando esta canción con una perspectiva diferente encaja completamente con el tema de recursión, porque si se mira así el caso base sería la parte inicial donde solo está el pollito pio y cada que se agrega un nuevo animal se aplica el caso recursivo que consiste en nombrar al nuevo y regresar hasta llegar a mencionar de nuevo al pollito pio.
Esto de cierta forma me hizo recordar la canción "En la feria de Cepillín" que igual sigue la misma forma de la recursión.
