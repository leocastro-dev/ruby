# Em busca do tesouro

Kana é um renomado caçador de tesouros que desbrava as cavernas mais difíceis de serem exploradas em busca de artefatos antigos. Sua última aventura o levou a um sistema de cavernas inusitado, onde mal se viam caminhos planos: para transitar pela caverna, era necessário escalar para alcançar níveis mais altos ou descer para níveis mais baixos.

Durante a aventura, porém, houve um problema: um desabamento mudou a estrutura da caverna e tirou Kana de seu curso premeditado, fazendo com que este se perdesse. Além disso, André, arqui-inimigo de Kana, também estava buscando o tesouro. Kana, então, deveria pensar rápido e entender se seria possível chegar ao tesouro antes de André, e, mais importante ainda, se havia como chegar ao tesouro sem encontrar André no meio do caminho.

Um detalhe importante a ser levado em consideração nessa tarefa é sobre o equipamento usado para as escaladas/descidas dos dois indivíduos: esses equipamentos são limitados e, portanto, permitem apenas que quem o usa consiga escalar/descer uma determinada altura, e apenas nas direções cardinais (norte, sul, leste e oeste). A altura máxima que Kana pode escalar/descer é representada pela variável `h_kana`, enquanto que a altura máxima que André pode escalar/descer é representada pela variável `h_andre`.

Nesse desafio, você deve ajudar Kana a definir qual será o próximo curso de ação, escrevendo um código que, a partir da matriz `map`, onde cada posição contém um número que representa a altura daquele nivel da caverna e as posições de André, Kana e do tesouro, além das variáveis `h_kana` e `h_andre`, deve determinar se existe um caminho possível para que Kana alcance o tesouro antes de André e sem encontrá-lo no meio do caminho.

Assuma que ambos, André e Kana, sempre terminam um movimento ao mesmo tempo. Os dados de entrada foram simplificados para que cada um dos dois sempre possa seguir por, no máximo, um único caminho até o tesouro ou até se encontrarem.

# Exemplos

1. Dada a entrada com:

```ruby
positions = { andre: [2,1], kana: [2,2], tesouro: [3,3] }
h_andre = 3
h_kana = 3
map = [[10, 1, 0, 7],
       [2, 5, 10, 4],
       [9, 2, 6, 10],
       [0, 10, 5, 4]]
```

1º movimento: nesse cenário, André, que está na posição [2,1] só pode se movimentar para a posição [1,1], pois seu equipamento permite apenas que mude para uma altura que está 3 níveis acima ou abaixo da posição que se encontra, que possui altura 2. Kana, por outro lado, pode mover-se apenas para a posição [3,2].

2º movimento: daqui, André pode se mover apenas para a posição [1,0], enquanto Kana pode se movimentar para a posição [3,3], conseguindo o tesouro.

Dessa forma, é seguro para Kana seguir o caminho [[3,2],[3,3]], conseguindo o tesouro.

2. Dada a entrada com:

```ruby
positions = { andre: [1,1], kana: [0,4], tesouro: [1,3] }
h_andre = 4
h_kana = 2
map = [[10, 0, 2, 3, 5],
       [20, 5, 10, 6, 8],
       [9, 2, 6, 11, 0],
       [0, 10, 1, 4, 0]]
```

1º movimento: nesse cenário, André, que está na posição [1,1] só pode se movimentar para a posição [2,1], pois seu equipamento permite apenas que mude para uma altura que está 4 níveis acima ou abaixo da posição que se encontra, que possui altura 5. Kana, por outro lado, pode mover-se apenas para a posição [0,3].

2º movimento: da posição [2,1], André pode apenas se mover para a posição [2,2], enquanto Kana se move para a posição [0,2].

3º movimento: da posição [2,2], André pode apenas se mover para a posição [1,2], enquanto Kana se move para a posição [0,1].

4º movimento: da posição [1,2], André pode apenas se mover para a posição [1,3], chegando ao tesouro antes de Kana.

Dessa forma, Kana não consegue pegar o tesouro.

# Informações adicionais

- Os dados de entrada garantem um caminho único apenas até que algum evento aconteça. Logo, aconselhamos que faça seu código de uma maneira que interrompa a execução assim que um evento se realize;
- Caso os dois personagens se encontrem no tesouro, o evento que deve ser retornado é o de colisão entre os dois personagens.
