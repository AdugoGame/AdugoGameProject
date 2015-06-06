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


indexOf([Element|_], Element, 0). % We found the element
indexOf([_|Tail], Element, Index):-
  indexOf(Tail, Element, Index1), % Check in the tail of the list
  Index is Index1+1.  % and increment the resulting index


  % A AA AAA AAAA AAAAA
  % B BB BBB BBBB BBBBB
  % C CC CCC CCCC CCCCC
  % D DD DDD DDDD DDDDD
  % E EE EEE EEEE EEEEE
  %   GG GGG GGGG
  % H HH HHH HHHH HHHHH

  
  isEmpty( Id, Lista, Exit ):-  % sprawdza czy mo¿na wykonaæ ruch, zwraca prawdê jeœli pole jest puste
	nth0(Id, Lista, 0),
	Exit is 1.
  isEmpty( Id, Lista, Exit ):-  % sprawdza czy mo¿na wykonaæ ruch, zwraca prawdê jeœli pole jest puste
	not(nth0(Id, Lista, 0),),
	Exit is 0.
  findIdJaguar( Id, Lista ):- % zwraca aktualne id jaguara w liœcie
    nth0(Id, Lista, 2).

 

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-
	add_tail(T,X,L).
	
replace(List, Id1, Id2, Id3, Exit):-
	replace(List, Id1, Id2, Id3, 0, [], Exit).
	
replace([], _, _, _, _, Exit, Exit).
replace([H|T], Pos, Id2, Id3, Pos, Listawyj,V):-
	add_tail(Listawyj, 0, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Pos, Id2, Id3, Pos1, Listawyj1,V).
replace([H|T], Id1, Pos, Id3, Pos, Listawyj,V):-
	add_tail(Listawyj, 0, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Pos, Id3, Pos1, Listawyj1,V).
replace([H|T], Id1, Id2, Pos, Pos, Listawyj,V):-
	add_tail(Listawyj, 2, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Id2, Pos, Pos1, Listawyj1,V).
replace([H|T], Id1, Id2, Id3, Pos, Listawyj,V):-
	add_tail(Listawyj, H, Listawyj1),
	Pos1 is Pos +1,
	replace(T, Id1, Id2, Id3, Pos1, Listawyj1,V).		




%replace([], _, _, _, _, Listawyj).
%	replace([H|T], Id1, Id2, Id3, Pos, Listawyj):-
%		Pos=Id1 ->
%		(
%			
%			append(Listawyj, [0], Lista),
%			append(Lista,[],Listawyj),
%			Pos1 is Pos +1,
%			replace(T, Id1, Id2, Id3, Pos1, Lista)
%		)
%		;
%		(
%			Pos=Id2 ->(
%						append(Listawyj, [0], Lista),
%						append(Lista,[],Listawyj),
%						Pos1 is Pos +1,
%						replace(T, Id1, Id2, Id3, Pos1, Lista)
%						);
%						(
%							Pos=Id3 -> (
%										 append(Listawyj, [2], Lista),
%										 append(Lista,[],Listawyj),
%										Pos1 is Pos +1,
%										replace(T, Id1, Id2, Id3, Pos1, Lista)
%									);
%
%									(
%										append(Listawyj, H, Lista),
%										append(Lista,[],Listawyj),
%										Pos1 is Pos +1,
%										replace(T, Id1, Id2, Id3, Pos1, Lista)
%									)
%						)
%		).


 move( [Listawej], [Listawyj] ) :-
	findIdJaguar( IdJaguar, Listawej ),
	canTokenMove(Listawej, IdJaguar, Listawyj).
	
	%%%%%% Ujemne
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,1,_,_,_,_,_,_,_),
		tokenMove(IdJagar-6,1,_,_,_,_,_,_,_),
		isEmpty( IdJaguar-12, Listawej, 1 ),
		isEmpty( IdJaguar-6, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar-6, IdJaguar-12, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,1,_,_,_,_,_,_,_),
		isEmpty( IdJaguar-6, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar-6, Listawyj).

	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,1,_,_,_,_,_,_),
		tokenMove(IdJagar-5,_,1,_,_,_,_,_,_),
		isEmpty( IdJaguar-10, Listawej, 1 ),
		isEmpty( IdJaguar-5, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar-5, IdJaguar-10, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,1,_,_,_,_,_,_),
		isEmpty( IdJaguar-5, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar-5, Listawyj).
		
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,1,_,_,_,_,_),
		tokenMove(IdJagar-4,_,_,1,_,_,_,_,_),
		isEmpty( IdJaguar-8, Listawej, 1 ),
		isEmpty( IdJaguar-4, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar-4, IdJaguar-8, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,1,_,_,_,_,_),
		isEmpty( IdJaguar-4, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar-4, Listawyj).

	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,1,_,_,_,_),
		tokenMove(IdJagar-1,_,_,_,1,_,_,_,_),
		isEmpty( IdJaguar-2, Listawej, 1 ),
		isEmpty( IdJaguar-1, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar-1, IdJaguar-2, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,1,_,_,_,_),
		isEmpty( IdJaguar-1, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar-1, Listawyj).
	
	%%%%%%%%% dodatnie
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,1,_,_,_),
		tokenMove(IdJagar+1,_,_,_,_,1,_,_,_),
		isEmpty( IdJaguar+2, Listawej, 1 ),
		isEmpty( IdJaguar+1, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar+1, IdJaguar+2, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,1,_,_,_),
		isEmpty( IdJaguar+1, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar+1, Listawyj).

	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,_,1,_,_),
		tokenMove(IdJagar+4,_,_,_,_,_,1,_,_),
		isEmpty( IdJaguar+8, Listawej, 1 ),
		isEmpty( IdJaguar+4, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar+4, IdJaguar+8, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,_,1,_,_),
		isEmpty( IdJaguar+4, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar+4, Listawyj).

	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,_,_,1,_),
		tokenMove(IdJagar+5,_,_,_,_,_,_,1,_),
		isEmpty( IdJaguar+10, Listawej, 1 ),
		isEmpty( IdJaguar+5, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar+5, IdJaguar+10, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,_,_,1,_),
		isEmpty( IdJaguar+5, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar+5, Listawyj).

	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,_,_,_,1),
		tokenMove(IdJagar+6,_,_,_,_,_,_,_,1),
		isEmpty( IdJaguar+12, Listawej, 1 ),
		isEmpty( IdJaguar+6, Listawej, 0 ),
		replace(Listawej, IdJaguar, IdJaguar+6, IdJaguar+12, Listawyj).
	canTokenMove(Listawej, IdJaguar, Listawyj):-
		tokenMove(IdJaguar,_,_,_,_,_,_,_,1),
		isEmpty( IdJaguar+6, Listawej, 1 ),
		replace(Listawej, IdJaguar, -1, IdJaguar+6, Listawyj).
