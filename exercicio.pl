progenitor(jose, joao).
progenitor(jose, ana).
progenitor(maria, joao).
progenitor(maria, ana).
progenitor(ana, helena).
progenitor(ana, joana).
progenitor(joao, mario).
progenitor(helena, carlos).
progenitor(mario, carlos).

sexo(jose, masculino).
sexo(joao, masculino).
sexo(mario, masculino).
sexo(carlos, masculino).

sexo(ana, feminino).
sexo(maria, feminino).
sexo(helena, feminino).
sexo(joana, feminino).

irma(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \= Y, sexo(X, feminino).
irmao(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \= Y, sexo(X, masculino).

descendente(X, Y) :- progenitor(Y, X).
descendente(X, Y) :- progenitor(A, X), descendente(Y, A).

mae(X, Y) :- progenitor(X, Y), sexo(X, feminino).
pai(X, Y) :- progenitor(X, Y), sexo(X, masculino).

avo(X, Y) :- progenitor(X, A), progenitor(A, Y), sexo(X, masculino).

tio(X, Y) :- irmao(A, X), progenitor(A, Y), X \= A.

primo(X, Y) :- tio(A, X), progenitor(A, Y).

/*===================================================================================================*/

adiciona(X, L, [X|L]).

apaga(X, [X|L], L).
apaga(X, [Y|L1], [Y|L2]) :- apaga(X, L1, L2).

pertence(X, [X|_]).
pertence(X, [_|Y]) :- pertence(X, Y).

concatena([], L, L).
concatena([X|L1], L, [X|L2]) :- concatena(L1, L, L2).

maximo(X, [X]).
maximo(X, [A|B]) :- maximo(X, B), X > A.
