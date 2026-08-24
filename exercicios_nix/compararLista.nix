let
        numeros = [ 1 2 3 4 5 6 7 8 9 10];
        verificarNumero = lista: mostraNumero:
        if lista == []
        then false
        else if builtins.head lista == mostraNumero || verificarNumero (builtins.tail lista) mostraNumero 
        then true
        else false;
  


in 
        verificarNumero numeros 3
