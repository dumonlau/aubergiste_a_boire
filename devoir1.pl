% Faits spécifiant le temps de traversée de chaque membre du groupe
duree(bono, 1).
duree(edge, 2).
duree(adam, 5).
duree(larry, 10).

% valide si x appartient à l'espace d'état
valide(etat(Gauche, Droite, Torche, PosTorche, Horloge)) :-
	valide_pos_torche(PosTorche),
	valide_torche(Torche),
        valide_horloge(Horloge),
	append([Gauche, Droite, Torche], Membres),
	personnes(Membres).

% La position de la torche est à gauche ou à droite
valide_pos_torche(g).
valide_pos_torche(d).

% valide_torche(M) si M est une liste de maximum 2 membres du groupe U2
valide_torche(M) :-
	length(M,N),
	N < 3.

% valide si l'horloge est inférieure à 17
valide_horloge(H):-
             H =< 17.

% personnes(M)est valide si M est une liste contenant une et une seule
% fois chaque membre du groupe U2
personnes(M) :-
	permutation(M,[bono,edge,adam,larry]).

% Etat initial
etat_initial(etat(G, [], [], g, 0)) :-
   personnes(G).

% Etat final
etat_final(etat([], D, [], d, H)) :-
   personnes(D),
   valide_horloge(H).

% cas UN membre prend la torche pour traverser le pont
partir(etat(Gauche1,Droite1,Torche1,PosTorche,Horloge), etat(Gauche2,Droite2,Torche2,PosTorche,Horloge)) :-
	partir1(Gauche1,Droite1,Torche1,Gauche2,Droite2,Torche2,PosTorche),
	valide(etat(Gauche2,Droite2,Torche2,PosTorche,Horloge)).

% cas où DEUX membres prennent la torche pour traverser le pont
partir(etat(Gauche1,Droite1,Torche1,PosTorche,Horloge), etat(Gauche2,Droite2,Torche2,PosTorche,Horloge)) :-
	partir1(Gauche1,Droite1,Torche1,GaucheInt,DroiteInt,TorcheInt,PosTorche),
	partir1(GaucheInt,DroiteInt,TorcheInt,Gauche2,Droite2,Torche2,PosTorche),
	valide(etat(Gauche2,Droite2,Torche2,PosTorche,Horloge)).

partir1(Gauche1,Droite,Torche1,Gauche2,Droite,Torche2,g) :-
	transfert(Gauche1,Torche1,Gauche2,Torche2).
partir1(Gauche,Droite1,Torche1,Gauche,Droite2,Torche2,d) :-
	transfert(Droite1,Torche1,Droite2,Torche2).

% calculer la durée de la traversée s'il y a un membre qui traverse le
% pont
maximum1(T,D) :-
    nth0(0,T,U1),
    duree(U1,D).

% cas où UN membre arrive sur une rive pour ne pas repartir
arriver(etat(Gauche1,Droite1,Torche1,PosTorche,Horloge1), etat(Gauche2,Droite2,Torche2,PosTorche,Horloge2)) :-
	arriver1(Gauche1,Droite1,Torche1,Gauche2,Droite2,Torche2,PosTorche),
        maximum1(Torche2,Duree),
        Horloge2 is Horloge1 + Duree,
	valide(etat(Gauche2,Droite2,Torche2,PosTorche,Horloge2)).

% calculer la durée de la traversée s'il y a deux membres qui traversent
% le pont
maximum2(T,D) :-
    nth0(0,T,U1),
    nth0(1,T,U2),
    duree(U1,D1),
    duree(U2,D2),
    D is max(D1,D2).


% cas où DEUX membres arrivent sur une rive pour ne pas repartir
arriver(etat(Gauche1,Droite1,Torche1,PosTorche,Horloge1), etat(Gauche2,Droite2,Torche2,PosTorche,Horloge2)) :-
	arriver1(Gauche1,Droite1,Torche1,GaucheInt,DroiteInt,TorcheInt,PosTorche),
	arriver1(GaucheInt,DroiteInt,TorcheInt,Gauche2,Droite2,Torche2,PosTorche),
        maximum2(Torche2,Duree),
        Horloge2 is Horloge1 + Duree,
	valide(etat(Gauche2,Droite2,Torche2,PosTorche,Horloge2)).

arriver1(Gauche1,Droite,Torche1,Gauche2,Droite,Torche2,g) :-
	transfert(Torche1,Gauche1,Torche2,Gauche2).
arriver1(Gauche,Droite1,Torche1,Gauche,Droite2,Torche2,d) :-
	transfert(Torche1,Droite1,Torche2,Droite2).

% transfert(A1,B1,A2,B2) si A2 vaut A1 avec un élément en moins
% et B2 vaut B1 avec cet élément en plus

transfert([H|T],B1,T,[H|B1]).
transfert([H|T],B1,[H|T2],B2) :-
	transfert(T,B1,T2,B2).

traverser(etat(Gauche,Droite,Torche,g,_), etat(Gauche,Droite,Torche,d,_)) :-
	length(Torche,N),
	N>0,
	N<3.
traverser(etat(Gauche,Droite,Torche,d), etat(Gauche,Droite,Torche,g)) :-
	length(Torche,N),
	N>0,
	N<3.

% une transition entre deux états résulte soit d'une montée, soit d'une
% descente, soit d'une traversée
transition(X,Y) :-
	partir(X,Y).
transition(X,Y) :-
	arriver(X,Y).
transition(X,Y) :-
	traverser(X,Y).

etats_equivalents(etat(Gauche1,Droite1,Torche1,PosTorche),
		  etat(Gauche2,Droite2,Torche2,PosTorche)) :-
	permutation(Gauche1,Gauche2),
	permutation(Droite1,Droite2),
	permutation(Torche1,Torche2).


% gestion : strategie pour l'exploration de l'espace d'états, à l'aide des opérateurs

solution(Debut,Fin,Sol) :-
	open_close_search(Fin, [[Debut]], [], Sol).

open_close_search(Fin,Open,Closed,Result) :-
	member(Premier,Open),
	open_close_search(Fin,Open,Closed,Result,Premier).

open_close_search(Fin,_,_,Solution,Premier) :-
	but(Premier,Fin),
	reverse(Premier,Solution),
	ecrire_liste(Solution).

open_close_search(Fin,Open,Closed,Result,Premier) :-
	delete(Open,Premier,Derniers),
	successeur(Premier,Successeurs),
	diff(Successeurs,Closed,OpenSuccesseurs),
	rassembler_dfs(OpenSuccesseurs,Derniers,NewOpen),
	Premier=[H|_],
	open_close_search(Fin,NewOpen,[H|Closed],Result).

but([EtatAtteint|_],EtatVise) :-
	etats_equivalents(EtatAtteint, EtatVise).

successeur([H|T],Successeurs) :-
	successeur([H|T],Successeurs,[]).

successeur([H|T],Successeurs,Int) :-
	transition(H,S),
	not(member([S,H|T],Int)),
	!,
	successeur([H|T],Successeurs,[[S,H|T]|Int]).

successeur(_,Int,Int).

diff(Successeurs,Closed,OpenSuccesseurs) :-
	diff(Successeurs,Closed,OpenSuccesseurs,[]).

diff([],_,Int,Int).

diff([[H|_]|Derniers],Closed,OpenSuccesseurs,Int) :-
	member(H2,Closed),
	etats_equivalents(H,H2),
	!,
	diff(Derniers,Closed,OpenSuccesseurs,Int).

diff([Premier|Derniers],Closed,OpenSuccesseurs,Int) :-
	diff(Derniers,Closed,OpenSuccesseurs,[Premier|Int]).

rassembler_dfs(E1,E2,NewOpen) :-
	rassembler(E2,E1,NewOpen,[]).

rassembler([],E2,Union,Int) :-
	append(E2,Int,Union).

rassembler([[H|_]|Succ],E2,Union,Int) :-
	member([H|_],E2),
	!,
	rassembler(Succ,E2,Union,Int).

rassembler([Premier|Succ],E2,Union,Int) :-
	rassembler(Succ,E2,Union,[Premier|Int]).

ecrire_liste([]).
ecrire_liste([H|T]) :-
	write(H), nl, ecrire_liste(T).

% Test de recherche de solution

solution_u2 :-
   etat_initial(I),
   etat_final(F),
   solution(I, F, _Sol).

:- solution_u2.




























