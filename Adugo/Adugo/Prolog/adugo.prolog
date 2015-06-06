
%------------------ Funkcja mo¿liwych ruchów ------------------%
move( Listawej, Listawyj ) :-
	findIdJaguar( Listawej, IdJaguar ),
	canTokenMove(Listawej, IdJaguar, Listawyj).

%------------------ Funkcje mo¿liwego ruchu w danych kierunkach z mo¿liwym biciem ------------------%
	%%%%%% Ujemne
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 6,
	IdJaguar3 is IdJaguar - 12,
	tokenMove(IdJaguar,1,_,_,_,_,_,_,_),
	tokenMove(IdJaguar2,1,_,_,_,_,_,_,_),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 6,
	tokenMove(IdJaguar,1,_,_,_,_,_,_,_),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 5,
	IdJaguar3 is IdJaguar - 10,
	tokenMove(IdJaguar,_,1,_,_,_,_,_,_),
	tokenMove(IdJaguar2,_,1,_,_,_,_,_,_),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 5,
	tokenMove(IdJaguar,_,1,_,_,_,_,_,_),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).
		
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 4,
	IdJaguar3 is IdJaguar - 8,
	tokenMove(IdJaguar,_,_,1,_,_,_,_,_),
	tokenMove(IdJaguar2,_,_,1,_,_,_,_,_),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 4,
	tokenMove(IdJaguar,_,_,1,_,_,_,_,_),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 1,
	IdJaguar3 is IdJaguar - 2,
	tokenMove(IdJaguar,_,_,_,1,_,_,_,_),
	tokenMove(IdJaguar2,_,_,_,1,_,_,_,_),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar - 1,
	tokenMove(IdJaguar,_,_,_,1,_,_,_,_),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).
	
%%%%%%%%% dodatnie
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 1,
	IdJaguar3 is IdJaguar + 2,
	tokenMove(IdJaguar,_,_,_,_,1,_,_,_),
	tokenMove(IdJaguar2,_,_,_,_,1,_,_,_),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 1,
	tokenMove(IdJaguar,_,_,_,_,1,_,_,_),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 4,
	IdJaguar3 is IdJaguar + 8,
	tokenMove(IdJaguar,_,_,_,_,_,1,_,_),
	tokenMove(IdJaguar2,_,_,_,_,_,1,_,_),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 4,
	tokenMove(IdJaguar,_,_,_,_,_,1,_,_),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 5,
	IdJaguar3 is IdJaguar + 10,
	tokenMove(IdJaguar,_,_,_,_,_,_,1,_),
	tokenMove(IdJaguar2,_,_,_,_,_,_,1,_),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 5,
	tokenMove(IdJaguar,_,_,_,_,_,_,1,_),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 6,
	IdJaguar3 is IdJaguar + 12,
	tokenMove(IdJaguar,_,_,_,_,_,_,_,1),
	tokenMove(IdJaguar2,_,_,_,_,_,_,_,1),
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, IdJaguar, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, IdJaguar, Listawyj):-
	IdJaguar2 is IdJaguar + 6,
	tokenMove(IdJaguar,_,_,_,_,_,_,_,1),
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, IdJaguar, -1, IdJaguar2, Listawyj).

%%%%%%%%% specjalne
canTokenMove(Listawej, 30, Listawyj):-
	IdJaguar2 is 32,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 30, -1, IdJaguar2, Listawyj).
canTokenMove(Listawej, 32, Listawyj):-
	IdJaguar2 is 34,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 32, -1, IdJaguar2, Listawyj).
canTokenMove(Listawej, 34, Listawyj):-
	IdJaguar2 is 32,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 34, -1, IdJaguar2, Listawyj).
canTokenMove(Listawej, 32, Listawyj):-
	IdJaguar2 is 30,
	isEmpty( IdJaguar2, Listawej ),
	replace(Listawej, 32, -1, IdJaguar2, Listawyj).

canTokenMove(Listawej, 30, Listawyj):-
	IdJaguar2 is 32,
	IdJaguar3 is 34,
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, 30, IdJaguar2, IdJaguar3, Listawyj).
canTokenMove(Listawej, 34, Listawyj):-
	IdJaguar2 is 32,
	IdJaguar3 is 30,
	isEmpty( IdJaguar3, Listawej ),
	nth0(IdJaguar2, Listawej, 1),
	replace(Listawej, 34, IdJaguar2, IdJaguar3, Listawyj).




%------------------ Ograniczenia planszy ------------------%
%%%%%%%%%%% 1 2 3 4 5 6 7 8
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

%%%%%%%%%%%# 1 2 3 4 5 6 7 8
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

isEmpty( Id, Lista):-  % sprawdza czy mo¿na wykonaæ ruch, zwraca prawdê jeœli pole jest puste
	nth0(Id, Lista,0).
findIdJaguar( Lista, Id ):- % zwraca aktualne id jaguara w liœcie
	nth0(Id, Lista, 2),
	!.
add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-
	add_tail(T,X,L).
	

replace(List, Id1, Id2, Id3, Exit):-
	replace(List, Id1, Id2, Id3, 0, [], Exit).
	
replace([], _, _, _, _, Exit, Exit):-
	!.
replace([H|T], Pos, Id2, Id3, Pos, Listawyj,V):-
	add_tail(Listawyj, 0, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Pos, Id2, Id3, Pos1, Listawyj1,V),!.
replace([H|T], Id1, Pos, Id3, Pos, Listawyj,V):-
	add_tail(Listawyj, 0, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Pos, Id3, Pos1, Listawyj1,V),!.
replace([H|T], Id1, Id2, Pos, Pos, Listawyj,V):-
	add_tail(Listawyj, 2, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Id2, Pos, Pos1, Listawyj1,V),!.
replace([H|T], Id1, Id2, Id3, Pos, Listawyj,V):-
	add_tail(Listawyj, H, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Id2, Id3, Pos1, Listawyj1,V),!.		


minimax(Pos, BestNextPos, Val) :-                     % Pos ma nastepce
    bagof(NextPos, move(Pos, NextPos), NextPosList),
    best(NextPosList, BestNextPos, Val), !.

minimax(Pos, _, Val) :-                     % Pos nie ma nastepcow
    utility(Pos, Val).

best([Pos], Pos, Val) :-                                % Nie ma juz wiecej pozycji do porownania
    minimax(Pos, _, Val), !.

best([Pos1 | PosList], BestPos, BestVal) :-             % Istnieja pozycje do porownania
    minimax(Pos1, _, Val1),
    best(PosList, Pos2, Val2),
    betterOf(Pos1, Val1, Pos2, Val2, BestPos, BestVal).
	
betterOf(Pos0, Val0, _, Val1, Pos0, Val0) :-   % Pos0 lepsza Pos1
    min_to_move(Pos0),                         % MIN ma zmienic pozycje na Pos0
    Val0 > Val1, !.                            % MAX preferuje wieksza wartosc

betterOf(Pos0, Val0, _, Val1, Pos0, Val0) :-   % Pos0 lepsza Pos1
    max_to_move(Pos0),                         % MAX ma zmienic pozycje na Pos0
    Val0 < Val1, !.                            % MIN preferuje mniejsza wartosc

betterOf(_, _, Pos1, Val1, Pos1, Val1).        % OW innym przypadku Pos1 lepsza od Pos0

%nalezy zaimplementowac nastepujace metody

%move(+Pos, -NextPos) : mowi o tym ze NextPos jest legalnym ruchem od Pos
%utility(+Pos, -Val) : mowi o tym, ze Pos jest rowna wartosci Val
%min_to_move(+Pos) : mowi o tym ze obecny gracz(w kontekscie minmax) na Pos jest mins
%max_to_move(+Pos) : mowi ze obecny gracz(w kontekscie minmax) na Pos jest max