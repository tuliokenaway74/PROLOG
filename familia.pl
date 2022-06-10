hoje(data(10, junho, 2022)).

pai(homer, bart).
pai(homer, lisa).
pai(homer, maggie).
pai(ab, homer).
pai(ab, herb).
pai(clancy, marge).
pai(clancy, patty).
pai(clancy, selma).

mae(marge, bart).
mae(marge, lisa).
mae(marge, maggie).
mae(mona, homer).
mae(jackie, marge).
mae(jackie, patty).
mae(jackie, selma).
mae(selma, ling).

antecessor(X, Y) :- pai(X, Y).
antecessor(X, Y) :- mae(X, Y).
antecessor(X, Y) :- pai(X, Z), antecessor(Z, Y).
antecessor(X, Y) :- mae(X, Z), antecessor(Z, Y).

avo_paterno(X, Y) :- pai(X, Z), pai(Z, Y).
avo_materno(X, Y) :- pai(X, Z), mae(Z, Y).

avoh_paterna(X, Y) :- mae(X, Z), pai(Z, Y).
avoh_materna(X, Y) :- mae(X, Z), mae(Z, Y).

irmao(X, Y) :- pai(Z, X), pai(Z, Y), X \= Y.

tem_filho(X) :- pai(X, _).
tem_filho(X) :- mae(X, _).

tem_mesmo_filho(X, Y) :- pai(X, Z), mae(Y, Z).

tio(X, Y) :- irmao(X, Z), pai(Z, Y).
tio(X, Y) :- irmao(X, Z), mae(Z, Y).

primo(X, Y) :- pai(Z, X), pai(W, Y), irmao(Z, W).
primo(X, Y) :- pai(Z, X), mae(W, Y), irmao(Z, W).
primo(X, Y) :- mae(Z, X), mae(W, Y), irmao(Z, W).
