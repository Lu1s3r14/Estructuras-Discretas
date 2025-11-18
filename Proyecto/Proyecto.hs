import Aux 

{- Funcion: frecuencias
   Descripcion: dada una cadena de texto, regresa una lista de tuplas que tiene 
                el caracter y su frecuencia de aparicion.
   Uso: frecuencias "AVRAHKADABRA" = [('A',5),('V',1),('R',2),('H',1),('K',1),('D',1),('B',1)]
-}

frecuencias :: String -> [(Char, Int)]
frecuencias [] = []
frecuencias (x:xs) = (x, 1 + (cuenta x xs)) : (frecuencias (remueve x xs))

{- Funcion: arbolhuff
   Descripcion: crea un arbol de Huffman en base a una cadena de texto recibida.
   Uso: 
-}

arbolhuff :: String -> HuffmanTree
arbolhuff frase
    | null frase = Empty
    | otherwise = 
        let frecs = frecuencias frase
            ordenadas = ordena frecs
        in armar ordenadas

{- Funcion: codificarTexto
   Descripcion: Implementa el algoritmo de codificacion en una cadena de texto
   Uso: codificarTexto "AVRAHKADABRA" = "1001011000100001100000110000001011"
-}

codificarTexto :: String -> String
codificarTexto texto
    | null texto = ""
    | otherwise = 
        let arbol = arbolhuff texto
            tabla = generaTabla arbol
        in codifica texto tabla

{- Funcion: decodificarTexto
   Descripcion: Implementa el algoritmo para decodificar la cadena de texto 
   Uso: decodificarTexto 
-}

decodificarTexto :: HuffmanTree -> String -> String
decodificarTexto _ "" = ""
decodificarTexto arbol bits = 
    let (caracter, bitsrestantes) = recorrido arbol bits
    in caracter : (decodificarTexto arbol bitsrestantes)