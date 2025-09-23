module Aux where
data Natural = Cero | S Natural deriving (Eq, Show)
data Matrioska = Mati | Cont Matrioska deriving (Eq, Show)

{- Función que calcula la suma de dos naturales
  *Función auxiliar de multi_natural
-}

suma_natural :: Natural -> Natural -> Natural
suma_natural Cero  n = n
suma_natural (S m) n = suma_natural m (S n)

{- Función que calcula el producto de dos naturales
  *Función auxiliar para potenciaNat y factNat
-}

multi_natural :: Natural -> Natural -> Natural
multi_natural Cero n = Cero
multi_natural (S m) n = suma_natural n (multi_natural m n)

{- Función que calcula el tamanio de la Matrioska
  *Función auxiliar para mayorIgual
-}

tamanio :: Matrioska -> Int
tamanio Mati = 1
tamanio (Cont m) = 1 + tamanio m