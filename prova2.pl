%--------------------------------------------------------------------------------------------------%

% produto(nome, codigo)
produto(prego, 12).
produto(lixa, 20).
produto(cola, 25).
produto(papel, 15).
% preco(codigo, valor)
preco(10, 1).
preco(12, 2).
preco(15, 3).
preco(20, 4).
preco(22, 5).
preco(25, 6).
preco(30, 7).

consulta(L) :- findall(Nome-Valor,(produto(Nome,Codigo),preco(Codigo,Valor)),L).

%--------------------------------------------------------------------------------------------------%

criaLista(1,A,[A]) :- !.
criaLista(X,Y,[Y|Z]) :- N is (X-1), criaLista(N,Y,Z).

%--------------------------------------------------------------------------------------------------%

ehPar(X) :- (0 is mod(X,2)).

%apagaPar([A],[]) :- ehPar(A).
%apagaPar([A|B],B) :- ehPar(A).
%apagaPar([A|B],[A|C]) :- apagaPar(B,C).


ehImpar(X) :- (1 is mod(X,2)).

apagaPar(L,S) :- findall(X,(member(X,L),ehImpar(X)),S).

%--------------------------------------------------------------------------------------------------%

selecaoparcial(_,[],0) :- !.
selecaoparcial(L,[M|S],X) :-
N is (X-1), removeMin(M,L,Lo), selecaoparcial(Lo,S,N), !.
selecaoparcial([],[],_).


selecao(L,[M|S]) :-
removeMin(M,L,Lo), selecao(Lo,S), !.
selecao([],[]).

min([X|Y],X) :- min(Y,M1), X < M1, !.
min([_|Y],M) :- min(Y,M), !.
min([X],X) :- !.

removeMin(M,L,Lo) :- min(L,M), select(M,L,Lo).

%--------------------------------------------------------------------------------------------------%

inicial([8,0,0]).
meta([4,4,_]).

oper(t1p2, [X,Y,Z],[0,Y1,Z]) :- X > 0, Y < 5, Y1 is X + Y, Y1 =< 5.
oper(t1p2, [X,Y,Z],[X1,5,Z]) :- X > 0, Y < 5, X1 is X + Y - 5, X + Y > 5.
oper(t2p1, [X,Y,Z],[X1,0,Z]) :- Y > 0, X < 8, X1 is X + Y, X1 =< 8.
oper(t2p1, [X,Y,Z],[8,Y1,Z]) :- Y > 0, X < 8, Y1 is X + Y - 8, X + Y > 8.
oper(t1p3, [X,Y,Z],[0,Y,Z1]) :- X > 0, Z < 3, Z1 is X + Z, Z1 =< 3.
oper(t1p3, [X,Y,Z],[X1,Y,3]) :- X > 0, Z < 3, X1 is X + Z - 3, X + Z > 3.
oper(t3p1, [X,Y,Z],[X1,Y,0]) :- Z > 0, X < 8, X1 is X + Z, X1 =< 8.
oper(t3p1, [X,Y,Z],[8,Y,Z1]) :- Z > 0, X < 8, Z1 is X + Z - 8, X + Z > 8.
oper(t2p3, [X,Y,Z],[X,0,Z1]) :- Y > 0, Z < 3, Z1 is Y + Z, Z1 =< 3.
oper(t2p3, [X,Y,Z],[X,Y1,3]) :- Y > 0, Z < 3, Y1 is Z + Y - 3, Z + Y > 3.
oper(t3p2, [X,Y,Z],[X,Y1,0]) :- Z > 0, Y < 5, Y1 is Y + Z, Y1 =< 5.
oper(t3p2, [X,Y,Z],[X,5,Z1]) :- Z > 0, Y < 5, Z1 is Z + Y - 5, Z + Y > 5.

%--------------------------------------------------------------------------------------------------%
