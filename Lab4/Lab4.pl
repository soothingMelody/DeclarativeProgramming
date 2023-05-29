%Zadanie 1%
ostatni(Element, [Element]).
ostatni(Element, [_|T]) :- ostatni(Element,T).

%Zadanie 2%
przedostatni(Element, [Element,_]).
przedostatni(Element, [_|T]) :- przedostatni(Element, T).

%Zadanie 3%
bezostatniego([_], []).
bezostatniego([H|T], [H|T2]) :- bezostatniego(T, T2).

%Zadanie 4%
nakoniec(Element, [], [Element]).
nakoniec(Element, [H|T], [H|T2]) :- nakoniec(Element, T, T2).

%Zadanie 5%
zakazdym([], _, []).
zakazdym([H|T], X, [H,X|T2]) :- zakazdym(T, X, T2).

%Zadanie 6%
codrugi([], []).
codrugi([_], []).
codrugi([_,H2|T], [H2|T2]) :- codrugi(T, T2).

%Zadanie 7%
wstaw_za([X|T], X, Y, [X,Y|T]).
wstaw_za([H|T], X, Y, [H|T2]) :- wstaw_za(T, X, Y, T2).

%Zadanie 8%
lewoprawo(X, [X|T], [], T).
lewoprawo(X, [H|T], [H|LL], LP) :-
    dif(H,X),
    lewoprawo(X, T, LL, LP).

%Zadanie 9%
wymiana(_, _, [], []).
wymiana(X, Y, [X|T1], [Y|T2]) :-
    wymiana(X, Y, T1, T2).
wymiana(X, Y, [H|T1], [H|T2]) :-
    dif(H,X),
    wymiana(X, Y, T1, T2).


%Zadanie 10%
polacz([], []).
polacz([H|T], LP) :-
    polacz(T, TP),
    append(H, TP, LP).
