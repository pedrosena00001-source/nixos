let
        numero = [1
                2
                3
                4
                5
                6
                7
                8
                9
                10
        ];
        #tamanho total da lista
        numeroLista = builtins.length numero;


        #Recebe uma lista e um inteiro e pelo index printa o numero que corresponde a posição do inteiro
        #elementos = builtins.elemAt numero numeroLista;


        #Recebe o primeiro valor de uma lista
        primeiroElemento = builtins.head numero;


        #Recebe a lista sem o primeiro elemento
        ultimoElemento = builtins.tail numero;


        #função que funciona como um while true do nix para somar todos os elementos de uma lista
        somaLista = lista:
                if lista == []
                then 0
                else primeiroElemento + somaLista (ultimoElemento lista);
in 
        somaLista numero

