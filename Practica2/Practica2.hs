{- Función "Say Hello!"
   Descripción: recibe una cadena de texto y la devuelve concatenada con Hello.
   Uso: sayHello "palabraejemplo" = "Hello, palabraejemplo!".
-}

sayHello :: String -> String
sayHello palabra = "Hello, "  ++  palabra ++ "!"

{- Función "calcularPropina"
   Descripción: calcula la propina a partir de la cantidad a pagar en 10%
   Uso: calcularPropina "1300" = 130
-}

calcularPropina :: Double -> Double
calcularPropina cuenta = cuenta * 0.10

{- Función "menor"
   Descripción: recibe tres números e indica el menor de estos
   Uso: menor 7 9000 512 = 7
-}

menor :: Int -> Int -> Int -> Int
menor x y z =
  if x <= y && x <= z then x
  else if y <= x && y <= z then y
  else z

{- Función "decide"
   Descripción: se recibe un booleano junto con dos cadenas. Si el booleano es True regresa la primera, en cambio, si es False, devuelve la segunda
   Uso: decide True "Ven" "Vete" = Vete     decide False "Ven" "Vete" = Vete
-}

decide :: Bool -> String -> String -> String
decide elegir x y =
  if elegir then x else y 

{- Función "esDescendiente"
   Descripción: recibe cuatro valores enteros y si estan ordenados de forma decreciente regresa un booleano True, de lo contrario devuelve False
   Uso: esDescendiente 90 50 30 12 = True     esDescendiente 70 21 89 150 = False
-}

esDescendiente :: Int -> Int -> Int -> Int -> Bool
esDescendiente x y z w =
  if x > y then
  if y > z then
  if z > w then True else False
  else False
  else False

{- Función "esDivisible"
   Descripción: recibe dos valores enteros y regresa si el valor x es divisible por y
   Uso: esDivisible 10 5 = "10 es divisible entre 5"
-}

esDivisible :: Int -> Int -> String
esDivisible x y =
  if x `mod`y == 0
  then show x ++ " es divisible entre " ++ show y
  else show x ++ " no es divisible entre " ++ show y

{- Función "hipotenusa"
   Descripción: recibe dos valores de tipo flotante "b" y "h" que son base y altura respectivamente, regresa un valor flotante que es el valor de la hipotenusa calculada
   Uso: hipotenusa 9.0 12.0 = 15.0
-}

hipotenusa :: Float -> Float -> Float
hipotenusa b h = sqrt (b^2 + h^2)

{- Función "pendiente"
   Descripción: recibe dos valores en tuplas de elementos flotantes (x1, y1) y (x2, y2) regresa el valor en flotante de la pendiente de estos dos valores en donde pasa
   Uso: pendiente (3.0, 5.0) (8.0, 10.0)
-}

pendiente :: (Float, Float) -> (Float, Float) -> Float
pendiente (x1, y1) (x2, y2) = (y2 - y1) / (x2 - x1)

{- Función "distancia"
   Descripción: recibe dos elementos flotantes en tuplas de dos (x1, y1) y (x2, y2) que son los puntos en coordenadas y se regresa un valor flotante que es la distancia entre ambos puntos dados.
   Uso: distancia (7.0, 5.0) (-5.0, 9.0) = 12.649111
-}

distancia :: (Float, Float) -> (Float, Float) -> Float
distancia (x1, y1) (x2, y2) = sqrt ((x2 - x1)^2+(y2 - y1)^2)
