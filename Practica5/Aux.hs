module Aux (divi2, multi3, numPar) where

{- Función: divi2
   Descripción: comprueba si un entero es divisible entre 2
-}

divi2 :: Int -> Int
divi2 n = n `div` 2

{- Función: multi3
   Descripción: hace la multiplicacion por 3
-}

multi3 :: Int -> Int
multi3 n = 3 * n 

{- Función: numPar
   Descripción: Verifica si un número es par o no
-}

numPar :: Int -> Bool
numPar n = n `mod` 2 == 0