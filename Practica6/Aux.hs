module Aux where
data Arbol a = Vacio | AB a (Arbol a) (Arbol a) deriving (Eq, Ord, Show)

{- Función: altura
   Descripción: función auxiliar para esBalanceado que obtiene la altura del árbol
-}

altura :: Arbol a -> Int
altura Vacio = 0 
altura (AB r t1 t2) = 1 + (if altura t1 >= altura t2 then altura t1 else altura t2)

{- Función: inserta
   Descripción: función auxiliar para listaArbol que inserta elementos en un árbol binario de busqueda
-}

inserta :: (Ord a) => a -> Arbol a -> Arbol a
inserta elemento Vacio = AB elemento Vacio Vacio
inserta elemento (AB r t1 t2)
    | elemento < r = AB r (inserta elemento t1) t2
    | elemento > r = AB r t1 (inserta elemento t2)
    | otherwise = AB r t1 t2

{- Función: arma
   Descripción: funcion auxiliar de listaArbol que va creando el arbol binario de busqueda
-}

arma :: (Ord a) => [a] -> Arbol a -> Arbol a
arma [] arbolAct = arbolAct
arma (y:ys) arbolAct =
    let nuevoArbol = inserta y arbolAct
    in arma ys nuevoArbol