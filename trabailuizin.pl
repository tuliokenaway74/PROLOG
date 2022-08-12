%---Quick-Sort---%

ap([],L,L).
ap([A|B],C,[A|D]) :- ap(B,C,D).

particao([X|L], Pivo, [X|Menores], Maiores) :-
	X >= Pivo, !, particao(L, Pivo, Menores, Maiores).
particao([X|L], Pivo, Menores,[X|Maiores]) :-
	X < Pivo, !, particao(L, Pivo, Menores, Maiores).
particao([],_,[],[]).

quickSort([A|B], S) :-
	particao(B,A,Me,Ma),
	quickSort(Me,MeOrd),
	quickSort(Ma,MaOrd),
	ap(MeOrd,[A|MaOrd], S).
quickSort([],[]).

%--------------------------------------------------------------------------------------------------%

%---Ordenação-Por-Troca---%

ordemTroca(L,S) :-
	ap(X,[A,B|C],L), B > A, !,
	ap(X,[B,A|C],Li),
	ordemTroca(Li,S).
ordemTroca(L,L).