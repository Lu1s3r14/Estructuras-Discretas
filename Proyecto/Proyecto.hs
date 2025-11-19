import Aux 

{- Funcion: frecuencias
   Descripcion: dada una cadena de texto, regresa una lista de tuplas que tiene 
                el caracter y su frecuencia de aparicion.
   Act5 Ejemplo de uso: 
   frecuencias "OKAWAIIKOTO" = [('O',3),('K',2),('A',2),('W',1),('I',2),('T',1)]
-}

frecuencias :: String -> [(Char, Int)]
frecuencias [] = []
frecuencias (x:xs) = (x, 1 + (cuenta x xs)) : (frecuencias (remueve x xs))

{- Funcion: arbolhuff
   Descripcion: crea un arbol de Huffman en base a una cadena de texto recibida.
   Act5 Ejemplo de uso:
   arbolhuff "OKAWAIIKOTO" =  Node (Node (Node (Node (Node (Node Empty (Hoja 'T')) (Hoja 'W')) (Hoja 'I')) (Hoja 'A')) (Hoja 'K')) (Hoja 'O')
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
   Act5 Ejemplo de uso:
   codificarTexto "OKAWAIIKOTO" = "10100100001001000100010110000011"
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
   Act5 Ejemplo de uso:
   [let frase = "OKAWAIIKOTO"]  *Se define la frase*
   [let arbol = arbolhuff frase]  *Se define el arbol de Huffman en base a la frase*
   [arbol] = Node (Node (Node (Node (Node (Node Empty (Hoja 'T')) (Hoja 'W')) (Hoja 'I')) (Hoja 'A')) (Hoja 'K')) (Hoja 'O')  *Para ver el arbol creado*
   [let bitscomprimidos = codificarTexto frase]  *se aplica la codificacion a la frase*
   [bitscomprimidos] = "10100100001001000100010110000011"   *Para ver la frase codificada*
   [decodificarTexto arbol bitscomprimidos]  * Aplicar la decodificacion a la frase en base al arbol y los bitscomprimidos*
   - Al ejecutar este ultimo devuelve la frase ya decodificada,  en este caso es "OKAWAIIKOTO" -
   - En si este es un ejemplo de como ejecutar los algoritmos juntos (menos el de frecuencias) -
   - estan entre [] lo que se debe poner tal cual en la terminal para que funcione - 
-}

decodificarTexto :: HuffmanTree -> String -> String
decodificarTexto _ "" = ""
decodificarTexto arbol bits = 
    let (caracter, bitsrestantes) = recorrido arbol bits
    in caracter : (decodificarTexto arbol bitsrestantes)