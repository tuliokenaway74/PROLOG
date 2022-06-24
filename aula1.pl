ap([], L, L).
ap([A|B], C, [A|D]) :- ap(B, C, D).

apaga(A, [A|B], B).
apaga(A, [B|C], [B|D]) :- apaga(A, C, D).

maximo(X, [X]).
maximo(A, [A|B]) :- maximo(C, B), A > C.
maximo(C, [A|B]) :- maximo(C, B), C >= A.

max1(X, [X]).
max1(M, [A|B]) :- max1(C, B), (A > C ->  M = A; M = C).

comp(0, []).
comp(N, [_|C]) :- comp(N1, C), N is N1 + 1.

enesimo(1,[A|_], A) :- !.
enesimo(N, [_|B], X) :- N > 1, N1 is N - 1, enesimo(N1, B, X), !.

total([], 0).
total([A|B], T) :- total(B, T1), T is T1 + A.
