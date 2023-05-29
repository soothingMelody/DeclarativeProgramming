%Krok1%
kobieta(maria).
kobieta(ewa).
kobieta(agata).
kobieta(anna).
kobieta(joanna).
kobieta(agnieszka).
kobieta(beata).
kobieta(iwona).

mężczyzna(piotr).
mężczyzna(adam).
mężczyzna(marek).
mężczyzna(robert).
mężczyzna(jan).
mężczyzna(krzysztof).
mężczyzna(radek).
mężczyzna(darek).
mężczyzna(tomek).
mężczyzna(jacek).

rodzic(maria,marek).
rodzic(maria,agata).
rodzic(maria,jan).
rodzic(piotr,marek).
rodzic(piotr,agata).
rodzic(piotr,jan).
rodzic(robert,radek).
rodzic(robert,beata).
rodzic(agata,radek).
rodzic(agata,beata).
rodzic(jan,darek).
rodzic(jan,tomek).
rodzic(anna,darek).
rodzic(anna,tomek).
rodzic(adam,anna).
rodzic(adam,joanna).
rodzic(adam,krzysztof).
rodzic(ewa,anna).
rodzic(ewa,joanna).
rodzic(ewa,krzysztof).
rodzic(krzysztof,jacek).
rodzic(krzysztof,iwona).
rodzic(agnieszka,jacek).
rodzic(agnieszka,iwona).

%Krok2%
matka(X,Y) :-kobieta(X), rodzic(X,Y).
ojciec(X,Y) :-mężczyzna(X), rodzic(X,Y).
brat(X,Y) :-mężczyzna(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
siostra(X,Y) :-kobieta(X), rodzic(Z,Y), rodzic(Z,X), X\=Y.
babcia(X,Z) :-kobieta(X), rodzic(Y,Z), rodzic(X,Y).
dziadek(X,Z) :-mężczyzna(X), rodzic(Y,Z), rodzic(X,Y).
wuj(X,Z) :- rodzic(Y,Z), kobieta(Y), brat(X,Y).
stryj(X,Z) :-rodzic(Y,Z), mężczyzna(Y), brat(X,Y).
kuzyn(X,Z) :-babcia(Y,X), babcia(Y,Z), X\=Z, mężczyzna(X), \+brat(X,Z).

%Krok3%

małżeństwo(maria, piotr).
małżeństwo(adam, ewa).
małżeństwo(robert, agata).
małżeństwo(jan, anna).
małżeństwo(krzysztof, agnieszka).

małżonek(X,Y) :- małżeństwo(X,Y).
małżonek(X,Y) :- małżeństwo(Y,X).

teściowa(X,Z) :- kobieta(X), kobieta(Y), małżonek(Z,Y), rodzic(X,Y).
szwagier(X,Z) :- mężczyzna(X), ((małżonek(Y,X), siostra(Y,Z));(mężczyzna(Z),małżonek(Y1,Z), brat(X,Y1))).
