%Zadanie #1.%
poziomy(odcinek(punkt(X1,Y),punkt(X2,Y))).
pionowy(odcinek(punkt(X,Y1),punkt(X,Y2))).

%Zadanie #2.%
regularny(prostokąt(punkt(X1,Y1), punkt(X2,Y1), punkt(X2,Y2), punkt(X1,Y2))).

%Zadanie #3.%

state(west,west,west,west).
state(east,east,east,east).

move(state(west,west,G,C),farmer_wolf_east,state(east,east,G,C)) :- safe(state(east,east,G,C)).
move(state(west,W,G,west),farmer_cabbage_east,state(east,W,G,east)) :- safe(state(east,W,G,east)).
move(state(west,W,west,C),farmer_goat_east,state(east,W,east,C)) :- safe(state(east,W,east,C)).
move(state(west,W,G,C),farmer_east_alone,state(east,W,G,C)) :- safe(state(east,W,G,C)).
move(state(east,W,G,C),farmer_west_alone,state(west,W,G,C)) :- safe(state(west,W,G,C)).
move(state(east,W,G,east),farmer_cabbage_west,state(west,W,G,west)) :- safe(state(west,W,G,west)).
move(state(east,W,east,C),farmer_goat_west,state(west,W,west,C)) :- safe(state(west,W,west,C)).
move(state(east,east,G,C),farmer_wolf_west,state(west,west,G,C)) :- safe(state(west,west,G,C)).

safe(state(F, W, G, C)) :- F = G .
safe(state(F, W, G, C)) :- G \= W, G \= F, G \= C.

can_get(state(east, east, east, east)).

can_get(StateBefore) :-
    move(StateBefore, _, StateAfter),
    can_get(StateAfter).