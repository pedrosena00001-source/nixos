let
  numeros = [ 1 2 3 4 5 6 7 8 9 19 ];

  verificarLista = lista:
    if lista == [ ]
    then 0
    else if builtins.length lista == 1
    then builtins.head lista
    else if builtins.head lista > verificarLista (builtins.tail lista)
    then builtins.head lista
    else verificarLista (builtins.tail lista);
in
  "${builtins.toString (verificarLista numeros)}"
