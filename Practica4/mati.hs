import Aux

{- Función: mayorIgual
   Descripción: Recibe y compara dos matrioskas y devuelve la que está dentro
   Uso: mayorIgual Mati Mati = True
        mayorIgual (Cont (Cont Mati)) Mati = True
	False en otro caso: Mati (Cont (Cont Mati))
-}

mayorIgual :: Matrioska ->  Matrioska -> Bool
mayorIgual m1 m2 = tamanio m1 >= tamanio m2

{- Función: aplana
   Descripción: recibe una Matrioska anidada y la convierte en una lista plana de todas las Matrioskas que la conforma, de adentro hacia afuera
   Uso: aplana (Cont (Cont Mati)) = [Cont (Cont Mati),Cont Mati,Mati]
-}

aplana :: Matrioska -> [Matrioska]
aplana Mati = [Mati]
aplana (Cont m) = Cont m : aplana m