:- use_module(library(lists)).

%---------------ne pas afficher les warnings discontiguous------%
:- style_check(-discontiguous).

produire_reponse([fin],[L1]) :-
   L1 = [merci, de, m, '\'', avoir, consulte], !.

%--------------Traitement positif-------------------------------%
produire_reponse(L,Rep) :-

   mclef(M,_),
   member(M,L),
   write('L : '),
   write(L),
   clause(regle_rep(M,_,Pattern,Rep),Body),
   write('P : '),
   write(Pattern),
   match_pattern(Pattern,L),
   call(Body), !.

%---------------Traitement erreur sur données-------------------%
produire_reponse(L,[L1,L2,L3,L4]) :-
   member('bouche',L),
   L1 = [je, crois, que, votre, question, porte, sur, la, bouche, 'd\'un', vin],
   L2 = [veuillez, vérifier, 'l\'orthographe', du, vin],
   L3 = [si, le, vin, est, repris, dans, notre, catalogue,'j\'essaierai alors d\'y répondre'],
   L4 = [sinon, cela, signifie, que, ce, vin, 'n\'est', pas, repris, dans, notre, catalogue],!.

produire_reponse(L,[L1,L2,L3,L4]) :-
   member('robe',L),
   L1 = [je, crois, que, votre, question, porte, sur, la, robe, 'd\'un', vin],
   L2 = [veuillez, vérifier, 'l\'orthographe', du, vin],
   L3 = [si, le, vin, est, repris, dans, notre, catalogue,'j\'essaierai alors d\'y répondre'],
   L4 = [sinon, cela, signifie, que, ce, vin, 'n\'est', pas, repris, dans, notre, catalogue],!.

%---------------Traitement erreur sur orthographe----------------%
produire_reponse(_,[L1,L2, L3]) :-
   L1 = [je, ne, comprends, pas, votre, question, '.'],
   L2 = [veuillez, la, reformuler, en, faisant, attention, à, 'l\'orthographe'],
   L3 = ['j\'essaierai alors d\'y répondre'].

match_pattern(Pattern,Lmots) :-
   remplacer_liste_synonyme(Lmots, Lmots1),
   nom_vins_uniforme(Lmots1,L_mots_unif),
   sublist(Pattern,L_mots_unif).

%--------------remplacer les mots pluriels et accentués----------%
remplacer_liste_synonyme([],[]) :- !.
remplacer_liste_synonyme([T1|Q1], [T2|L2]) :-
   remplacer_mot_synonyme(T1,T2),
   remplacer_liste_synonyme(Q1,L2).


remplacer_mot_synonyme(T,S) :-
       synonyme(T,S), !.

remplacer_mot_synonyme(T,T).


sublist(SL,L) :-
   prefix(SL,L), !.
sublist(SL,[_|T]) :- sublist(SL,T).

nom_vins_uniforme(Lmots,L_mots_unif) :-
   L1 = Lmots,
   replace_vin([chateau,moulin,de,mallet,2014],chateau_moulin_de_mallet_2014,L1,L2),
   replace_vin([chateau,la,fleur,baudron,2014],chateau_la_fleur_baudron_2014,L2,L3),
   replace_vin([chateau,bois,vert,2014],chateau_bois_vert_2014,L3,L4),
   replace_vin([chateau,paret,2012],chateau_paret_2012,L4,L5),
   replace_vin([chateau,menota,2014],chateau_menota_2014,L5,L6),
   replace_vin([madiran,vieilles,vignes,2006],madiran_vieilles_vignes_2006,L6,L7),
   replace_vin([chateau,du,moulin,neuf,2014],chateau_du_moulin_neuf_2014,L7,L8),
   replace_vin([chateau,milon,la,grave,2012],chateau_milon_la_grave_2012,L8,L9),
   replace_vin([chateau,roc,de,binet,2010],chateau_roc_de_binet_2010,L9,L10),
   replace_vin([chateau,ruat,2010],chateau_ruat_2010,L10,L11),
   replace_vin([chateau,les,polyanthas,2010],chateau_les_polyanthas_2011,L11,L12),
   replace_vin([chateau,la,menotte,2012],chateau_la_menotte_2012,L12,L13),
   replace_vin([la,fleur,de,pomys,2012],la_fleur_de_pomys_2012,L13,L14),
   replace_vin([florilège,pauillac,2011],florilege_pauillac_2011,L14,L15),
   replace_vin([florilège,saint,julien,2010],florilege_saint_julien_2010,L15,L16),
   replace_vin([florilège,pomerol,2012],florilege_pomerol_2012,L16,L17),
   replace_vin([beaumes,de,venise,2015],beaumes_de_venise_2015,L17,L18),
   replace_vin([les,chaboeufs,2013],les_chaboeufs_2013,L18,L19),
   replace_vin([syrah,2015],syrah_2015,L19,L20),
   replace_vin([cotes,rhones,village,2014],cotes_rhones_village_2014,L20,L21),
   replace_vin([tautavel,2014],tautavel_2014, L21,L22),
   replace_vin([lirac,2015],lirac_2015, L22, L23),
   replace_vin([cairanne,2014],cairanne_2014, L23, L24),
   replace_vin([beaumes,venise,2015],beaumes_venise_2015, L24, L25),
   replace_vin([vacqueyras,2014],vacqueyras_2014, L25, L26),
   replace_vin([saint-joseph,2014],saint_joseph_2014, L26, L27),
   replace_vin([gigondas,2014],gigondas_2014, L27, L28),
   replace_vin([chateauneuf,du,pape,rouge,2013],chateauneuf_du_pape_rouge_2013, L28, L29),
   replace_vin([hermitage,rouge,2007],hermitage_rouge_2007, L29, L30),
   replace_vin([cremant,loire,brut],cremant_loire_brut, L30, L31),
   replace_vin([champagne,brut,réserve],brut_reserve, L31, L32),
   replace_vin([champagne,extra,brut],extra_brut, L32, L33),
   replace_vin([champagne,brut,oeil,perdrix],brut_oeil_perdrix, L33, L34),
   replace_vin([champagne,brut,rosé,de,saignée],brut_rose_saignee, L34, L35),
   replace_vin([champagne,brut,or,blanc],brut_or_blanc, L35, L36),
   replace_vin([champagne,brut,prestige],brut_prestige, L36, L37),
   L_mots_unif = L37.

replace_vin(L,X,In,Out) :-
   append(L,Suf,In), !, Out = [X|Suf].
replace_vin(_,_,[],[]) :- !.
replace_vin(L,X,[H|In],[H|Out]) :-
   replace_vin(L,X,In,Out).

% ---------------------inclure la base de données------------------%

:- include('synonyme.pl').
:- include('bordeau.pl').
:- include('rhone_languedoc.pl').
:- include('blanc.pl').
:- include('champagne.pl').
:- include('cognac.pl').

% Mots-clés %

mclef(vignoble,10).
mclef(millésime,10).
mclef(millésimes,10).
mclef(bouche,10).
mclef(nez,10).
mclef(appellation,10).
mclef(prix,10).
mclef(robe,5).
mclef(vin,5).
mclef(vins,5).
mclef(température,5).
mclef(accompagnement,5).
mclef(accompagnements,5).
mclef(informations,1).

% ----------------------------------------------------------------%

regle_rep(informations,1,
  [ avez, vous, des, informations, sur, le, Vin],
  Rep ) :-

   vin_existe(Vin,Rep).

vin_existe(V,[[oui, '.']]) :-
   nom(V,_),!.

vin_existe(_,[[non, '.']]).


% ----------------------------------------------------------------%



% ----------------------------------------------------------------%

regle_rep(bouche,2,
  [ que, donne, le, Vin, en, bouche ],
  Rep ) :-
   vin_bouche(Vin,Bouche),
   rep_vin_bouche(Bouche,Rep).

vin_bouche(V,B) :-
   bouche(V,B),!.

vin_bouche(V,[[non, spécifié,'.']]) :-
   nom(V,_).

rep_vin_bouche([[B|_]|_],[[non, spécifié,'.']]) :-
   B = '',!.

rep_vin_bouche(B,B).

% ----------------------------------------------------------------%

%-----------------------------------------------------------------%
regle_rep(robe,4,
  [ quelle, est, la, robe, de, ce, Vin ],Rep ) :-

     vin_robe(Vin,Robe),
     rep_vin_robe(Robe,Rep).

rep_vin_robe([[R|_]|_],[[non, spécifié,'.']]) :-
     R = '',!.

rep_vin_robe(R,R).

vin_robe(V,R) :-
     robe(V,R),!.

vin_robe(V,[[non, spécifié,'.']]) :-
     robe(V,_).



%-----------------------------------------------------------------%

%-----------------------------------------------------------------%
regle_rep(vins,5,
  [ auriez, vous, des, vins, entre, X, et, Y, eur ],
  Rep) :-

     valider_min_max(X,Y,Rep),
     lvins_prix_min_max(X,Y,Lvins),
     rep_lvins_min_max(Lvins,Rep).

valider_min_max(X,Y,[[]]) :-
   X < Y,!.
valider_min_max(_,_, [[bornes, inversées]]) :-
   fail.

rep_lvins_min_max([], [[ non, '.' ]]).
rep_lvins_min_max([H|T], [ [ oui, '.', je, dispose, de ] | L]) :-
   rep_litems_vin_min_max([H|T],L).

rep_litems_vin_min_max([],[]) :- !.
rep_litems_vin_min_max([(V,P)|L], [Irep|Ll]) :-
   nom(V,Appellation),
   Irep = [ '- ', Appellation, '(', P, ' EUR )' ],
   rep_litems_vin_min_max(L,Ll).

prix_vin_min_max(Vin,P,Min,Max) :-
   prix(Vin,P),
   Min =< P, P =< Max.

lvins_prix_min_max(Min,Max,Lvins) :-
   findall( (Vin,P) , prix_vin_min_max(Vin,P,Min,Max), Lvins ).

%-----------------------------------------------------------------%

%-----------------------------------------------------------------%

regle_rep(vins,6,
   [ quels, vins, de, Vignoble, avez, vous],
    Rep) :-
   lvins_vignoble(Vignoble,Lvins),
   rep_lvins_vignoble(Lvins,Rep).

rep_lvins_vignoble([],[[aucun, '.']]).
rep_lvins_vignoble([H|T],[ [plusieurs, '.', nous, avons, dans, notre, cave ] | L]) :-
   rep_litems_vin_vignoble([H|T],L).

rep_litems_vin_vignoble([],[]) :- !.
rep_litems_vin_vignoble([(V,_)|L],[Irep|L1]) :-
   nom(V,A),
   Irep = ['- ', A],
   rep_litems_vin_vignoble(L,L1).

lvins_vignoble(Vignoble,Lvins) :-
   findall((Vin,Vignoble),vignoble(Vin,Vignoble), Lvins).

% -----------------------------------------------------------------------%


% -----------------------------------------------------------------------%

regle_rep(appellation,7,
  [ que, recouvre,l,appellation, Vin], Rep) :-

     vin_appellation(Vin,Appellation),
     rep_vin_appellation(Appellation,Rep).

rep_vin_appellation([[A|_]|_],[[non, spécifié,'.']]) :-
     A = '',!.

rep_vin_appellation(A,A).

vin_appellation(V,A) :-
     description(V,A),!.

vin_appellation(V,[[non, spécifié,'.']]) :-
     description(V,_).



% -----------------------------------------------------------------------%

% -----------------------------------------------------------------------%

regle_rep(vins,8,[ quels, vins, de, Vignoble, me, conseillez, vous], Rep) :-

   lvins_vignoble_conseil(Vignoble,Lvins),
   rep_lvins_vignoble_conseil(Lvins,Rep).

rep_lvins_vignoble_conseil([],[[aucun, '.']]).
rep_lvins_vignoble_conseil([H|T],[ [plusieurs, '.', nous, vous, conseillons ] | L]) :-
   rep_litems_vin_vignoble_conseil([H|T],L).

rep_litems_vin_vignoble_conseil([],[]) :- !.
rep_litems_vin_vignoble_conseil([V|L],[Irep|L1]) :-
   nom(V,A),
   Irep = ['- ', A],
   rep_litems_vin_vignoble_conseil(L,L1).

lvins_vignoble_conseil(Vignoble,Lvins) :-
   findall(Vin,vignoble(Vin,Vignoble), Lvins1),
   findall(Vin,conseil(Vin,oui), Lvins2),
   intersection(Lvins1, Lvins2, Lvins).

% -----------------------------------------------------------------------%


% -----------------------------------------------------------------------%

regle_rep(vins,9, [ quels, autres, vins, de, Vignoble, auriez, vous], Rep) :-

   lvins_vignoble_autre(Vignoble,Lvins),
   rep_lvins_vignoble_autre(Lvins,Rep).

rep_lvins_vignoble_autre([],[[aucun, '.']]).
rep_lvins_vignoble_autre([H|T],[ [plusieurs, '.', nous, avons, encore ] | L]) :-
   rep_litems_vin_vignoble_autre([H|T],L).

rep_litems_vin_vignoble_autre([],[]) :- !.
rep_litems_vin_vignoble_autre([V|L],[Irep|L1]) :-
   nom(V,A),
   Irep = ['- ', A],
   rep_litems_vin_vignoble_autre(L,L1).

lvins_vignoble_autre(Vignoble,Lvins) :-
   findall(Vin,vignoble(Vin,Vignoble), Lvins1),
   findall(Vin,conseil(Vin,non), Lvins2),
   intersection(Lvins1, Lvins2, Lvins).


% -----------------------------------------------------------------------%


% -----------------------------------------------------------------------%

regle_rep(vins,10,
   [pour, fete, je, pense, faire, du, Plat, quels, vins, conseillez, vous],
    Rep) :-

     lvins_plat(Plat,Lvins),
     rep_lvins_plat(Lvins,Rep).

rep_lvins_plat([], [[ aucune, idée, '.' ]]).
rep_lvins_plat([H|T], [ [ oui, '.', je, vous, conseille ] | L]) :-
   rep_litems_plat([H|T],L).

rep_litems_plat([],[]) :- !.
rep_litems_plat([V|L], [Irep|Ll]) :-
   nom(V,A),
   Irep = [ '- ', A ],
   rep_litems_plat(L,Ll).

vin_plat(Vin,A) :-
   accompagnement(Vin,As,_),
   member(A,As).

lvins_plat(A,Lvins) :-
   findall(Vin , vin_plat(Vin,A), Lvins ).

% -----------------------------------------------------------------------%



%------------------------------------------------------------------------%
regle_rep(vins,11,
  [ nous, avons, un, budget, de, X, eur, quels, vins, nous, proposez, vous ],
  Rep) :-

     lvins_prix_max(X,Lvins),
     rep_lvins_max(Lvins,Rep).

rep_lvins_max([], [[ non, '.' ]]).
rep_lvins_max([H|T], [ [ oui, '.', je, dispose, de ] | L]) :-
   rep_litems_vin_max([H|T],L).

rep_litems_vin_max([],[]) :- !.
rep_litems_vin_max([(V,P)|L], [Irep|Ll]) :-
   nom(V,Appellation),
   Irep = [ '- ', Appellation, '(', P, ' EUR )' ],
   rep_litems_vin_max(L,Ll).

prix_vin_max(Vin,P,Max) :-
   prix(Vin,P),
   P =< Max.

lvins_prix_max(Max,Lvins) :-
   findall( (Vin,P) , prix_vin_max(Vin,P,Max), Lvins ).

% -----------------------------------------------------------------------%



% -----------------------------------------------------------------------%
regle_rep(millésimes,12,
   [ comme, Vignoble, quels, sont, les, millésimes, mentionnés, comme, Niveau],
    Rep) :-
   lvins_millesime(Vignoble,Niveau,Lvins),
   rep_lvins_millesime(Lvins,Rep).

rep_lvins_millesime([],[[aucun, '.']]).
rep_lvins_millesime([H|T],[ [plusieurs, '.', voice, ce, que, contient, notre, cave ] | L]) :-
   rep_litems_millesime([H|T],L).

rep_litems_millesime([],[]) :- !.
rep_litems_millesime([V|L],[Irep|L1]) :-
   nom(V,A),
   millesime(V,M,_),
   Irep = ['- ', A, '(', M, ')'],
   rep_litems_millesime(L,L1).

lvins_millesime(Vignoble,Niveau,Lvins) :-
   findall(Vin,vignoble(Vin,Vignoble), Lvins1),
   findall(Vin,millesime(Vin,_,Niveau), Lvins2),
   intersection(Lvins1, Lvins2, Lvins).

% -----------------------------------------------------------------------%

% -----------------------------------------------------------------------%

regle_rep(accompagnements,13,
   [quels, sont, les, accompagnements, à, éviter, pour, le, Vin],
    Rep) :-

     vin_eviter(Vin,LMets),
     rep_vin_mets_eviter(LMets,Rep).

rep_vin_mets_eviter([], [[ aucune, contre-indication, '.' ]]).
rep_vin_mets_eviter([H|T], [ [ oui, '.', je, vous, déconseille ] | L]) :-
   rep_litems_mets_eviter([H|T],L).

rep_litems_mets_eviter([],[]) :- !.
rep_litems_mets_eviter([M|L], [Irep|Ll]) :-
   Irep = [ '- ', M],
   rep_litems_mets_eviter(L,Ll).

vin_eviter(Vin,LMets) :-
   accompagnement(Vin,_,LMets),!.

vin_eviter(Vin,LMets) :-
   nom(Vin,_),
   LMets = [].

% -----------------------------------------------------------------------%

% -----------------------------------------------------------------------%

regle_rep(température,14,
   [a, quelle, température, faut, il, servir, le, Vin],
    Rep) :-
     vin_temperatures(Vin,Tmin,Tmax),
     rep_vin_temperatures([Tmin|Tmax],Rep).

rep_vin_temperatures([?|?], [[ sans, préférence, de, température, '.' ]]) :- !.
rep_vin_temperatures([Tmin|Tmax],[[je, vous, conseille, entre, Tmin,'°C', et,Tmax,'°C', '.']]).

vin_temperatures(Vin, Tmin, Tmax) :-
     service(Vin, Tmin, Tmax,_),!.

vin_temperatures(Vin,Tmin,Tmax) :-
   nom(Vin,_),
   Tmin = '?',
   Tmax = '?'.

% -----------------------------------------------------------------------%

% -----------------------------------------------------------------------%


/* --------------------------------------------------------------------- */
/*                                                                       */
/*          CONVERSION D'UNE QUESTION DE L'UTILISATEUR EN                */
/*                        LISTE DE MOTS                                  */
/*                                                                       */
/* --------------------------------------------------------------------- */

% lire_question(L_Mots)

lire_question(LMots) :- read_atomics(LMots).



/*****************************************************************************/
% my_char_type(+Char,?Type)
%    Char is an ASCII code.
%    Type is whitespace, punctuation, numeric, alphabetic, or special.

my_char_type(46,period) :- !.

% my_char_type(39,alphanumeric) :- !.%

my_char_type(X,alphanumeric) :- X >= 65, X =< 90, !.
my_char_type(X,alphanumeric) :- X >= 97, X =< 123, !.
my_char_type(X,alphanumeric) :- X >= 48, X =< 57, !.
my_char_type(X,whitespace) :- X =< 32, !.
my_char_type(X,punctuation) :- X >= 33, X =< 44, !.

my_char_type(X,alphanumeric) :- X = 45, !.

my_char_type(X,punctuation) :- X >= 46, X =< 47, !.
my_char_type(X,punctuation) :- X >= 58, X =< 64, !.
my_char_type(X,punctuation) :- X >= 91, X =< 96, !.
my_char_type(X,punctuation) :- X >= 123, X =< 126, !.

%Traitement des caractères accentués mais il semble se baser sur UTF8%
my_char_type(X,alphanumeric) :-

   X >= 224,
   X =< 236, !.

my_char_type(_,special).



caractere_special(X,Y) :-
   X = 226,
   Y = 97, !.

caractere_special(X,X).

/*****************************************************************************/
% lower_case(+C,?L)
%   If ASCII code C is an upper-case letter, then L is the
%   corresponding lower-case letter. Otherwise L=C.

lower_case(X,Y) :-
	X >= 65,
	X =< 90,
	Y is X + 32, !.

lower_case(X,X).


/*****************************************************************************/
% read_lc_string(-String)
%  Reads a line of input into String as a list of ASCII codes,
%  with all capital letters changed to lower case.

read_lc_string(String) :-
	get0(FirstChar),
	lower_case(FirstChar,LChar1),
        caractere_special(LChar1,LChar2),
	read_lc_string_aux(LChar2,String).

read_lc_string_aux(10,[]) :- !.  % end of line

read_lc_string_aux(-1,[]) :- !.  % end of file

read_lc_string_aux(LChar,[LChar|Rest]) :- read_lc_string(Rest).


/*****************************************************************************/
% extract_word(+String,-Rest,-Word) (final version)
%  Extracts the first Word from String; Rest is rest of String.
%  A word is a series of contiguous letters, or a series
%  of contiguous digits, or a single special character.
%  Assumes String does not begin with whitespace.

extract_word([C|Chars],Rest,[C|RestOfWord]) :-
	my_char_type(C,Type),
	extract_word_aux(Type,Chars,Rest,RestOfWord).

extract_word_aux(special,Rest,Rest,[]) :- !.
   % if Char is special, don't read more chars.

extract_word_aux(Type,[C|Chars],Rest,[C|RestOfWord]) :-
	my_char_type(C,Type), !,
	extract_word_aux(Type,Chars,Rest,RestOfWord).

extract_word_aux(_,Rest,Rest,[]).   % if previous clause did not succeed.


/*****************************************************************************/
% remove_initial_blanks(+X,?Y)
%   Removes whitespace characters from the
%   beginning of string X, giving string Y.

remove_initial_blanks([C|Chars],Result) :-
	my_char_type(C,whitespace), !,
	remove_initial_blanks(Chars,Result).

remove_initial_blanks(X,X).   % if previous clause did not succeed.


/*****************************************************************************/
% digit_value(?D,?V)
%  Where D is the ASCII code of a digit,
%  V is the corresponding number.

digit_value(48,0).
digit_value(49,1).
digit_value(50,2).
digit_value(51,3).
digit_value(52,4).
digit_value(53,5).
digit_value(54,6).
digit_value(55,7).
digit_value(56,8).
digit_value(57,9).


/*****************************************************************************/
% string_to_number(+S,-N)
%  Converts string S to the number that it
%  represents, e.g., "234" to 234.
%  Fails if S does not represent a nonnegative integer.

string_to_number(S,N) :-
	string_to_number_aux(S,0,N).

string_to_number_aux([D|Digits],ValueSoFar,Result) :-
	digit_value(D,V),
	NewValueSoFar is 10*ValueSoFar + V,
	string_to_number_aux(Digits,NewValueSoFar,Result).

string_to_number_aux([],Result,Result).


/*****************************************************************************/
% string_to_atomic(+String,-Atomic)
%  Converts String into the atom or number of
%  which it is the written representation.

string_to_atomic([C|Chars],Number) :-
	string_to_number([C|Chars],Number), !.

string_to_atomic(String,Atom) :- name(Atom,String).
  % assuming previous clause failed.


/*****************************************************************************/
% extract_atomics(+String,-ListOfAtomics) (second version)
%  Breaks String up into ListOfAtomics
%  e.g., " abc def  123 " into [abc,def,123].

extract_atomics(String,ListOfAtomics) :-
	remove_initial_blanks(String,NewString),
	extract_atomics_aux(NewString,ListOfAtomics).

extract_atomics_aux([C|Chars],[A|Atomics]) :-
	extract_word([C|Chars],Rest,Word),
	string_to_atomic(Word,A),       % <- this is the only change
	extract_atomics(Rest,Atomics).

extract_atomics_aux([],[]).


/*****************************************************************************/
% clean_string(+String,-Cleanstring)
%  removes all punctuation characters from String and return Cleanstring

clean_string([C|Chars],L) :-
	my_char_type(C,punctuation),
	clean_string(Chars,L), !.
clean_string([C|Chars],[C|L]) :-
	clean_string(Chars,L), !.
clean_string([C|[]],[]) :-
	my_char_type(C,punctuation), !.
clean_string([C|[]],[C]).


/*****************************************************************************/
% read_atomics(-ListOfAtomics)
%  Reads a line of input, removes all punctuation characters, and converts
%  it into a list of atomic terms, e.g., [this,is,an,example].

read_atomics(ListOfAtomics) :-
	read_lc_string(String),
	clean_string(String,Cleanstring),
	extract_atomics(Cleanstring,ListOfAtomics).



/* --------------------------------------------------------------------- */
/*                                                                       */
/*        ECRIRE_REPONSE : ecrit une suite de lignes de texte            */
/*                                                                       */
/* --------------------------------------------------------------------- */

ecrire_reponse(L) :-
   nl, write('GGS :'),
   ecrire_li_reponse(L,1,1).

% ecrire_li_reponse(Ll,M,E)
% input : Ll, liste de listes de mots (tout en minuscules)
%         M, indique si le premier caractere du premier mot de
%            la premiere ligne doit etre mis en majuscule (1 si oui, 0 si non)
%         E, indique le nombre d'espaces avant ce premier mot

ecrire_li_reponse([],_,_) :-
    nl.

ecrire_li_reponse([Li|Lls],Mi,Ei) :-
   ecrire_ligne(Li,Mi,Ei,Mf),
   ecrire_li_reponse(Lls,Mf,2).

% ecrire_ligne(Li,Mi,Ei,Mf)
% input : Li, liste de mots a ecrire
%         Mi, Ei booleens tels que decrits ci-dessus
% output : Mf, booleen tel que decrit ci-dessus a appliquer
%          a la ligne suivante, si elle existe

ecrire_ligne([],M,_,M) :-
   nl.

ecrire_ligne([M|L],Mi,Ei,Mf) :-
   ecrire_mot(M,Mi,Maux,Ei,Eaux),
   ecrire_ligne(L,Maux,Eaux,Mf).

% ecrire_mot(M,B1,B2,E1,E2)
% input : M, le mot a ecrire
%         B1, indique s'il faut une majuscule (1 si oui, 0 si non)
%         E1, indique s'il faut un espace avant le mot (1 si oui, 0 si non)
% output : B2, indique si le mot suivant prend une majuscule
%          E2, indique si le mot suivant doit etre precede d'un espace

ecrire_mot('.',_,1,_,1) :-
   write('. '), !.
ecrire_mot('\'',X,X,_,0) :-
   write('\''), !.
ecrire_mot(',',X,X,E,1) :-
   espace(E), write(','), !.
ecrire_mot(M,0,0,E,1) :-
   espace(E), write(M).
ecrire_mot(M,1,0,E,1) :-
   name(M,[C|L]),
   D is C - 32,
   name(N,[D|L]),
   espace(E), write(N).

espace(0).
espace(N) :- N>0, Nn is N-1, write(' '), espace(Nn).


/* --------------------------------------------------------------------- */
/*                                                                       */
/*                            TEST DE FIN                                */
/*                                                                       */
/* --------------------------------------------------------------------- */

fin(L) :- member(fin,L).


/* --------------------------------------------------------------------- */
/*                                                                       */
/*                         BOUCLE PRINCIPALE                             */
/*                                                                       */
/* --------------------------------------------------------------------- */

grandgousier :-

   nl, nl,
   write('Bonjour, en quoi puis-je vous être utile ?'), nl,
   write('Voici la liste des questions que vous pouvez me poser :'),nl,nl,
   write('1. Avez-vous des informations sur le (vin) ?'), nl,
   write('2. Que donne le (vin) en bouche ?'), nl,
   write('3. Que donne le (vin) au nez ?'), nl,
   write('4. Quelle est la robe de ce (xxx) ?'), nl,
   write('5. Auriez vous des vins entre (xxx) et (yyy) eur ?'), nl,
   write('6. Quels vins de (xxx) avez vous ?'), nl,
   write('7. Que recouvre l appellation (xxx) ?'), nl,
   write('8. Quels vins de (xxx) me conseillez vous ?'), nl,
   write('9. Quels autres vins de (xxx) auriez vous ?'), nl,
   write('10. Pour (fête), je pense faire du (plat), quels vins conseillez vous ?'), nl,
   write('11. Nous avons un budget de (x) eur, quels vins nous proposez vous ?'), nl,
   write('12. Comme (vignoble) quels sont les millésimes mentionnés comme (niveau) ?'), nl,
   write('13. Quels sont les accompagnements à éviter pour le (vin) ?'), nl,
   write('14. A quelle température faut il servir le (vin) ?'), nl,

   nl,nl,

   repeat,
      write('Vous : '),
      lire_question(L_Mots),
      produire_reponse(L_Mots,L_ligne_reponse),
      ecrire_reponse(L_ligne_reponse),
   fin(L_Mots), !.


/* --------------------------------------------------------------------- */
/*                                                                       */
/*             ACTIVATION DU PROGRAMME APRES COMPILATION                 */
/*                                                                       */
/* --------------------------------------------------------------------- */

:- grandgousier.











