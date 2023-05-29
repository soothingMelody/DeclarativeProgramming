next(świnoujście,kołobrzeg).
next(świnoujście, szczecin).
next(kołobrzeg,ustka).
next(ustka, gdańsk).
next(gdańsk,toruń).
next(gdańsk,olsztyn).
next(olsztyn,toruń).
next(olsztyn,białystok).
next(szczecin,bydgoszcz).
next(szczecin, gorzów-wlkp).
next(bydgoszcz,toruń).
next(bydgoszcz,poznań).
next(poznań,toruń).
next(gorzów-wlkp,poznań).
next(gorzów-wlkp,zielona-góra).
next(zielona-góra,poznań).
next(zielona-góra,wrocław).
next(toruń,łódź).
next(toruń,warszawa).
next(białystok, warszawa).
next(białystok,lublin).
next(poznań,łódź).
next(warszawa,radom).
next(warszawa,łódź).
next(radom,lublin).
next(radom,kielce).
next(wrocław,łódź).
next(łódź,radom).
next(łódź,częstochowa).
next(częstochowa,kielce).
next(częstochowa,katowice).
next(katowice,kraków).
next(kielce,kraków).
next(kielce,rzeszów).
next(lublin,kielce).
next(lublin,rzeszów).
next(kraków,rzeszów).

%Zadanie 1.%	

połączenie(A,B) :- next(A,B).
połączenie(A,B) :- next(A,X), połączenie(X,B).

%Zadanie 2.%

zjazd(X, Y, Z) :- next(X, Y), Z = X.
zjazd(X, Y, Z) :- next(X, W), zjazd(W, Y, Z).

%Zadanie 3.%

trasa(X,Y,Z) :- next(X,Y), Z = obok(X,Y).
trasa(X,Y,Z) :- next(X,W), trasa(W,Y,Z1), Z = obok(X,Z1).

%Zadanie 4.%
trasa2(X, Y, obok(X, Y)) :- next(X, Y).
trasa2(X, Y, obok(V, Y)) :- next(Z, Y), trasa2(X, Z, V).

%Zadanie 5.%
trasa3(X, Y, [X,Y]) :- next(X,Y).
trasa3(X, Y, [X|P]) :- next(X,Z), trasa3(Z,Y,P). 
