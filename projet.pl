:- use_module(library(lists)).

/* --------------------------------------------------------------------- */
/*                                                                       */
/*        PRODUIRE_REPONSE(L_Mots,L_Lignes_reponse) :                    */
/*                                                                       */
/*        Input : une liste de mots L_Mots representant la question      */
/*                de l'utilisateur                                       */
/*        Output : une liste de liste de lignes correspondant a la       */
/*                 reponse fournie par le bot                            */
/*                                                                       */
/*        NB Pour l'instant le predicat retourne dans tous les cas       */
/*            [  [je, ne, sais, pas, '.'],                               */
/*               [les, etudiants, vont, m, '\'', aider, '.'],            */
/*               ['vous le verrez !']                                    */
/*            ]                                                          */
/*                                                                       */
/*        Je ne doute pas que ce sera le cas ! Et vous souhaite autant   */
/*        d'amusement a coder le predicat que j'ai eu a ecrire           */
/*        cet enonce et ce squelette de solution !                       */
/*                                                                       */
/* --------------------------------------------------------------------- */


/*                      !!!    A MODIFIER   !!!                          */

produire_reponse([fin],[L1]) :-
   L1 = [merci, de, m, '\'', avoir, consulte], !.

produire_reponse(L,Rep) :-
   write(L),
   mclef(M,_), member(M,L),
   clause(regle_rep(M,_,Pattern,Rep),Body),
   write(Pattern),
   write('clause'),
   match_pattern(Pattern,L),
   call(Body), !.

produire_reponse(_,[L1,L2, L3]) :-
   L1 = [je, ne, sais, pas, '.'],
   L2 = [les, etudiants, vont, m, '\'', aider, '.' ],
   L3 = ['vous le verrez !'].

match_pattern(Pattern,Lmots) :-
   nom_vins_uniforme(Lmots,L_mots_unif),
   sublist(Pattern,L_mots_unif).

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
   replace_vin([florilege,pauillac,2011],florilege_pauillac_2011,L14,L15),
   replace_vin([florilege,saint,julien,2010],florilege_saint_julien_2010,L15,L16),
   replace_vin([florilege,pomerol,2012],florilege_pomerol_2012,L16,L17),
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
   L_mots_unif = L30.

replace_vin(L,X,In,Out) :-
   append(L,Suf,In), !, Out = [X|Suf].
replace_vin(_,_,[],[]) :- !.
replace_vin(L,X,[H|In],[H|Out]) :-
   replace_vin(L,X,In,Out).

% ----------------------------------------------------------------%

% Bordeaux %

nom(chateau_moulin_de_mallet_2014,'Ch. Moulin de Mallet 2014 - Bordeaux').
nom(chateau_la_fleur_baudron_2014, 'Ch. La Fleur Baudron 2014 - Bordeaux Sup�rieur').
nom(chateau_bois_vert_2014, 'Ch. Bois Vert "Cuv�e El�gance" 2014 ').
nom(chateau_paret_2012, 'Ch. Paret 2012').
nom(chateau_menota_2014, 'Ch. M�nota 2014').
nom(madiran_vieilles_vignes_2006, 'Madiran Vieilles Vignes 2006').
nom(chateau_du_moulin_neuf_2014, 'Ch. Moulin Neuf 2014').
nom(chateau_milon_la_grave_2012, 'Ch. Milon La Grave 2012').
nom(chateau_roc_de_binet_2010, 'Ch. Roc de Binet 2010').
nom(chateau_ruat_2010, 'Ch. Ruat 2010').
nom(chateau_les_polyanthas_2010,'Ch. Les Polyanthas 2010').
nom(chateau_la_menotte_2012, 'Ch. La Menotte 2012').
nom(la_fleur_de_pomys_2012, 'La Fleur de Pomys 2012').
nom(florilege_pauillac_2011, 'Floril�ge Pauillac 2011').
nom(florilege_saint_julien_2010, 'Floril�ge Saint Julien 2010').
nom(florilege_pomerol_2012, 'Floril�ge Pomerol 2012').

vignoble(chateau_moulin_de_mallet_2014,bordeaux).
vignoble(chateau_la_fleur_baudron_2014,bordeaux).
vignoble(chateau_bois_vert_2014,bordeaux).
vignoble(chateau_paret_2012,bordeaux).
vignoble(chateau_menota_2014,bordeaux).
vignoble(madiran_vieilles_vignes_2006,bordeaux).
vignoble(chateau_du_moulin_neuf_2014,bordeaux).
vignoble(chateau_milon_la_grave_2012,bordeaux).
vignoble(chateau_roc_de_binet_2010,bordeaux).
vignoble(chateau_ruat_2010,bordeaux).
vignoble(chateau_les_polyanthas_2010,bordeaux).
vignoble(chateau_la_menotte_2012,bordeaux).
vignoble(la_fleur_de_pomys_2012,bordeaux).
vignoble(florilege_pauillac_2011,bordeaux).
vignoble(florilege_saint_julien_2010,bordeaux).
vignoble(florilege_pomerol_2012,bordeaux).


millesime(les_chaboeufs_2013, 2013).
millesime(chateau_moulin_de_mallet_2014, 2014).
millesime(chateau_la_fleur_baudron_2014, 2014).
millesime(chateau_bois_vert_2014, 2014).
millesime(chateau_paret_2012, 2012).
millesime(chateau_menota_2014, 2014).
millesime(madiran_vieilles_vignes_2006, 2006).
millesime(chateau_du_moulin_neuf_2014, 2014).
millesime(chateau_milon_la_grave_2012, 2012).
millesime(chateau_roc_de_binet_2010, 2010).
millesime(chateau_ruat_2010, 2010).
millesime(chateau_les_polyanthas_2010, 2010).
millesime(chateau_la_menotte_2012, 2012).
millesime(la_fleur_de_pomys_2012, 2012).
millesime(florilege_pauillac_2011, 2011).
millesime(florilege_saint_julien_2010, 2010).
millesime(florilege_pomerol_2012, 2012).

prix(chateau_moulin_de_mallet_2014, 6.85).
prix(chateau_la_fleur_baudron_2014, 7.48).
prix(chateau_bois_vert_2014, 8.11).
prix(chateau_paret_2012, 8.68).
prix(chateau_menota_2014, 9.46).
prix(madiran_vieilles_vignes_2006, 9.92).
prix(chateau_du_moulin_neuf_2014, 10.03).
prix(chateau_milon_la_grave_2012, 12.54).
prix(chateau_roc_de_binet_2010, 12.69).
prix(chateau_ruat_2010, 14.37).
prix(chateau_les_polyanthas_2010, 15.06).
prix(chateau_la_menotte_2012, 15.71).
prix(la_fleur_de_pomys_2012, 21.36).
prix(florilege_pauillac_2011, 30.65).
prix(florilege_saint_julien_2010, 30.65).
prix(florilege_pomerol_2012, 31.04).


bouche(chateau_moulin_de_mallet_2014,
  [
     ['un joli vin, classique, polyvalent, avec un bel �ventail aromatique et des tannins fins', '.']
  ]).
bouche(chateau_la_fleur_baudron_2014,
  [
     ['bouche tr�s plaisante, riche, et de beaux tannins associ�s � un bois� bien int�gr�','.']
  ]).
bouche(chateau_bois_vert_2014,
  [
     ['les saveurs sont tr�s g�n�reuses, tr�s plaisantes avec cette rondeur caract�ristique du merlot','.']
  ]).
bouche(chateau_paret_2012,
  [
     ['la bouche suit, alliant mati�re et densit�, avec une grande maturit�'],
     ['on a de belles notes de fruits noirs, de chocolat et de sous-bois (aiguilles de pin)','.']
  ]).
bouche(chateau_menota_2014,
  [
     ['la texture est ronde et velout�e aux tannins soyeux'],
     ['l\'ensemble est dense, d\'un remarquable �quilibre','.']
  ]).
bouche(madiran_vieilles_vignes_2006,
  [
     ['le temps a permis � ce cru de s\'�panouir et d\'offrir aujourd\'hui une merveilleuse palette d\'ar�mes et de saveurs','.']
  ]).
bouche(chateau_du_moulin_neuf_2014,
  [
     ['t�moigne d\'une belle maturit�, avec des tannins m�rs','.']
  ]).
bouche(chateau_milon_la_grave_2012,
  [
     ['les saveurs sont denses et cr�meuses, avec beaucoup d\'harmonie','.']
  ]).
bouche(chateau_roc_de_binet_2010,
  [
     ['sensation de richesse, d\'�toffe, de densit� � l\'attaque','.']
  ]).
bouche(chateau_ruat_2010,
  [
     ['les saveurs sont � la fois charnues, serr�es, riches, concentr�es et onctueuses','.']
  ]).
bouche(chateau_les_polyanthas_2010,
  [
     ['le style est onctueux, rond et soyeux, avec une remarquable profondeur','.']
  ]).
bouche(chateau_la_menotte_2012,
  [
     ['la texture est velout�e, rac�e, d\'une tr�s grande �toffe','.']
  ]).
bouche(la_fleur_de_pomys_2012,
  [
     ['les saveurs sont riches et concentr�es, avec beaucoup de densit�','.']
  ]).
bouche(florilege_pauillac_2011,
  [
     ['la bouche est puissante, mais les tannins sont �l�gants et bien accord�s','.']
  ]).
bouche(florilege_saint_julien_2010,
  [
     ['la sensation dense et cr�meuse t�moigne de la pl�nitude de ce cru de pr�sent et d\'avenir','.']
  ]).
bouche(florilege_pomerol_2012,
  [
     ['puissance aromatique se poursuit en bouche avec des saveurs riches et intenses au toucher velout�','.']
  ]).


nez(chateau_moulin_de_mallet_2014,
  [
     [cerise, m�re,'.']
  ]).
nez(chateau_la_fleur_baudron_2014,
  [
     ['fruits compot�s',�pices,violette,'.']
  ]).
nez(chateau_bois_vert_2014,
  [
     [bois, violette, cassis, empyreumatique,'.']
  ]).
nez(chateau_paret_2012,
  [
     ['.']
  ]).
nez(chateau_menota_2014,
  [
     ['fruits noirs',�pices,empyreumatique,'.']
  ]).
nez(madiran_vieilles_vignes_2006,
  [
     ['fruits noirs',cacao,'.']
  ]).
nez(chateau_du_moulin_neuf_2014,
  [
     [myrtille, m�re,fum�e,chocolat,'.']
  ]).
nez(chateau_milon_la_grave_2012,
  [
     [fraise, groseille, empyreumatique,'.']
  ]).
nez(chateau_roc_du_binet_2010,
  [
     [cassis, cerise, violette, truffe, '.']
  ]).
nez(chateau_ruat_2010,
  [
     ['.']
  ]).
nez(chateau_les_polyanthas_2010,
  [
     ['.']
  ]).
nez(chateau_la_menotte_2012,
  [
     [intense, fruits, fleurs, truffe, caf�, violette,'.']
  ]).
nez(la_fleur_de_pomys_2012,
  [
     [empyreumatique,complexe, concentr�,'.']
  ]).
nez(florilege_pauillac_2011,
  [
     [concentr�,'fruits noirs', 'touche de bois de vigne',r�glisse,'.']
  ]).
nez(florilege_saint_julien_2010,
  [
     ['.']
  ]).
nez(florilege_pomerol_2012,
  [
     ['bouquet intense','.']
  ]).


robe(chateau_moulin_de_mallet_2014,
  [
     [jolie, grenat, 'reflets rubis', '.']
  ]).
robe(chateau_la_fleur_baudron_2014,
  [
     [soutenue, '.']
  ]).
robe(chateau_bois_vert_2014,
  [
     ['.']
  ]).
robe(chateau_paret_2012,
  [
     ['.']
  ]).
robe(chateau_menota_2014,
  [
     [grenat, profond,'.']
  ]).
robe(chateau_madiran_vieilles_vignes_2006,
  [
     ['.']
  ]).
robe(chateau_du_moulin_neuf_2014,
  [
     ['.']
  ]).
robe(chateau_milon_la_grave_2012,
  [
     [profonde, '.']
  ]).
robe(chateau_roc_du_binet_2010,
  [
     [profonde, '.']
  ]).
robe(chateau_ruat_2010,
  [
     ['.']
  ]).
robe(chateau_les_polyanthas_2010,
  [
     ['.']
  ]).
robe(chateau_la_menotte_2012,
  [
     [profonde, rouge, velours, '.']
  ]).
robe(la_fleur_de_pomys_2012,
  [
     [profonde, '.']
  ]).
robe(florilege_pauillac_2011,
  [
     [velours, '.']
  ]).
robe(florilege_saint_julien_2010,
  [
     ['.']
  ]).
robe(florilege_pomerol_2012,
  [
     ['.']
  ]).

description(chateau_moulin_de_mallet_2014,
  [
     ['vignoble situ� non loin de Castillon-la-Bataille et des rives de la Dordogne','.'],
     ['joli vin', '.'],
     ['vin classique et polyvalent', '.']
  ]).
description(chateau_la_fleur_baudron_2014,
  [
     ['magnifique terroir � l\'arri�re de Lussac-Saint-Emilion reposant sur des sols graveleux et argilo-calcaires','.'],
     ['un bordeaux tr�s complet', '.']
  ]).
description(chateau_bois_vert_2014,
  [
     ['appellation de la r�gion de Bordeaux','.'],
     ['appr�ci� et r�put� particuli�rement en Belgique pour la souplesse et la qualit� de ses vins','.']
  ]).
description(chateau_paret_2012,
  [
     ['propri�t� situ�e dans l\'excellente zone des coteaux de l\'appellation qui jouxte celle de Saint-Emilion','.'],
     ['beau caract�re et laisse le souvenir d\'un vin tr�s complet', '.']
  ]).
description(chateau_menota_2014,
  [
     ['propri�t� au sud de Pessac-L�ognan en bordure de la Garonne ayant b�n�fici� d\'un bon amoncellement de graves garonnaises','.'],
     ['d�licieux Graves plein d\'�toffe','.']
  ]).
description(madiran_vieilles_vignes_2006,
  [
     ['nous vous le recommandons en accompagnement de pr�parations fortes en go�t','.']
  ]).
description(chateau_du_moulin_neuf_2014,
  [
     ['petite propri�t� de 2,5 Ha au nord de l\'AOC M�doc','.'],
     ['terroir graveleux sur fond argilo-ferrugineux','.'],
     ['belle cuv�e qui t�moigne de la r�ussite des cabernets dans le M�doc en 2014','.'],
     ['un ma�tre achat','.']
  ]).
description(chateau_milon_la_grave_2012,
  [
     ['cette cuv�e compos�e presque exclusivement de merlot s\'inscrit dans un style tr�s velout�','.']
  ]).
description(chateau_roc_du_binet_2010,
  [
     ['un magnifique Montagne-Saint-Emilion dans une grande ann�e','.'],
     ['de pr�sent et d\'avenir', '.']
  ]).
description(chateau_ruat_2010,
  [
     ['sis sur un terroir de fines graves blanches','.'],
     ['similaire � de nombreux �gards aux terroirs de Margaux', '.'],
     ['finale de grande classe, longue et distingu�e', '.'],
     ['splendide t�moin du Haut-M�doc','.']
  ]).
description(chateau_les_polyanthas_2010,
  [
     ['le merlot affectionne tout particuli�rement les sols de sables et de graves de cette petite propri�t� de 4 Ha; il y exprime tout sa rondeur, son opulence','.'],
     ['un Saint-Emilion de grande classe, qui ne pourra que s�duire les amateurs de l\'appellation', '.']
  ]).
description(chateau_la_menotte_2012,
  [
     ['magnifique t�moin de l\'appellation','.']
  ]).
description(la_fleur_de_pomys_2012,
  [
     ['propri�t� du Nord du Haut-M�doc reposant sur un terroir argilo-graveleux � l\'origine de vins plus charpent�s','.']
  ]).
description(florilege_pauillac_2011,
  [
     ['le compagnon id�al des pr�parations de gibier','.']
  ]).
description(florilege_saint_julien_2010,
  [
     ['un remarquable t�moin de l\'appellation Saint-Julien avec une trame tannique remarquablement enrob�e par le gras, la chair du vin','.'],
     ['un grand vin rac� qui associe concentration, puissance et distinction','.']
  ]).
description(florilege_pomerol_2012,
  [
     ['issu de sols riches en argile ferrugineuse qui font la sp�cificit� de l\appellation','.'],
     ['du grand Pomerol qui �voluera encore de nombreuses ann�es', '.']
  ]).


% Rhone et Languedoc %


vignoble(syrah_2015, rhone).
vignoble(cotes_rhones_village_2014, rhone).
vignoble(tautavel_2014, rhone).
vignoble(lirac_2015, rhone).
vignoble(cairanne_2014, rhone).
vignoble(beaumes_venise_2015, rhone).
vignoble(vacqueyras_2014, rhone).
vignoble(saint_joseph_2014, rhone).
vignoble(gigondas_2014, rhone).
vignoble(chateauneuf_du_pape_rouge_2013, rhone).
vignoble(hermitage_rouge_2007, rhone).
vignoble(syrah_2015, languedoc).
vignoble(cotes_rhones_village_2014,languedoc).
vignoble(tautavel_2014,languedoc).
vignoble(lirac_2015,languedoc).
vignoble(cairanne_2014,languedoc).
vignoble(beaumes_venise_2015,languedoc).
vignoble(vacqueyras_2014,languedoc).
vignoble(saint_joseph_2014,languedoc).
vignoble(gigondas_2014,languedoc).
vignoble(chateauneuf_du_pape_rouge_2013,languedoc).
vignoble(hermitage_rouge_2007,languedoc).


nom(syrah_2015,'Syrah 2015 - Vin de pays d\'Oc').
nom(cotes_rhones_village_2014,'C�tes du Rh�nes Villages 2014 "Cuv�e Pierre et Charlotte"').
nom(tautavel_2014, 'Tautavel 2014 - C�tes du Roussillon Villages').
nom(lirac_2015, 'Lirac 2015').
nom(cairanne_2014, 'Cairanne 2014 - C�tes du Rh�ne Villages').
nom(beaumes_venise_2015, 'Beaumes-de-Venise 2015').
nom(vacqueyras_2014, 'Vacqueyras 2014').
nom(saint_joseph_2014, 'Saint-Joseph 2014').
nom(gigondas_2014, 'Gigondas 2014').
nom(chateauneuf_du_pape_rouge_2013, 'Ch�teauneuf-du-Pape rouge 2013').
nom(hermitage_rouge_2007, 'Hermitage rouge 2007').

prix(syrah_2015, 5.14).
prix(cotes_rhones_village_2014, 7.36).
prix(tautavel_2014, 7.37).
prix(lirac_2015, 9.23).
prix(cairanne_2014, 9.98).
prix(beaumes_venise_2015, 12.39).
prix(vacqueyras_2014, 13.92).
prix(saint_joseph_2014, 16.34).
prix(gigondas_2014, 16.77).
prix(chateauneuf_du_pape_rouge_2013, 23.87).
prix(hermitage_rouge_2007, 33.98).

bouche(syrah_2015,
      [
       ['en bouche, il pr�sente un beau caract�re, avec des saveurs de fruits rouges associ�es � des nuances de r�glisses','.']
      ]).
bouche(cotes_rhones_village_2014,
      [
       ['l\'attaque est tout en fruit avec des saveurs fruit�es et �pic�es, la suite est de caract�re, rac�e avec une nuance de r�glisse','.']
       ]).
bouche(tautavel_2014,
      [
       ['la bouche d�voile d\'abord des saveurs de fruits frais et d\'�pices','.'],
       ['elle est remarquablement concentr�e','.'],
       ['finale cacao, � la fois dense, puissante, juteuse et harmonieuse','.']
       ]).
bouche(lirac_2015,
      [
       ['la bouche est � la fois dense et min�rale, avec des saveurs fruit�es et �pic�es (aiguilles de pin, eucalyptus)','.'],
       ['la finale laisse un tr�s agr�able souvenir','.']
       ]).
bouche(cairanne_2014,
      [
       ['la bouche est �quilibr�e avec des tannins soyeux','.'],
       ['finale de caract�re, de belle persistance','.']
       ]).
bouche(beaumes_venise_2015,
      [
       ['cette intensit� se poursuit en bouche avec des saveurs juteuses, rac�es et tr�s �l�gantes','.']
       ]).
bouche(vacqueyras_2014,
      [
       ['les saveurs sont � la fois intenses (fruits surm�ris, guimauve, r�glisse) et juteuses','.'],
       ['la finale laisse le souvenir d\'un cru tr�s plaisant, � la fois dense et velout�','.']
       ]).
bouche(saint_joseph_2014,
      [
       ['remarquable �quilibre gras-fra�cheur-mati�re','.']
       ]).
bouche(gigondas_2014,
      [
       ['la bouche est rac�e, riche en saveur complexes (fruits noirs, �pices)','.']
       ]).
bouche(chateauneuf_du_pape_rouge_2013,
      [
       ['Les saveurs sont intenses, rac�es, riches et complexes','.']
       ]).
bouche(hermitage_rouge_2007,
      [
       ['grande harmonie en bouche, tr�s homog�ne, avec une belle profondeur','.'],
       ['aucune duret�','.']
       ]).


nez(syrah_2015,
      [
       ['nef expressif m�lant les fruits rouges, les agrumes � jolies notes d\'�pices','.']
      ]).
nez(cotes_rhones_village_2014,
      [
       ['bouquet plein de charme, tr�s aromatique','.']
       ]).
nez(tautavel_2014,
      [
       ['bouquet intense de fruits noirs (noyaux) et d\'�pices associ� � des notes de chocolat et de garrigue','.']
       ]).
nez(lirac_2015,
      [
       ['nez parfum�, domin� par les fruits � noyaux et les �pices (cannelle, r�glisse)','.']
       ]).
nez(cairanne_2014,
      [
       ['les ar�mes sont tr�s expressifs, tr�s purs, bien typ�s, �voquant la guimauve, le bois de gen�vrier, le tabac','.']
       ]).
nez(beaumes_venise_2015,
      [
       ['les ar�mes de fraise, de violette, c�toient les nuances de baie de gen�vrier, de sureau et une d�licate touche de fleur d\'oranger','.']
       ]).
nez(vacqueyras_2014,
      [
       ['les saveurs sont � la fois intenses (fruits surm�ris, guimauve, r�glisse) et juteuses','.']
       ]).
nez(saint_joseph_2014,
      [
        ['tr�s aromatique, avec beaucoup de fruit (pamplemousse), des notes d\'�pices (poivre) et une nuance empyreumatique (bois br�l�)','.']
       ]).
nez(gigondas_2014,
      [
       ['le nez riche et concentr�, annonce un vin tr�s �l�gant, avec un fond remarquable','.']
       ]).
nez(chateauneuf_du_pape_rouge_2013,
      [
       ['le nez est complexe, expressif et suave, associant ar�mes de fruits rouges, de cannelle et d\'�pices (poivre, r�glisse)','.'],
       ['les saveurs sont intenses, rac�es, riches et complexes','.']
       ]).
nez(hermitage_rouge_2007,
      [
       ['Nez au bouquet complexe, tr�s profond, associant les fruits noirs, les agrumes � des notes de vanille, de tabac et de r�glisse','.']
       ]).


robe(syrah_2015,
      [
       ['belle robe rouge profond','.']
      ]).
robe(cotes_rhones_village_2014,
      [
       ['','.']
       ]).
robe(tautavel_2014,
      [
       ['robe noire','.']
       ]).
robe(lirac_2015,
      [
       ['robe grenat profond','.']
       ]).
robe(cairanne_2014,
      [
       ['couleur cerise du Nord','.']
       ]).
robe(beaumes_venise_2015,
      [
       ['','.']
       ]).
robe(vacqueyras_2014,
      [
       ['','.']
       ]).
robe(saint_joseph_2014,
      [
       ['','.']
       ]).
robe(gigondas_2014,
      [
       ['','.']
       ]).
robe(chateauneuf_du_pape_rouge_2013,
      [
       ['','.']
       ]).
robe(hermitage_rouge_2007,
      [
       ['','.']
       ]).


description(syrah_2015,
      [
       ['un �levage sous bois de 12 mois a permis aux tannins de se fondre et ainsi de laisser en finale le souvenir d\'un vin tr�s harmonieux','.']
      ]).
description(cotes_rhones_village_2014,
      [
       ['magnifique terroir argilo-limoneux � proximit� de l\'Aygues','.']
       ]).
description(tautavel_2014,
      [
       ['','.']
       ]).
description(lirac_2015,
      [
       ['','.']
       ]).
description(cairanne_2014,
      [
       ['magnifique terroir � c�t� de Rasteau, en altitude','.']
       ]).
description(beaumes_venise_2015,
      [
       ['vignoble situ� au sud-est des Dentelles de Montmirail','.']
       ]).
description(vacqueyras_2014,
      [
       ['les sols caillouteux de Vacqueyras sont � l\'origine de vins chaleureux, fruits et �pic�s','.']
       ]).
description(saint_joseph_2014,
      [
       ['vin "typ�" syrah de Nord, tr�s aromatique','.'],
       ['Remarquable �quilibre gras-fra�cheur-mati�re','.']
       ]).
description(gigondas_2014,
      [
       ['superbe vignoble escarp� situ� au pied des Dentelles de Montmirail','.'],
       ['le terroir est caillouteux et particuli�rement adapt� � la culture du c�page grenache noir (pr�sent � 80%)','.']
       ]).
description(chateauneuf_du_pape_rouge_2013,
      [
       ['vignes reposant sur des terrasses du Quaternaire constitu�e d\'une �paisse couche de galets roul�s, � l\'origine de vins puissants et charnus','.']
       ]).
description(hermitage_rouge_2007,
      [
       ['vin de grande allure, rac�, qui s\'�panouit superbement','.']
       ]).


% Mots-cl�s %

mclef(vignoble,10).
mclef(millesime,10).
mclef(bouche,10).
mclef(nez,10).
mclef(robe,5).
mclef(prix,10).
mclef(vin,5).
mclef(vins,5).


% ----------------------------------------------------------------%

regle_rep(bouche,1,
  [ que, donne, le, Vin, en, bouche ],
  Rep ) :-
     write('regle1'),
     bouche(Vin,Rep).

% ----------------------------------------------------------------%

regle_rep(vins,2,
  [ auriezvous, des, vins, entre, X, et, Y, eur ],
  Rep) :-

     lvins_prix_min_max(X,Y,Lvins),
     rep_lvins_min_max(Lvins,Rep).

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
my_char_type(X,alphanumeric) :- X >= 65, X =< 90, !.
my_char_type(X,alphanumeric) :- X >= 97, X =< 123, !.
my_char_type(X,alphanumeric) :- X >= 48, X =< 57, !.
my_char_type(X,whitespace) :- X =< 32, !.
my_char_type(X,punctuation) :- X >= 33, X =< 47, !.
my_char_type(X,punctuation) :- X >= 58, X =< 64, !.
my_char_type(X,punctuation) :- X >= 91, X =< 96, !.
my_char_type(X,punctuation) :- X >= 123, X =< 126, !.
my_char_type(_,special).


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
	lower_case(FirstChar,LChar),
	read_lc_string_aux(LChar,String).

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

   nl, nl, nl,
   write('Bonjour, je suis Grandgousier, GGS pour les intimes,'), nl,
   write('conseiller en vin. En quoi puis-je vous etre utile ?'),
   nl, nl,

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











