:- use_module(library(clpfd)).


% ---------------------------------------------------------------------- %
%                                                                        %
%                        PREDICAT PRINCIPAL                              %
%                                                                        %
% ---------------------------------------------------------------------- %

go :- Lconvives = [  manon, alice, juliette, lucie, charlotte, olivia, margaux,
                     jules, hugo, tom, louis, paul, jean, antoine  ],
      table(Lconvives).

table(Lconvives) :-

    length([anne,michel|Lconvives],Nb),
    produire_lassoc([anne,michel|Lconvives],Nb,Lassoc),
    alternance_homme_femme(Lassoc,Nb),
    meme_hobby(Lassoc,Nb),
    pas_epoux_cote_a_cote(Lassoc,Nb),
    pas_incompatibilite(Lassoc,Nb),
    places_differentes(Lassoc),
    label_places(Lassoc),

    sort(2,@<,Lassoc,Lassoc_trie),
    impression_table(Lassoc_trie).



% ---------------------------------------------------------------------- %
%                                                                        %
%                          LISTE ASSOCIATIVE                             %
%                                                                        %
% ---------------------------------------------------------------------- %


produire_lassoc(L, N, A) :-
                      associer(A,L,N).


% fin du processus récursif d'assosication
associer(_,[],_) :- !.

%position de la mariée toujours égale à 1%
associer(A1,[I|L2],_) :-
    A1 = [],
    I = 'anne',
    append((I,1),A1,A2),
    associer(A2,L2),!.

%position du marié est toujours à la même place relative (n ou n+1)%
% La position de michel est calculée sur base de la division entière et
% de son reste
associer(A1,[I|L2],N) :-
    length(A1,1),
    I = 'michel',
    C is mod(N,2),
    S is mod(C,2),
    M is C + S,
    append((I,M),A1,A2),
    associer(A2,L2,N),!.

%position des autres convives
%La position possible des autres convives est entre anne et michel%
% Il y a deux domaines possibles : gauche/droite de anne/michel ou
% droite/gauche de anne/michel
associer(A1,[I|L2],N) :-
    C is mod(N,2),
    S is mod(C,2),
    M is C + S,
    M1 is M - 1,
    M2 is M + 1,
    X ins 2.. M1 \/ M2..N,
    append((I,X),A1,A2),
    associer(A2,L2,N).


% ---------------------------------------------------------------------- %
%                                                                        %
%                               CONTRAINTES                              %
%                                                                        %
% ---------------------------------------------------------------------- %

% Alternance homme-femme
% ----------------------

% fin du processus récursif de l'analyse de la contrainte
alternance_homme_femme([],_) :-!.

% Vérification que la place d'un homme est paire.
alternance_homme_femme([(I,P)|A2], N) :-
      sexe(I,m),
      C = mod(P,2),
      C = 0,
      alternance_homme_femme(A2, N),!.


% Vérification que la place d'une femme est impaire
alternance_homme_femme([(I,P)|A2], N) :-
      sexe(I,f),
      C = mod(P,2),
      C = 1,
      alternance_homme_femme(A2, N),!.


% Meme hobby
% ----------

% Finalisation du processus récursif sur base d'une liste finalement
% vide
meme_hobby([],_) :- !.

% Prendre le premier de la liste
% récupérer sa position
% initier un processus récursif pour rechercher l'élément qui est à la
% position suivante (position + 1 ou retour à N).
% Une fois trouvé, comparer la liste des hobbies des deux invités.
% S'il y a une intersection entre ces deux listes, cela signifie que les
% deux invités partagent un hobby.
meme_hobby([(I1,P1)|A1],N) :-
    rechercher_position_suivante(P1,A1,I2,N),
    hobby(I1, H1),
    hobby(I2, H2),
    intersection(H1,H2,H3),
    length(H3,L),
    meme_hobby(A1,N),
    L > 0.

%Finalisation du processus récursif sur base d'une liste finalement vide
rechercher_position_suivante(_,[],_,_) :- !.

%L'élément analysé est l'élément recherché%
rechercher_position_suivante(P,[(I1,P1)|_],I1,_) :-
    P = P1 - 1,!.

%L'élément analysé est l'élément en position N-1%
rechercher_position_suivante(P,[(I1,P1)|_],I1,N) :-
    P = N - 1,
    P1 = N,!.

% L'élément suivant a été étudié dans les deux prédicats précédents.
% Celui-ci ne fait que poursuivre le processus l'élément d'après.
rechercher_position_suivante(P,[_|A1],I2,N) :-
    rechercher_position_suivante(P,A1,I2,N).




% Pas epoux cote a cote
% ---------------------

pas_epoux_cote_a_cote([],_) :- !.

pas_epoux_cote_a_cote([(I1,P1)|A1],N) :-
    rechercher_epoux(I1,A1,N,P2),
    P1 = N,
    P2 \= 1,
    pas_epoux_cote_a_cote(A1,N),!.

pas_epoux_cote_a_cote([(I1,P1)|A1],N) :-
    rechercher_epoux(I1,A1,N,P2),
    P = P1 + 1,
    P \= P2,
    pas_epoux_cote_a_cote(A1,N).


rechercher_epoux(_,[],_,_) :- !.

rechercher_epoux(I,[(I1,P1)|_],_,P1) :-
    epoux(I,I1),!.

rechercher_epoux(I,[_|A],N,P) :-
    rechercher_epoux(I,A,N,P).



% Pas d incompatibilite
% ---------------------

pas_incompatibilite([],_) :- !.

pas_incompatibilite([(I1,P1)|A1],N) :-
    incompatible_suivant(I1,A1,P2),
    P1 = N,
    P2 \= 1,
    pas_incompatibilite(A1,N).


pas_incompatibilite([(I1,P1)|A1],N) :-
    incompatible_suivant(I1,A1,P2),
    P = P1 + 1,
    P \= P2,
    pas_incompatibilite(A1,N).


incompatible_suivant([],_,_) :- !.

incompatible_suivant(I1,[(I2,P2)|_],P2) :-
    incompatible(I1,I2),!.

incompatible_suivant(I,[_|A],P) :-
    incompatible_suivant(I1,A,P).


% Personnes a des places differentes
% ----------------------------------

% Construire une liste plate de toutes les positions.
% Vérifier que toutes les positions sont différentes.
places_differentes([(_,P)|A]) :-
    append(P,L),
    construire_liste_positions(A,L),
    all_different(L).

% Fin du processus récursif de construire de la liste plate des
% positions.
construire_liste_positions([],_) :- !.

%Ajouter un élément dans la liste plate des positions.
%Poursuivre le parcours de la liste pour constuire la liste plate.
construire_liste_positions([(_,P)|A],L) :-
    append(P,L),
    construire_liste_positions(A,L).




% ---------------------------------------------------------------------- %
%                                                                        %
%                                LABELING                                %
%                                                                        %
% ---------------------------------------------------------------------- %


label_places(A) :-
                labeling([leftmost,down],A).



% ---------------------------------------------------------------------- %
%                                                                        %
%                                IMPRESSION                              %
%                                                                        %
% ---------------------------------------------------------------------- %

impression_table([]) :- !, nl.
impression_table([pers_var(P,V)|T]) :-
    nl, format('~w ~d ~w ~a',['Place ',V, ' :', P]),
    impression_table(T).



% ---------------------------------------------------------------------- %
%                                                                        %
%                            BASE DE DONNEES                             %
%                                                                        %
% ---------------------------------------------------------------------- %

epoux(anne,michel).
epoux(manon,jules).
epoux(alice,hugo).
epoux(juliette,tom).
epoux(lucie,louis).
epoux(charlotte,paul).
epoux(olivia,jean).
epoux(margaux,antoine).

sexe(anne,f).
sexe(manon,f).
sexe(alice,f).
sexe(juliette,f).
sexe(lucie,f).
sexe(charlotte,f).
sexe(olivia,f).
sexe(margaux,f).

sexe(michel,m).
sexe(jules,m).
sexe(hugo,m).
sexe(tom,m).
sexe(louis,m).
sexe(paul,m).
sexe(jean,m).
sexe(antoine,m).

hobby(anne,[sport,jardinage,voyages]).
hobby(manon,[jardinage,voyages]).
hobby(alice,[jardinage,voyages]).
hobby(juliette,[sport,voyages]).
hobby(lucie,[jardinage]).
hobby(charlotte,[jardinage]).
hobby(olivia,[sport,jardinage]).
hobby(margaux,[sport]).

hobby(michel,[sport,jardinage,voyages]).
hobby(jules,[sport,jardinage]).
hobby(hugo,[sport,jardinage]).
hobby(tom,[sport,voyages]).
hobby(louis,[sport,jardinage]).
hobby(paul,[sport]).
hobby(jean,[sport,jardinage]).
hobby(antoine,[sport,jardinage]).

incompatible(manon,louis).
incompatible(charlotte,antoine).
incompatible(margaux,hugo).


:- go.










































