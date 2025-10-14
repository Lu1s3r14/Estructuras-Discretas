module Practica6 where
import Aux

data Orden = InOrden | PreOrden | PosOrden deriving (Eq, Show)

{- Función: nVacios
   Descripción: recibe un árbol binario y regresa el total de nodos vacios que tenga.
   Uso: ((AB 4 (Vacio) (AB 3 Vacio Vacio ))) = 3
-}

nVacios :: Arbol a -> Int
nVacios Vacio = 1
nVacios (AB r t1 t2) = nVacios t1 + nVacios t2

{- Función: refleja
   Descripción: recibe un árbol binario y hace que todos los subarboles izquierdos sean derechos 
   y los subarboles derechos sean izquierdos.
   Uso: refleja (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio))) = AB 4 (AB 3 (AB 5 Vacio Vacio ) Vacio ) Vacio
-}

refleja :: Arbol a -> Arbol a 
refleja Vacio = Vacio
refleja (AB r t1 t2) = AB r (refleja t2) (refleja t1)

{- Función: minimo
   Descripción: Devuelve el elemento minimo del árbol.
   Uso: minimo (AB 9 (AB 4 Vacio (AB 5 Vacio (AB 6 Vacio Vacio))) Vacio) = 4
-}

minimo :: (Ord a) => Arbol a -> a 
minimo Vacio = error "El árbol está vacío"
minimo (AB r Vacio Vacio) = r 
minimo (AB r t1 Vacio) = min r (minimo t1)
minimo (AB r Vacio t2) = min r (minimo t2)
minimo (AB r t1 t2) = min r (min (minimo t1) (minimo t2))

{- Función: recorrido
   Descripción: recibe un arbol y devuelve una lista con los elementos en el recorrido
                que se eliga (InOrden, PosOrden y PreOrden)
   Uso: recorrido (AB 4 Vacio (AB 3 Vacio (AB 5 Vacio Vacio ))) InOrden = [4, 3, 5]
-}

recorrido :: Arbol a -> Orden -> [a]
recorrido Vacio _ = []
recorrido (AB r t1 t2) orden = 
    case orden of
    InOrden -> (recorrido t1 InOrden) ++ [r] ++ (recorrido t2 InOrden)

    PreOrden -> [r] ++ (recorrido t1 PreOrden) ++ (recorrido t2 PreOrden)

    PosOrden -> (recorrido t1 PosOrden) ++ (recorrido t2 PosOrden) ++ [r]

{- Función: esBalanceado
   Descripción: revisa si un árbol está balanceado, si es así regresa True,
                False en otro caso.
   Uso: esBalanceado (AB 1 (AB 2 Vacio Vacio) (AB 3 Vacio Vacio)) = True
-}

esBalanceado :: Arbol a -> Bool
esBalanceado Vacio = True
esBalanceado (AB r t1 t2) =
    let alturaIzq = altura t1
        alturaDer = altura t2
        difAltura = abs (alturaIzq - alturaDer) <= 1

        t1Balanceado = esBalanceado t1
        t2Balanceado = esBalanceado t2

   in difAltura && t1Balanceado && t2Balanceado

{- Función: listaArbol
   Descripción: recibe una lista de elementos y devuelve en un árbol binario de busqueda.
   Uso: listaArbol [5, 3, 7, 1, 9] = AB 5 (AB 3 (AB 1 Vacio Vacio) Vacio) (AB 7 Vacio (AB 9 Vacio Vacio))
-}

listaArbol :: (Ord a) => [a] -> Arbol a
listaArbol [] = Vacio
listaArbol (x:xs) = arma xs (AB x Vacio Vacio)

{- Cuando la lista no está ordenada se crea un árbol binario de busqueda balanceado y util
   Y si la lista esta ordenada no importa el orden hace un árbol binario de busqueda muy malo
-}