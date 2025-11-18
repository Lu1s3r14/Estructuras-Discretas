module Aux where
data HuffmanTree = Hoja Char | Node HuffmanTree HuffmanTree | Empty deriving (Show, Eq)

{- Funcion auxiliar1: usada para contar la aparicion de un caracter en una cadena. -}

cuenta :: Char -> String -> Int
cuenta _ [] = 0
cuenta ch (x:xs)
    | ch == x = 1 + cuenta ch xs
    | otherwise = cuenta ch xs

{- Funcion auxiliar2: se encarga de remover las apariciones de un caracter. -}

remueve :: Char -> String -> String
remueve _ [] = []
remueve ch (x:xs)
    | ch == x = remueve ch xs
    | otherwise = x : remueve ch xs

{- Funcion auxiliar3: usada para insertar una tupla en una lista ordenada en orden descendiente -}

inserta :: (Char, Int) -> [(Char, Int)] -> [(Char, Int)]
inserta x [] = [x]
inserta (x1, y1) ((x2, y2): xs)
    | y1 >= y2 = (x1, y1) : (x2, y2) : xs
    | otherwise = (x2, y2) : inserta (x1, y1) xs

{- Funcion auxiliar4: ordena una lista de tuplas por sus frencuencias de manera descendiente -}

ordena :: [(Char, Int)] -> [(Char, Int)]
ordena [] = []
ordena (x:xs) = inserta x (ordena xs)

{- Funcion auxiliar5: construye desde una lista al arbol de Huffman -}

armar :: [(Char, Int)] -> HuffmanTree
armar [] = Empty
armar ((x, y): sobrante) = Node (armar sobrante) (Hoja x)

{- Funcion auxiliar6: busca el codigo binario de un String en la tabla de codificacion-}

buscaCodigo :: Char -> [(Char, String)] -> String
buscaCodigo _ [] = ""
buscaCodigo x ((x', codigo): xs)
    | x == x' = codigo
    | otherwise = buscaCodigo x xs

{- Funcion auxiliar7: recorre el Arbol de Huffman para crear la tabla de codigos -}

construirTabla :: HuffmanTree -> String -> [(Char, String)]
construirTabla Empty _ = []
construirTabla (Hoja c) guarda = [(c, guarda)]
construirTabla (Node t1 t2) guarda =
    let
        tablaT1 = construirTabla t1 (guarda ++ "0")
        tablaT2 = construirTabla t2 (guarda ++ "1")
    in tablaT1 ++ tablaT2

{- Funcion auxiliar8: crea la tabla de codificacion a partir del arbol-}

generaTabla :: HuffmanTree -> [(Char, String)]
generaTabla arbol = construirTabla arbol ""

{- Funcion auxiliar9: toma la cadena de texto y la reemplaza con los codigos -}

codifica :: String -> [(Char, String)] -> String
codifica [] _ = ""
codifica (x:xs) tabla =
    let codigo = buscaCodigo x tabla
    in codigo ++ (codifica xs tabla)

{- Funcion auxiliar10: se usa para recorrer desde la raiz usando la cadena de codificacion 
                       hasta que encuentra una hoja -}

recorrido :: HuffmanTree -> String -> (Char, String)
recorrido (Hoja c) bitsobrantes = (c, bitsobrantes)
recorrido (Node t1 _) ('0':bs) = recorrido t1 bs
recorrido (Node _ t2) ('1':bs) = recorrido t2 bs