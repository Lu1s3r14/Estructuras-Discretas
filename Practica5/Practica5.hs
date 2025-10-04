module Practica5 where
import Data.Char 
import Aux

{- Función: hollerBack
   Descripción: toma una cadena en minúsculas y la regresa en mayúsculas.
   Uso: hollerBack haskell = HASKELL
-}

hollerBack :: String -> String
hollerBack [] = []
hollerBack (x:xs) = toUpper x : hollerBack xs

{- Función: palindromo
   Descripción: recibe una lista sin importar el tipo y regresa True si es palindromo, False en otro caso.
   Uso palindromo "izzi" = True
-}

palindromo :: Eq a => [a] -> Bool
palindromo [] = True
palindromo [_] = True
palindromo xs = head xs == last xs && palindromo (init (tail xs))

{- Función: replica 
   Descripción: toma un entero x, junto con otro entero n, y regresa una lista con n apariciones de x
   Uso: replica 1 3 = [1, 1, 1]
-}

replica :: Int -> Int -> [Int]
replica _ 0 = []
replica x n = x : replica x (n-1)

{- Función: recuperaElemento
   Descripción: recibe una lista y devuelve el elemento del indice especificado
   Uso: [1, 2, 3 ] 2 = 3
-}

recuperaElemento :: [a] -> Int -> a
recuperaElemento [] _ = error "fuera del rango de indice"
recuperaElemento (x:xs) n   | n < 0 = error "fuera del rango de indice"    | n == 0 = x    | otherwise = recuperaElemento xs (n-1) 

{- Función: rota
   Descripción: recibe una lista y mueve el primer elemento de una lista al final, repitiendo n veces y usando la lista resultante
   Uso: rota [1, 2, 3, 4, 5] 2 = [3, 4, 5, 1, 2] 
-}

rota :: [a] -> Int -> [a]
rota [] _ = []
rota xs 0 = xs
rota (x:xs) n = rota (xs ++ [x]) (n-1)

{- Función: extranio
   Descripción: al recibir un entero positivo regresa una lista de elementos del mismo tipo 
   si n es par se divide entre 2. Si n es impar le multiplica por 3 y agrega 1, repite hasta llegar n a 1
   Uso: extranio 5 = [5,16,8,4,2,1]
-}

extranio :: Int -> [Int]
extranio 1 = [1]
extranio n | n <= 0 = error "Debe ser mayor que cero" | numPar n = n : extranio (divi2 n) | otherwise = n : extranio (multi3 n+1)