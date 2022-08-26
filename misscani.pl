ap([],X,X).
ap([A|B],C,[A|D]) :- ap(B,C,D).

in(A,[A|_]) :- !.
in(A,[_|B]) :- in(A,B).

% Implementacao do algoritmo de busca em largura ou profundidade
% 1 = largura
% 2 = profundidade
estrategia(2).

atingemeta([_-E|_]) :- meta(E).

busca([Caminho|_], Solucao) :- atingemeta(Caminho), !, Solucao = Caminho.
busca([Caminho|Lista], Solucao) :- 
   findall(UMAEXT, estende(Caminho,UMAEXT), EXT),
   estrategia(Tipo),
   estrategia(Tipo),
   (Tipo = 1 -> ap(Lista, EXT,  Lista1);
    Tipo = 2 -> ap(EXT, Lista, Lista1)),
   busca(Lista1, Solucao).

naorepete(_-E,C) :- not(in(_-E,C)).

estende([OperacaoX-EstadoA|Caminho], [OperacaoY-EstadoB,OperacaoX-EstadoA|Caminho]) :-
   oper(OperacaoY,EstadoA,EstadoB),
   naorepete(OperacaoY-EstadoB,Caminho).

margem([F,L,C,R], M) :-
   (F = M -> write('F'); write(' ')),
   (L = M -> write('L'); write(' ')),
   (C = M -> write('C'); write(' ')),
   (R = M -> write('R'); write(' ')).

desenha(Estado) :-
     write('    '), margem(Estado, a), write('|    |'), margem(Estado,b).

escreve([_-E]) :- write('Estado Inicial: '), write(E), nl, !.
escreve([O-E|R]) :- 
    escreve(R), 
    write('Executando: '), 
    traduz(O,T),
    write(T), write(' obtemos '), /*desenha(E),*/ write(E), nl.

resolva :-
    inicial(X), 
    busca([[raiz-X]],S), 
    write(S), nl,
    escreve(S),
    write('que é a solução do problema').

%-----------------------------------
% Especificacao do problema
%-----------------------------------

%-----------------------------------
% Aspirador
%-----------------------------------

% traduz(entrarSala1, 'aspirador entrou na sala 1  ').
% traduz(entrarSala2, 'aspirador entrou na sala 2 ').
% traduz(aspirar, 'aspirando a sala atual').

% inicial([1,1,1]).
% meta([_,0,0]).

% oper(entrarSala1, [2, Y , Z], [1, Y , Z]).
% oper(entrarSala2, [1, Y , Z], [2, Y , Z]).
% oper(aspirar, [2, Y , 1], [2, Y , 0]).
% oper(aspirar, [1, 1, Z], [1, 0, Z]).

%----------------------------------------------------------------------------------------------------%

%-----------------------------------
% Jarros
%-----------------------------------

% traduz(c1, 'encher o jarro 1  ').
% traduz(c2, 'encher o jarro 2  ').
% traduz(v1, 'esvaziar o jarro 1').
% traduz(v2, 'esvaziar o jarro 2').
% traduz(12, 'despejar 1 em 2   ').
% traduz(21, 'despejar 2 em 1   ').

% inicial([0,0]).
% meta([_,2]).

% oper(c1, [X,Y], [3,Y]) :- X < 3.
% oper(c2, [X,Y], [X,4]) :- Y < 4.
% oper(v1, [X,Y], [0,Y]) :- X > 0.
% oper(v2, [X,Y], [X,0]) :- Y > 0.
% oper(12, [X,Y], [0,Y1]) :- X > 0, Y < 4, Y1 is X + Y, Y1 =< 4.
% oper(12, [X,Y], [X1,4]) :- X > 0, Y < 4, X1 is X + Y - 4, X + Y > 4.
% oper(21, [X,Y], [X1,0]) :- Y > 0, X < 3, X1 is X + Y, X1 =< 3.
% oper(21, [X,Y], [3,Y1]) :- Y > 0, X < 3, Y1 is X + Y - 3, X + Y > 3.

%----------------------------------------------------------------------------------------------------%

%-----------------------------------
% 3 Jarros
%-----------------------------------

% traduz(t1p2, 'transfere do jarro 1 para o jarro 2  ').
% traduz(t1p3, 'transfere do jarro 1 para o jarro 3  ').
% traduz(t2p1, 'transfere do jarro 2 para o jarro 1').
% traduz(t2p3, 'transfere do jarro 2 para o jarro 3').
% traduz(t3p1, 'transfere do jarro 3 para o jarro 1   ').
% traduz(t3p2, 'transfere do jarro 3 para o jarro 2   ').

% inicial([8,0,0]).
% meta([4,4,_]).

% oper(t1p2, [X,Y,Z],[0,Y1,Z]) :- X > 0, Y < 5, Y1 is X + Y, Y1 =< 5.
% oper(t1p2, [X,Y,Z],[X1,5,Z]) :- X > 0, Y < 5, X1 is X + Y - 5, X + Y > 5.
% oper(t2p1, [X,Y,Z],[X1,0,Z]) :- Y > 0, X < 8, X1 is X + Y, X1 =< 8.
% oper(t2p1, [X,Y,Z],[8,Y1,Z]) :- Y > 0, X < 8, Y1 is X + Y - 8, X + Y > 8.
% oper(t1p3, [X,Y,Z],[0,Y,Z1]) :- X > 0, Z < 3, Z1 is X + Z, Z1 =< 3.
% oper(t1p3, [X,Y,Z],[X1,Y,3]) :- X > 0, Z < 3, X1 is X + Z - 3, X + Z > 3.
% oper(t3p1, [X,Y,Z],[X1,Y,0]) :- Z > 0, X < 8, X1 is X + Z, X1 =< 8.
% oper(t3p1, [X,Y,Z],[8,Y,Z1]) :- Z > 0, X < 8, Z1 is X + Z - 8, X + Z > 8.
% oper(t2p3, [X,Y,Z],[X,0,Z1]) :- Y > 0, Z < 3, Z1 is Y + Z, Z1 =< 3.
% oper(t2p3, [X,Y,Z],[X,Y1,3]) :- Y > 0, Z < 3, Y1 is Z + Y - 3, Z + Y > 3.
% oper(t3p2, [X,Y,Z],[X,Y1,0]) :- Z > 0, Y < 5, Y1 is Y + Z, Y1 =< 5.
% oper(t3p2, [X,Y,Z],[X,5,Z1]) :- Z > 0, Y < 5, Z1 is Z + Y - 5, Z + Y > 5.

%----------------------------------------------------------------------------------------------------%

%-----------------------------------
% Fazendeiro
%-----------------------------------

% traduz(fa, 'fazendeiro vai sozinho   ').
% traduz(fb, 'fazendeiro volta sozinho ').
% traduz(la, 'fazendeiro leva o lobo   ').
% traduz(lb, 'fazendeiro traz o lobo   ').
% traduz(ca, 'fazendeiro leva a cabra  ').
% traduz(cb, 'fazendeiro traz a cabra  ').
% traduz(ra, 'fazendeiro leva o repolho').
% traduz(rb, 'fazendeiro traz o repolho').

% oper(fa, [a,L,C,R], [b,L,C,R]) :- L \= C, C \= R.
% oper(fb, [b,L,C,R], [a,L,C,R]) :- L \= C, C \= R.
% oper(la, [a,a,C,R], [b,b,C,R]) :- (C \= R; C = b).
% oper(lb, [b,b,C,R], [a,a,C,R]) :- (C \= R; C = a).%
% oper(ca, [a,L,a,R], [b,L,b,R]).
% oper(cb, [b,L,b,R], [a,L,a,R]).
% oper(ra, [a,L,C,a], [b,L,C,b]) :- (L \= C; C = b).
% oper(rb, [b,L,C,b], [a,L,C,a]) :- (L \= C; C = a).

% % [F,L,C,R], margem em que está cada elemento
% inicial([a,a,a,a]).
% meta([b,b,b,b]).

%----------------------------------------------------------------------------------------------------%

%-----------------------------------
% Canibais
%-----------------------------------

traduz(l1, 'leva 1 missionário e 1 canibal para a margem direita  ').
traduz(l2, 'leva 2 missionários para a margem direita             ').
traduz(l3, 'leva 2 canibais para a margem direita                 ').
traduz(l4, 'leva 1 missionário para a margem direita              ').
traduz(l5, 'leva 1 canibal para a margem direita                  ').

traduz(v1, 'volta 1 missionário e 1 canibal para a margem esquerda').
traduz(v2, 'volta 2 missionários para a margem esquerda           ').
traduz(v3, 'volta 2 canibais para a margem esquerda               ').
traduz(v4, 'volta 1 missionário para a margem esquerda            ').
traduz(v5, 'volta 1 canibal para a margem esquerda                ').

%----EstadoInicial-----------------------------------------------------------------------------------%

inicial([3,3,0]). % 3 missionarios e 3 canibais na margem esquerda com o bote na margem esquerda %

%--------Meta----------------------------------------------------------------------------------------%

meta([0,0,1]). % 0 missionarios e 0 canibais na margem esquerda com o bote na margem direita

%-----Operações--------------------------------------------------------------------------------------%

teste([M,C]) :- (M is C; M is 3; M is 0).

oper(l1, [M1,C1,0], [M2,C2,1]) :- M2 is (M1-1), C2 is (C1-1), M1 > 0, C1 > 0, teste([M2,C2]).
oper(l2, [M1,C,0], [M2,C,1]) :- M2 is (M1-2), M1 > 1, teste([M2,C]).
oper(l3, [M,C1,0], [M,C2,1]) :- C2 is (C1-2), C1 > 1, teste([M,C2]).
oper(l4, [M1,C,0], [M2,C,1]) :- M2 is (M1-1), M1 > 0, teste([M2,C]).
oper(l5, [M,C1,0], [M,C2,1]) :- C2 is (C1-1), C1 > 0, teste([M,C2]).

oper(v1, [M1,C1,1], [M2,C2,0]) :- M2 is (M1+1), C2 is (C1+1), M1 < 3, C1 < 3, teste([M2,C2]).
oper(v2, [M1,C,1], [M2,C,0]) :- M2 is (M1+2), M1 < 2, teste([M2,C]).
oper(v3, [M,C1,1], [M,C2,0]) :- C2 is (C1+2), C1 < 2, teste([M,C2]).
oper(v4, [M1,C,1], [M2,C,0]) :- M2 is (M1+1), M1 < 3, teste([M2,C]). 
oper(v5, [M,C1,1], [M,C2,0]) :- C2 is (C1+1), C1 < 3, teste([M,C2]).
