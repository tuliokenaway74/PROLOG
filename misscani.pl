%----EstadoInicial----------------------------------------------------------------------------------------%

estadoinicial(3,3,0). % 3 missionarios e 3 canibais na margem esquerda com o bote na margem esquerda %

%--------Meta---------------------------------------------------------------------------------------------%

meta(0,0,1). % 0 missionarios e 0 canibais na margem esquerda com o bote na margem direita

%-----Operações-------------------------------------------------------------------------------------------%

oper(leva1, [M1,C,0], [M2,C,1]) :- M2 is (M1-1), M1 > 0. 
oper(leva2, [M1,C,0], [M2,C,1]) :- M2 is (M1-2), M1 > 1.
oper(leva3, [M,C1,0], [M,C2,1]) :- C2 is (C1-1), C1 > 0.
oper(leva4, [M,C1,0], [M,C2,1]) :- C2 is (C1-2), C1 > 1.
oper(leva5, [M1,C1,0], [M2,C2,1]) :- M2 is (M1-1), C2 is (C1-1), M1 > 0, C1 > 0.

oper(volta1, [M1,C,1], [M2,C,0]) :- M2 is (M1+1), M1 < 3. 
oper(volta2, [M1,C,1], [M2,C,0]) :- M2 is (M1+2), M1 < 2.
oper(volta3, [M,C1,1], [M,C2,0]) :- C2 is (C1+1), C1 < 3.
oper(volta4, [M,C1,1], [M,C2,0]) :- C2 is (C1+2), C1 < 2.
oper(volta5, [M1,C1,1], [M2,C2,0]) :- M2 is (M1+1), C2 is (C1+1), M1 < 3, C1 < 3. 
