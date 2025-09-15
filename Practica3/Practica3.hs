{- Funcion: creditos
   Descripción: al usar la función creditos y un valor válido este regresa la asignatura con esa cantidad de créditos del primer semestre de Ciencias de la Computación.
   Uso: creditos 10 = [Álgebra Superior I, Estructuras Discretas]
-}

asignatura :: [(Int, [String])]
asignatura =
  [ (04, ["Ingles I"])
  ,(10, ["Algebra Superior I, Estructuras Discretas"])
  ,(12, ["Introduccion a C.C, Matematicas para Ciencias Aplicadas I"])
  ]

creditos :: Int -> [String]
creditos cantidad =
  [ nombre | (n, nombres) <- asignatura, n == cantidad, nombre <- nombres ]


{- Función: negativo
   Descripción: cuenta los números negativos de una lista
   Uso: negativos [-2, -1, 2, 4, 6] = 2
-}

negativos :: [Int] -> Int
negativos xs = length [x | x <- xs, x < 0]


{- Función: primos
   Descripción: regresa los números primos que existan en una lista.
   Uso: primos [1..20] = [2, 3, 5, 7, 11, 13, 17, 19]
-}

esPrimo :: Int -> Bool
esPrimo n = if n < 2
  then False
  else null [x | x <- [2..n-1], n `mod` x == 0]

primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]

{- Función: conjuntoLista
   Descripción: al recibir una lista sin importar el tipo, devuelve la lista sin elementos repetidos apartir de la lisat orignal.
   Uso: conjuntoLista [1, 2, 3, 4, 5, 1,  6, 3] = [1, 2, 3, 4, 5, 6]
-}

conjuntoLista :: (Eq a) => [a] -> [a]
conjuntoLista [] = []
conjuntoLista (x:xs)
  | x `elem` xs = x : conjuntoLista (filter (/= x) xs)
  | otherwise   = x : conjuntoLista xs
