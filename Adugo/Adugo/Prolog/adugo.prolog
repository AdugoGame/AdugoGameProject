start(Listawej,[H|Ruch1]):-
	begin(Listawej,[H1|Ruch1],[H|Fin]),
	not(wiecejZbitych(Listawej,Listawyj,H)),!.

wiecejZbitych(Listawej,Listawyj,H):-
	begin(Listawej,[H2|Ruch2],[Hb|Finb]),
	Hb > H.
	

begin(Listawej, Listawyj1, Listawyj):-
	move([0|Listawej],Listawyj1),
	allDogs(Listawyj1,Listawyj2),
	move(Listawyj2,Listawyj3),
	allDogs(Listawyj3,Listawyj4),
	move(Listawyj4,Listawyj).

	

move( [H|Listawej], Listawyj ) :-
	findIdJaguar(Listawej, IdJaguar ),
	canTokenMove([H|Listawej], IdJaguar, Listawyj).



canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar - 6,
	IdJaguar3 is IdJaguar - 12,
	tokenMove(IdJaguar,1,A,B,C,D,E,F,G),
	tokenMove(IdJaguar2,1,A1,B1,C1,D1,E1,F1,G1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar - 6,
	tokenMove(IdJaguar,1,A,B,C,D,E,F,G),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar - 5,
	IdJaguar3 is IdJaguar - 10,
	tokenMove(IdJaguar,A,1,B,C,D,E,F,G),
	tokenMove(IdJaguar2,A1,1,B1,C1,D1,E1,F1,G1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar - 5,
	tokenMove(IdJaguar,A,1,B,C,D,E,F,G),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).
		
canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar - 4,
	IdJaguar3 is IdJaguar - 8,
	tokenMove(IdJaguar,A,B,1,C,D,E,F,G),
	tokenMove(IdJaguar2,A1,B1,1,C1,D1,E1,F1,G1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar - 4,
	tokenMove(IdJaguar,A,B,1,C,D,E,F,G),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar - 1,
	IdJaguar3 is IdJaguar - 2,
	tokenMove(IdJaguar,A,B,C,1,D,E,F,G),
	tokenMove(IdJaguar2,A1,B1,C1,1,D1,E1,F1,G1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar - 1,
	tokenMove(IdJaguar,A,B,C,1,D,E,F,G),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).
	

	
	
canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar + 1,
	IdJaguar3 is IdJaguar + 2,
	tokenMove(IdJaguar,A,B,C,D,1,E,F,G),
	tokenMove(IdJaguar2,A1,B1,C1,D1,1,E1,F1,G1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar + 1,
	tokenMove(IdJaguar,A,B,C,D,1,E,F,G),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar + 4,
	IdJaguar3 is IdJaguar + 8,
	tokenMove(IdJaguar,A,B,C,D,E,1,F,G),
	tokenMove(IdJaguar2,A1,B1,C1,D1,E1,1,F1,G1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar + 4,
	tokenMove(IdJaguar,A,B,C,D,E,1,F,G),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar + 5,
	IdJaguar3 is IdJaguar + 10,
	tokenMove(IdJaguar,A,B,C,D,E,F,1,G),
	tokenMove(IdJaguar2,A1,B1,C1,D1,E1,F1,1,G1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar + 5,
	tokenMove(IdJaguar,A,B,C,D,E,F,1,G),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove([H|Listawej], IdJaguar, [H1|Listawyj]):-
	IdJaguar2 is IdJaguar + 6,
	IdJaguar3 is IdJaguar + 12,
	tokenMove(IdJaguar,A,B,C,D,E,F,G,1),
	tokenMove(IdJaguar2,A1,B1,C1,D1,E1,F1,G1,1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], IdJaguar, [H|Listawyj]):-
	IdJaguar2 is IdJaguar + 6,
	tokenMove(IdJaguar,A,B,C,D,E,F,G,1),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).


canTokenMove([H|Listawej], 30, [H|Listawyj]):-
	IdJaguar2 is 32,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 30, -1, IdJaguar2, Listawyj).
canTokenMove([H|Listawej], 32, [H|Listawyj]):-
	IdJaguar2 is 34,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 32, -1, IdJaguar2, Listawyj).
canTokenMove([H|Listawej], 34, [H|Listawyj]):-
	IdJaguar2 is 32,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 34, -1, IdJaguar2, Listawyj).
canTokenMove([H|Listawej], 32, [H|Listawyj]):-
	IdJaguar2 is 30,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 32, -1, IdJaguar2, Listawyj).

canTokenMove([H|Listawej], 30, [H1|Listawyj]):-
	IdJaguar2 is 32,
	IdJaguar3 is 34,
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, 30, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove([H|Listawej], 34, [H1|Listawyj]):-
	IdJaguar2 is 32,
	IdJaguar3 is 30,
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	H1 is H +1,
	replace(Listawej, 34, IdJaguar2, IdJaguar3, Listawyj).






tokenMove(0,0,0,0,0,1,0,1,1).
tokenMove(1,0,0,0,1,1,0,1,0).
tokenMove(2,0,0,0,1,1,1,1,1).
tokenMove(3,0,0,0,1,1,0,1,0).
tokenMove(4,0,0,0,1,0,1,1,0).

tokenMove(5,0,1,0,0,1,0,1,0).
tokenMove(6,1,1,1,1,1,1,1,1).
tokenMove(7,0,1,0,1,1,0,1,0).
tokenMove(8,1,1,1,1,1,1,1,1).
tokenMove(9,0,1,0,1,0,0,1,0).

tokenMove(10,0,1,1,0,1,0,1,1).
tokenMove(11,0,1,0,1,1,0,1,0).
tokenMove(12,1,1,1,1,1,1,1,1).
tokenMove(13,0,1,0,1,1,0,1,0).
tokenMove(14,1,1,0,1,0,1,1,0).

tokenMove(15,0,1,0,0,1,0,1,0).
tokenMove(16,1,1,1,1,1,1,1,1).
tokenMove(17,0,1,0,1,1,0,1,0).
tokenMove(18,1,1,1,1,1,1,1,1).
tokenMove(19,0,1,0,1,0,0,1,0).

tokenMove(20,0,1,1,0,1,0,0,0).
tokenMove(21,0,1,0,1,1,0,0,0).
tokenMove(22,1,1,1,1,1,1,1,1).
tokenMove(23,0,1,0,1,1,0,0,0).
tokenMove(24,1,1,0,1,0,0,0,0).

tokenMove(25,0,0,0,0,0,0,0,0).
tokenMove(26,0,0,1,0,1,1,0,1).
tokenMove(27,0,1,0,1,1,0,1,0).
tokenMove(28,1,0,0,1,0,1,0,1).
tokenMove(29,0,0,0,0,0,0,0,0).

tokenMove(30,0,0,1,0,0,0,0,0).
tokenMove(31,0,0,0,0,0,0,0,0).
tokenMove(32,0,1,0,0,0,0,0,0).
tokenMove(33,0,0,0,0,0,0,0,0).
tokenMove(34,1,0,0,0,0,0,0,0).

isEmpty( Id, Lista):-  
	nth0(Id, Lista,0).
findIdJaguar( Lista, Id ):-
	nth0(Id, Lista, 2),
	!.
addTail([],X,[X]).
addTail([H|T],X,[H|L]):-
	addTail(T,X,L).
	

replace(List, Id1, Id2, Id3, Exit):-
	replace(List, Id1, Id2, Id3, 0, [], Exit).
	
replace([], A, B, C, D, Exit, Exit):-
	!.
replace([H|T], Pos, Id2, Id3, Pos, Listawyj,V):-
	addTail(Listawyj, 0, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Pos, Id2, Id3, Pos1, Listawyj1,V),!.
replace([H|T], Id1, Pos, Id3, Pos, Listawyj,V):-
	addTail(Listawyj, 0, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Pos, Id3, Pos1, Listawyj1,V),!.
replace([H|T], Id1, Id2, Pos, Pos, Listawyj,V):-
	addTail(Listawyj, 2, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Id2, Pos, Pos1, Listawyj1,V),!.
replace([H|T], Id1, Id2, Id3, Pos, Listawyj,V):-
	addTail(Listawyj, H, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Id2, Id3, Pos1, Listawyj1,V),!.		

allDogs([H|Listawej],[H|Listawyj]):-
	dogMove(Listawej,Listawyj).

dogMove(Listawej,Listawyj):-
	singleDog(Listawej,0,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,1,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,2,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,3,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,4,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,5,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,6,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,7,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,8,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,9,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,10,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,11,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,12,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,13,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,14,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,15,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,16,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,17,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,18,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,19,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,20,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,21,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,22,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,23,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,24,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,25,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,26,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,27,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,28,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,29,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,30,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,32,Listawyj).
dogMove(Listawej,Listawyj):-
	singleDog(Listawej,34,Listawyj).




singleDog(Listawej,Iter,Listawyj):-
	nth0(Iter, Listawej, 1),
	moveDog(Listawej,Iter,Listawyj).
	
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies - 6,
	tokenMove(IdPies,1,A,B,C,D,E,F,G),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies - 5,
	tokenMove(IdPies,A,1,B,C,D,E,F,G),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies - 4,
	tokenMove(IdPies,A,B,1,C,D,E,F,G),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies - 1,
	tokenMove(IdPies,A,B,C,1,D,E,F,G),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies + 1,
	tokenMove(IdPies,A,B,C,D,1,E,F,G),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies + 4,
	tokenMove(IdPies,A,B,C,D,E,1,F,G),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies + 5,
	tokenMove(IdPies,A,B,C,D,E,F,1,G),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).
moveDog(Listawej, IdPies, Listawyj):-
	IdPies2 is IdPies + 6,
	tokenMove(IdPies,A,B,C,D,E,F,G,1),
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, IdPies, IdPies2, Listawyj).

moveDog(Listawej, 30, Listawyj):-
	IdPies2 is 32,
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, 30, IdPies2, Listawyj).
moveDog(Listawej, 32, Listawyj):-
	IdPies2 is 34,
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, 32, IdPies2, Listawyj).
moveDog(Listawej, 34, Listawyj):-
	IdPies2 is 32,
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, 34, IdPies2, Listawyj).
moveDog(Listawej, 32, Listawyj):-
	IdPies2 is 30,
	isEmpty( IdPies2, Listawej ),
	replacePies(Listawej, 32, IdPies2, Listawyj).	
	
	
	
	
replacePies(List, Id1, Id2, Exit):-
	replacePies(List, Id1, Id2, 0, [], Exit).
	
replacePies([], A, B, C, Exit, Exit):-
	!.
replacePies([H|T], Pos, Id2, Pos, Listawyj,V):-
	addTail(Listawyj, 0, Listawyj1),
	Pos1 is Pos +1,
	replacePies(T, Pos, Id2, Pos1, Listawyj1,V),!.
replacePies([H|T], Id1, Pos, Pos, Listawyj,V):-
	addTail(Listawyj, 1, Listawyj1),
	Pos1 is Pos +1,
	replacePies(T, Id1, Pos, Pos1, Listawyj1,V),!.
replacePies([H|T], Id1, Id2, Pos, Listawyj,V):-
	addTail(Listawyj, H, Listawyj1),
	Pos1 is Pos +1,
	replacePies(T, Id1, Id2, Pos1, Listawyj1,V),!.	
