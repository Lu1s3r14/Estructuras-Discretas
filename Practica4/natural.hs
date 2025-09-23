import Aux

{- Función: a_natural
   Descripción: Recibe un entero cualquiera y lo convierte en la forma de dato Natural
   Uso: a_natural 3 = S (S (S Cero))
-}

a_natural :: Int -> Natural
a_natural 0 = Cero
a_natural n = S (a_natural (n-1))

{- Función: a_entero
   Descripción: Recibe un dato Natural y lo convierte en entero
   Uso: a_entero (S (S (S Cero))) = 3
-}

a_entero :: Natural -> Int
a_entero Cero = 0
a_entero (S n) = 1 + a_entero n

{- Función: potenciaNat
   Descripción: Eleva el primer número natural por el segundo natural
   Uso: potenciaNat (S (S (S Cero))) (S (S Cero)) = S (S (S (S (S (S (S (S (S Cero))))))))
                                 3^2              =                9
-}

potenciaNat :: Natural -> Natural -> Natural
potenciaNat x Cero = S Cero
potenciaNat x (S n) = multi_natural x (potenciaNat x n)

{- Función: factNat
   Descripción: Según el natural recibido devuelve su factorial
   Uso: factNat (S (S (S Cero))) = S (S (S (S (S (S Cero)))))
                      3!         =          6
-}

factNat :: Natural -> Natural
factNat Cero = S Cero
factNat (S n) = multi_natural (S n) (factNat n)