nom(les_guignards_2015,'Les Guignards 2015').
nom(chardonnay_exception_2016,'Chardonnay Exception 2016').
nom(cote_rhone_2016,'C�tes du Rh�ne 2016 "Cuv�e Pierre et Charlotte"').
nom(le_druc_2015,'Ch. Le Druc 2015 - Graves').
nom(laudun_2016,'Laudun 2016 - C�tes du Rh�ne Villages').
nom(vouvray_blanc_sec_2016,'Vouvray blanc sec 2016').
nom(macon_villages_2015,'M�con-Villages 2015').
nom(pinot_gris_2015,'Pinot Gris 2015').
nom(gewurztraminer_2015,'Gewurztraminer 2015').
nom(vire_clesse_2016,'Vir�-Cless� 2016').
nom(sancerre_blanc_2015,'Sancerre blanc 2015 - Vignoble de Verdigny').
nom(vacqueyras_2016,'Vacqueyras 2016').
nom(hautes_cotes_de_beaune_2015,'Hautes C�tes de Beaune 2015').
nom(pouilly_fuisse_2014,'Pouilly-Fuiss� 2014').
nom(chablis_1_cru_montmains_2014,'Chablis 1er Cru "Montmains" 2014').
nom(condrieu_2015,'Condrieu 2015').


conseil(les_guignards_2015,oui).
conseil(chardonnay_exception_2016,oui).
conseil(cote_rhone_2016,non).
conseil(le_druc_2015,non).
conseil(laudun_2016,non).
conseil(vouvray_blanc_sec_2016,non).
conseil(macon_villages_2015,non).
conseil(pinot_gris_2015,non).
conseil(gewurztraminer_2015,non).
conseil(vire_clesse_2016,non).
conseil(sancerre_blanc_2015,non).
conseil(vacqueyras_2016,non).
conseil(hautes_cotes_de_beaune_2015,non).
conseil(pouilly_fuisse_2014,non).
conseil(chablis_1_cru_montmains_2014,non).
conseil(condrieu_2015,non).

accompagnement(les_guignards_2015,[poisson]).
accompagnement(chardonnay_exception_2016,[canard]).
accompagnement(cote_rhone_2016,[oie]).
accompagnement(le_druc_2015,[veau]).
accompagnement(laudun_2016,[boeuf]).
accompagnement(vouvray_blanc_sec_2016,[lapin]).
accompagnement(macon_villages_2015,[porc]).
accompagnement(pinot_gris_2015,[mouton]).
accompagnement(gewurztraminer_2015,[agneau]).
accompagnement(vire_clesse_2016,[crustac�s]).
accompagnement(sancerre_blanc_2015,[langouste]).
accompagnement(vacqueyras_2016,[fromages]).
accompagnement(hautes_cotes_de_beaune_2015,[veau]).
accompagnement(pouilly_fuisse_2014,[lapin]).
accompagnement(chablis_1_cru_montmains_2014,[faisan]).
accompagnement(condrieu_2015,[sanglier, biche]).

vignoble(les_guignards_2015,blanc).
vignoble(chardonnay_exception_2016,blanc).
vignoble(cote_rhone_2016,blanc).
vignoble(le_druc_2015,blanc).
vignoble(laudun_2016,blanc).
vignoble(vouvray_blanc_sec_2016,blanc).
vignoble(macon_villages_2015,blanc).
vignoble(pinot_gris_2015,blanc).
vignoble(gewurztraminer_2015,blanc).
vignoble(vire_clesse_2016,blanc).
vignoble(sancerre_blanc_2015,blanc).
vignoble(vacqueyras_2016,blanc).
vignoble(hautes_cotes_de_beaune_2015,blanc).
vignoble(pouilly_fuisse_2014,blanc).
vignoble(chablis_1_cru_montmains_2014,blanc).
vignoble(condrieu_2015,blanc).

prix(les_guignards_2015,5.30).
prix(chardonnay_exception_2016,6.47).
prix(cote_rhone_2016,7.02).
prix(le_druc_2015,7.62).
prix(laudun_2016,8.83).
prix(vouvray_blanc_sec_2016,10.10).
prix(macon_villages_2015,10.59).
prix(pinot_gris_2015,10.59).
prix(gewurztraminer_2015,12.28).
prix(vire_clesse_2016,12.77).
prix(sancerre_blanc_2015,16.01).
prix(vacqueyras_2016,16.37).
prix(hautes_cotes_de_beaune_2015,16.58).
prix(pouilly_fuisse_2014,18.67).
prix(chablis_1_cru_montmains_2014,21.13).
prix(condrieu_2015,32.07).


bouche(les_guignards_2015,
  [
     ['C\'est un vin expressif, bien �quilibr�, harmonieux, qui allie la fra�cheur du sauvignon � la tendresse de la muscadelle','.']
  ]).
bouche(chardonnay_exception_2016,
  [
     ['Le nez se prolonge en bouche avec beaucoup d\'�pices, de caract�r et de volume','.'],
     ['Un vin relativement puissant, et une finale en rondeur, un excellent souvenir', '.'],
     ['Note bois�e tout au long de la d�gustation', '.']
  ]).
bouche(cote_rhone_2016,
  [
     ['La bouche est riche et ronde, avec des saveurs fruit�es, bien m�res, associ�es � une subtile touche bois�e bien int�gr�e','.']
  ]).
bouche(le_druc,
  [
     ['L\'attaque est juteuse, g�n�reuse, la suite allie gras et fra�cheur, avec une belle intensit�','.']
  ]).
bouche(laudun_2016,
  [
     ['L\'intensit� aromatique se prolonge en bouche avec des saveurs � la fois denses, rac�es et complexes','.']
  ]).
bouche(vouvray_blanc_sec_2016,
  [
     ['L\'attaque est g�n�reuse, la suite plus min�rale d�voile toute la race de ce cru','.']
  ]).
bouche(macon_villages_2015,
  [
     ['On est sous le charme des fruits (pomme, coing,...), des notes de beurre et de miel','.']
  ]).
bouche(pinot_gris_2015,
  [
     ['La bouche est fruit�e, riche et �l�gante','.']
  ]).
bouche(gewurztraminer_2015,
  [
     ['La bouche se montre g�n�reuses d�s l\'attaque, la suite en �quilibre est tr�s harmonieuse','.']
  ]).
bouche(vire_clesse_2016,
  [
     ['La sensation d\'intensit� aromaitque (pomme, coing, p�che, miel), se poursuit en bouche, avec des saveurs fruit�es, min�rales, florales, riches et expressives','.'],
     ['L\'ensemble marie merveilleusement une texture ronde et onctueuse � une belle fra�cheur', '.']
  ]).
bouche(sancerre_blanc_2015,
  [
     ['Belle expression en bouche, mariant min�ralit� et fruit, avec une belle fra�cheur','.']
  ]).
bouche(vacqueyras_2016,
  [
     ['Magnifique sensation de pl�nitude avc volume, densit� et longueur','.']
  ]).
bouche(hautes_cotes_de_beaune_2015,
  [
     ['La bouche est intense, et g�n�reuse : elle d�veloppe une sensation riche et beurr�e','.'],
      ['Bois� bien int�gr� tout au long de la d�gustation', '.']
  ]).
bouche(pouilly_fuisse_2014,
  [
     ['La bouche est min�rale, assez puissante avec du fruit, du gras et en finale une agr�able touche bois�e','.']
  ]).
bouche(chablis_1_cru_montmains_2014,
  [
     ['En bouche, les saveurs sont complexes, avec beaucoup de race, de min�ralit� et ces notes salines et iod�es tout � fait caract�ristiques de l\'appelation','.'],
     ['Grande longueur', '.']
  ]).
bouche(condrieu_2015,
  [
     ['La bouche allie volume et �quilibre.','.']
  ]).



nez(les_guignards_2015,
  [
     ['Nez charmeur, � la fois frais et expressif, �voquant des ar�mes de cassis et de fruits du verger','.'],
     ['Nuance d\'agrumes et de rose', '.']
  ]).
nez(chardonnay_exception_2016,
  [
     ['Nez intense et expressif aux ar�mes de fruits du verger, avec une touche bois�e','.']
  ]).
nez(cote_rhone_2016,
  [
     ['Nez g�n�reusement parfum�','.'],
     ['L\abricot et la p�che blanche dominent avec des nuances de fruits secs et d\'�pices', '.']
  ]).
nez(le_druc,
  [
     ['Beau nez expressif, abricot, agrumes m�rs, avec de belles nuances florales qui accompagnent une touche empyreumatique (grill�e)','.']
  ]).
nez(laudun_2016,
  [
     ['Magnifique nez intense de fruits du verger (p�che, mirabelle) associ�s � des nuances d\'�pices et une note citronn�e','.']
  ]).
nez(vouvray_blanc_sec_2016,
  [
     ['D�s la mise au nez, on retrouve toute la typicit� du c�page chenin avec des ar�mes de tilleul associ�s � des nuances de rose','.']
  ]).
nez(macon_villages_2015,
  [
     ['On est sous le charme des fruits (pomme, coing...), des notes de beurre et de miel','.']
  ]).
nez(pinot_gris_2015,
  [
     ['Nez parfum� de fruits frais (fruits � chair blanche et exotiques, litchis)','.']
  ]).
nez(gewurztraminer_2015,
  [
     ['On y retrouve avec intensit� les fruits � chair blanche et exotiques (litchis), les nuances de fleurs (roses, lilas), et d\'�pices','.']
  ]).
nez(vire_clesse_2016,
  [
     ['Sensation d\'intensit� aromatique (pomme, coing, p�che, miel)','.']
  ]).
nez(sancerre_blanc_2015,
  [
     ['Superbe nez rac�, min�ral aux ar�mes de fruits m�rs, de cassis, d\'�glantier, de buis','.']
  ]).
nez(vacqueyras_2016,
  [
     ['Belle intensit� aromatique avec des notes d\'abricot, de p�che blance, de raisin frais et de poire associ�es � des nuances d\'�pices (pain grill�, thym) et min�rales','.']
  ]).
nez(hautes_cotes_de_beaune_2015,
  [
     ['Nez intens�ment parfum� aux ar�mes de fleurs blances, de fruits du verger associ�s � des nuances de fruits secs (noisettes)','.']
  ]).
nez(pouilly_fuisse_2014,
  [
     ['Nez min�ral, �l�gant, rac� et complexe avec de jolies nots de fruits du verger (coing, pomme) associ�s � des nuances de noisette grill�e et de beurre','.']
  ]).
nez(chablis_1_cru_montmains_2014,
  [
     ['Nez intense d\'ar�mes de fruits du verger, associ�s � des nuances iod�es et noiset�es','.']
  ]).
nez(condrieu_2015,
  [
     ['Belle intensit� aromatique � la fois riche et complexe','.'],
     ['Avec des ar�mes d\'abricot, de p�che, et une intensit� �pic�e remarquable', '.']
  ]).



description(les_guignards_2015,
  [
     ['Appellation voisine de la r�gion de Bordeaux','.'],
     ['Tr�s polyvalent','.'],
     ['D�licieux','.']
  ]).
description(chardonnay_exception_2016,
  [
     ['Un vin relativement puissant, et une finale en rondeur, laissant un excellent souvenir','.']
  ]).
description(cote_rhone_2016,
  [
     ['Originaire du Nord du Vaucluse, non loin de Vinsobres','.'],
     ['L\'ensemble est rac�, souple et �quilibr�', '.'],
     ['Frais et gourmand', '.'],
     ['Un ma�tre-achat', '.']
  ]).
description(le_druc,
  [
     ['Excellent rapport qualit�-prix','.']
  ]).
description(laudun_2016,
  [
     ['Rh�ne m�ridional, non loin de Ch�teauneuf-du-Pape sur la rive oppos�e du Rh�ne','.'],
      ['Une magnifique d�couverte !', '.']
  ]).
description(vouvray_blanc_sec_2016,
  [
     ['','.']
  ]).
description(macon_villages_2015,
  [
     ['Magnifique expresion du c�page chardonnay sur un terroir de Bourgogne','.'],
     ['Un Bourgogne blanc, comme on les aime !', '.'],
     ['D�licieux !', '.']
  ]).
description(pinot_gris_2015,
  [
     ['Un Pinot Gris plein de charme � la finale juteuse','.'],
     ['D�licieux !', '.']
  ]).
description(gewurztraminer_2015,
  [
     ['Originaire du Sud de l\'Alsace, au pied des collines du Bollenberg','.']
  ]).
description(vire_clesse_2016,
  [
     ['Chardonnay 100% de la r�gion de M�con (Sud de la Bourgogne)','.'],
     ['Un style proche des c�l�bres crus du M�connais, avec beaucoup de race, de complexit� et de concentration', '.']
  ]).
description(sancerre_blanc_2015,
  [
     ['Toute l\'expression du c�page sauvignon sur le terroir calcaire du vignoble de Verdigny','.'],
     ['Un grand classique', '.']
  ]).
description(vacqueyras_2016,
  [
     ['Une raret� (seulement 1% de la production de Vacqueyras)','.'],
     ['Tout simplement d�licieux', '.']
  ]).
description(hautes_cotes_de_beaune_2015,
  [
     ['Sur les hauteurs de la C�te-de-Beaune, � l\'arri�re de Saint-Romain','.'],
     ['Magnifique Bourgogne gastronomique, dans un excellent rapport plaisir/prix', '.']
  ]).
description(pouilly_fuisse_2014,
  [
     ['Un grand classique !','.']
  ]).
description(chablis_1_cru_montmains_2014,
  [
     ['Le chardonnay s\'exprime avec verve et �l�gance sur ce terroir de 1er Cru','.'],
     ['Un Chablis 1er Cru tr�s rac�, pour les amateurs de l\'AOC', '.']
  ]).
description(condrieu_2015,
  [
     ['Parmi les plus grands vins blancs de France','.'],
     ['Cette cuv�e est issue d\'une petite propri�t� de 1,8 Ha � l\exposition parfaite et au terroir d\'exception', '.'],
     ['Superbe', '.']
  ]).














