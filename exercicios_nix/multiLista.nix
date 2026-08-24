let
        numeros = [ 1 2 3 4 5 6 7 8 9 10 ];

        multiLista = lista: 
        if lista == []
        then 1
        else builtins.head lista * multiLista (builtins.tail lista);

in
        multiLista numeros
