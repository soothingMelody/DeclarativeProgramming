
%Zadanie 1.%
najwiekszy([X],X).
najwiekszy([X|Xs], M) :- najwiekszy(Xs, M1), X =< M1, M is M1.
najwiekszy([X|Xs], M) :- najwiekszy(Xs, M1), X > M1, M is X.

%Zadanie 2.%
liniowa([_,_|[]]).
liniowa([A,B,C|L]) :- A - B =:= B - C, liniowa([B,C|L]).

%Zadanie 3.%
rozbij([],[],[]).
rozbij(L1, [Len|L2], [P|T]) :-
    Len > 0,
    length(P, Len),
    append(P, R, L1),
    rozbij(R, L2, T).

%Zadanie 4.%
przynaleznosc([],_,[],[]).
przynaleznosc([H|T], [L,P], [H|LW], LZ)  :- 
    H >= L, H =< P, 
    przynaleznosc(T, [L,P], LW, LZ).
przynaleznosc([H|T], [L,P], LW, [H|LZ]) :- 
    H < L,
    przynaleznosc(T, [L,P], LW, LZ).
przynaleznosc([H|T], [L,P], LW, [H|LZ]) :-
    H > P,
    przynaleznosc(T, [L,P], LW, LZ).

%Zadanie 5.%
decnabin(0,[0]).
decnabin(1,[1]).
decnabin(N,B) :-
    N > 1,
    N1 is N div 2,
    decnabin(N1, B1),
    Res is N mod 2,
    append(B1, [Res], B).

%Zadanie 6.%
szybkisort([], []).
szybkisort([X|Xs], S) :-
    rozdziel(X, Xs, Mniejsze, Wieksze),
    szybkisort(Mniejsze, M),
    szybkisort(Wieksze, W),
    append(M, [X|W], S).

rozdziel(_, [], [], []).
rozdziel(X, [Y|Ys], [Y|M], W) :-
    Y =< X,
    rozdziel(X, Ys, M, W).
rozdziel(X, [Y|Ys], M, [Y|W]) :-
    Y > X,
    rozdziel(X, Ys, M, W).

%Zadanie 7.%
wstawsort([], []).
wstawsort([X|Xs], S) :-
    wstawsort(Xs, Sorted),
    doposort(Sorted, X, S).

doposort([], X, [X]).
doposort([Y|Ys], X, [X,Y|Ys]) :-
    X =< Y.
doposort([Y|Ys], X, [Y|Zs]) :-
    X > Y,
    doposort(Ys, X, Zs).

%Zadanie 8.%
unikalne([], []).
unikalne([X|Xs], K) :-
    member(X, Xs), !,
    unikalne(Xs, K).
unikalne([X|Xs], [X|K]) :-
    unikalne(Xs, K).

%Zadanie 9.%
najblizszy(X, [L], L).
najblizszy(X, [L1, L2 | T], M) :-
    Distance1 is abs(L1 - X),
    Distance2 is abs(L2 - X),
    Distance1 =< Distance2,
    najblizszy(X, [L1 | T], M).

najblizszy(X, [L1, L2 | T], M) :-
    Distance1 is abs(L1 - X),
    Distance2 is abs(L2 - X),
    Distance1 > Distance2,
    najblizszy(X, [L2 | T], M).

%Zadanie 10.%
ciagliczb(N,N,[N]).
ciagliczb(M,N,[M|T]) :- M < N, M1 is M + 1, ciagliczb(M1, N, T).

odsiewaj(_, [], []).
odsiewaj(X, [H|T], [H|T2]) :- mod(H,X) =\= 0, odsiewaj(X,T,T2).
odsiewaj(X, [_|T], T2) :- odsiewaj(X,T,T2).

sito([], []).
sito([H|T], [H|T2]) :- odsiewaj(H, T, R), sito(R, T2).

eratostenes(N, L) :- ciagliczb(2, N, Lista), sito(Lista, L).