let
        numeros = [1 2 3 4 5 6 7 8 9 10];

        verificarNumero = lista: 
        if lista == []
        then 0
        else builtins.trace "${builtins.toString (builtins.head lista)}"(builtins.tail lista);

        par = x:
        if x - (x / 2) * 2  == 0
        then 1 
        else 0;
        
        verificarPar = list:
        if list == []
        then 0 
        else par (builtins.head list) + verificarPar (builtins.tail list);
in
        verificarPar numeros

