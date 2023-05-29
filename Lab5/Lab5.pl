
%Zadanie 1%---
klonuj([], []).
klonuj([X|L], [[X,X]|L1]) :-
  klonuj(L, L1).
  
%Zadanie 2%---
srodek([X], X).
srodek([_|T], S) :-
    append(A, [_], T),
    srodek(A,S).

%Zadanie 3%---
polowki([],[],[]).
polowki([H|T],[H|TT],P):-append(A,[B],T),
    polowki(A,TT,C),
    append(C,[B],P).

%Zadanie 4%---
sumuj([], 0).
sumuj([X|L], S) :-
  sumuj(L, S1),
  S is S1 + X.

%Zadanie 5%---
ile_wiekszych([], _, 0).
ile_wiekszych([X|L], Y, N) :-
  X > Y,
  ile_wiekszych(L, Y, N1),
  N is N1 + 1.
ile_wiekszych([X|L], Y, N) :-
  X =< Y,
  ile_wiekszych(L, Y, N).

%Zadanie 6%---
plus_minus([], 0).
plus_minus([+|L], N) :-
  plus_minus(L, N1),
  N is N1 + 1.
plus_minus([-|L], N) :-
  plus_minus(L, N1),
  N is N1 - 1.
  
%Zadanie 7%---
wstawiaj([], X, 1, [X]).
wstawiaj([H|T], X, 1, [X,H|T]).
wstawiaj([H|L], X, I, [H|L1]) :-
  I > 1,
  I1 is I - 1,
  wstawiaj(L, X, I1, L1).
  
%Zadanie 8%---
usuwaj([H], 1, []).
usuwaj([H|T],1,T).
usuwaj([H|T], X, L) :- usuwaj(T, Y, L), X is Y+1.

%Zadanie 9%
rozdziel([],X,[],[]).
rozdziel([H|T],X,[H|T1],L2) :- H < X, rozdziel(T,X,T1,L2).
rozdziel([H|T],X,L1, [H|T2]) :- H >= X, rozdziel(T,X,L1,T2).
  
%Zadanie 10%--
powiel([], [], []).
powiel([X|L1], [N|L2], L) :-
  powiel1(X, N, L3),
  powiel(L1, L2, L4),
  append(L3, L4, L).

powiel1(_, 0, []).
powiel1(X, N, [X|L]) :-
  N > 0,
  N1 is N - 1,
  powiel1(X, N1, L).