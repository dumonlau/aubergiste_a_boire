nom(les_guignards_2015,'Les Guignards 2015').
nom(chardonnay_exception_2016,'Chardonnay Exception 2016').
nom(cote_rhone_2016,'Côtes du Rhône 2016 "Cuvée Pierre et Charlotte"').
nom(le_druc_2015,'Ch. Le Druc 2015 - Graves').
nom(laudun_2016,'laudun 2016 - Côtes du Rhône Villages').
nom(vouvray_blanc_sec_2016,'Vouvray blanc sec 2016').
nom(macon_villages_2015,'Mâcon-Villages 2015').
nom(pinot_gris_2015,'Pinot Gris 2015').
nom(gewurztraminer_2015,'Gewurztraminer 2015').
nom(vire_clesse_2016,'Viré-Clessé 2016').
nom(sancerre_blanc_2015,'Sancerre blanc 2015 - Vignoble de Verdigny').
nom(vacqueyras_2016,'Vacqueyras 2016').
nom(hautes_cotes_de_beaune_2015,'Hautes Côtes de Beaune 2015').
nom(pouilly_fuisse_2014,'Pouilly-Fuissé 2014').
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
accompagnement(vire_clesse_2016,[crustacés]).
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
     ['c\'est un vin expressif, bien équilibré, harmonieux, qui allie la fraîcheur du sauvignon à la tendresse de la muscadelle','.']
  ]).
bouche(chardonnay_exception_2016,
  [
     ['le nez se prolonge en bouche avec beaucoup d\'épices, de caractèr et de volume','.'],
     ['un vin relativement puissant, et une finale en rondeur, un excellent souvenir', '.'],
     ['note boisée tout au long de la dégustation', '.']
  ]).
bouche(cote_rhone_2016,
  [
     ['la bouche est riche et ronde, avec des saveurs fruitées, bien mûres, associées à une subtile touche boisée bien intégrée','.']
  ]).
bouche(le_druc,
  [
     ['l\'attaque est juteuse, généreuse, la suite allie gras et fraîcheur, avec une belle intensité','.']
  ]).
bouche(laudun_2016,
  [
     ['l\'intensité aromatique se prolonge en bouche avec des saveurs à la fois denses, racées et complexes','.']
  ]).
bouche(vouvray_blanc_sec_2016,
  [
     ['l\'attaque est généreuse, la suite plus minérale dévoile toute la race de ce cru','.']
  ]).
bouche(macon_villages_2015,
  [
     ['on est sous le charme des fruits (pomme, coing,...), des notes de beurre et de miel','.']
  ]).
bouche(pinot_gris_2015,
  [
     ['la bouche est fruitée, riche et élégante','.']
  ]).
bouche(gewurztraminer_2015,
  [
     ['la bouche se montre généreuses dès l\'attaque, la suite en équilibre est très harmonieuse','.']
  ]).
bouche(vire_clesse_2016,
  [
     ['la sensation d\'intensité aromaitque (pomme, coing, pêche, miel), se poursuit en bouche, avec des saveurs fruitées, minérales, florales, riches et expressives','.'],
     ['l\'ensemble marie merveilleusement une texture ronde et onctueuse à une belle fraîcheur', '.']
  ]).
bouche(sancerre_blanc_2015,
  [
     ['belle expression en bouche, mariant minéralité et fruit, avec une belle fraîcheur','.']
  ]).
bouche(vacqueyras_2016,
  [
     ['magnifique sensation de plénitude avc volume, densité et longueur','.']
  ]).
bouche(hautes_cotes_de_beaune_2015,
  [
     ['la bouche est intense, et généreuse : elle développe une sensation riche et beurrée','.'],
      ['Boisé bien intégré tout au long de la dégustation', '.']
  ]).
bouche(pouilly_fuisse_2014,
  [
     ['la bouche est minérale, assez puissante avec du fruit, du gras et en finale une agréable touche boisée','.']
  ]).
bouche(chablis_1_cru_montmains_2014,
  [
     ['en bouche, les saveurs sont complexes, avec beaucoup de race, de minéralité et ces notes salines et iodées tout à fait caractéristiques de l\'appelation','.'],
     ['grande longueur', '.']
  ]).
bouche(condrieu_2015,
  [
     ['la bouche allie volume et équilibre.','.']
  ]).



nez(les_guignards_2015,
  [
     ['nez charmeur, à la fois frais et expressif, évoquant des arômes de cassis et de fruits du verger','.'],
     ['nuance d\'agrumes et de rose', '.']
  ]).
nez(chardonnay_exception_2016,
  [
     ['nez intense et expressif aux arômes de fruits du verger, avec une touche boisée','.']
  ]).
nez(cote_rhone_2016,
  [
     ['nez généreusement parfumé','.'],
     ['l\abricot et la pêche blanche dominent avec des nuances de fruits secs et d\'épices', '.']
  ]).
nez(le_druc,
  [
     ['beau nez expressif, abricot, agrumes mûrs, avec de belles nuances florales qui accompagnent une touche empyreumatique (grillée)','.']
  ]).
nez(laudun_2016,
  [
     ['magnifique nez intense de fruits du verger (pêche, mirabelle) associés à des nuances d\'épices et une note citronnée','.']
  ]).
nez(vouvray_blanc_sec_2016,
  [
     ['dès la mise au nez, on retrouve toute la typicité du cépage chenin avec des arômes de tilleul associés à des nuances de rose','.']
  ]).
nez(macon_villages_2015,
  [
     ['on est sous le charme des fruits (pomme, coing...), des notes de beurre et de miel','.']
  ]).
nez(pinot_gris_2015,
  [
     ['nez parfumé de fruits frais (fruits à chair blanche et exotiques, litchis)','.']
  ]).
nez(gewurztraminer_2015,
  [
     ['on y retrouve avec intensité les fruits à chair blanche et exotiques (litchis), les nuances de fleurs (roses, lilas), et d\'épices','.']
  ]).
nez(vire_clesse_2016,
  [
     ['sensation d\'intensité aromatique (pomme, coing, pêche, miel)','.']
  ]).
nez(sancerre_blanc_2015,
  [
     ['superbe nez racé, minéral aux arômes de fruits mûrs, de cassis, d\'églantier, de buis','.']
  ]).
nez(vacqueyras_2016,
  [
     ['belle intensité aromatique avec des notes d\'abricot, de pêche blance, de raisin frais et de poire associées à des nuances d\'épices (pain grillé, thym) et minérales','.']
  ]).
nez(hautes_cotes_de_beaune_2015,
  [
     ['nez intensément parfumé aux arômes de fleurs blances, de fruits du verger associés à des nuances de fruits secs (noisettes)','.']
  ]).
nez(pouilly_fuisse_2014,
  [
     ['nez minéral, élégant, racé et complexe avec de jolies nots de fruits du verger (coing, pomme) associés à des nuances de noisette grillée et de beurre','.']
  ]).
nez(chablis_1_cru_montmains_2014,
  [
     ['nez intense d\'arômes de fruits du verger, associés à des nuances iodées et noisetées','.']
  ]).
nez(condrieu_2015,
  [
     ['belle intensité aromatique à la fois riche et complexe','.'],
     ['avec des arômes d\'abricot, de pêche, et une intensité épicée remarquable', '.']
  ]).



description(les_guignards_2015,
  [
     ['appellation voisine de la région de Bordeaux','.'],
     ['très polyvalent','.'],
     ['délicieux','.']
  ]).
description(chardonnay_exception_2016,
  [
     ['un vin relativement puissant, et une finale en rondeur, laissant un excellent souvenir','.']
  ]).
description(cote_rhone_2016,
  [
     ['originaire du Nord du Vaucluse, non loin de Vinsobres','.'],
     ['l\'ensemble est racé, souple et équilibré', '.'],
     ['frais et gourmand', '.'],
     ['un maître-achat', '.']
  ]).
description(le_druc,
  [
     ['excellent rapport qualité-prix','.']
  ]).
description(laudun_2016,
  [
     ['rhône méridional, non loin de Châteauneuf-du-Pape sur la rive opposée du Rhône','.'],
      ['une magnifique découverte !', '.']
  ]).
description(vouvray_blanc_sec_2016,
  [
     ['','.']
  ]).
description(macon_villages_2015,
  [
     ['magnifique expresion du cépage chardonnay sur un terroir de Bourgogne','.'],
     ['un Bourgogne blanc, comme on les aime !', '.'],
     ['délicieux !', '.']
  ]).
description(pinot_gris_2015,
  [
     ['un Pinot Gris plein de charme à la finale juteuse','.'],
     ['délicieux !', '.']
  ]).
description(gewurztraminer_2015,
  [
     ['originaire du Sud de l\'Alsace, au pied des collines du Bollenberg','.']
  ]).
description(vire_clesse_2016,
  [
     ['chardonnay 100% de la région de Mâcon (Sud de la Bourgogne)','.'],
     ['un style proche des célèbres crus du Mâconnais, avec beaucoup de race, de complexité et de concentration', '.']
  ]).
description(sancerre_blanc_2015,
  [
     ['toute l\'expression du cépage sauvignon sur le terroir calcaire du vignoble de Verdigny','.'],
     ['un grand classique', '.']
  ]).
description(vacqueyras_2016,
  [
     ['une rareté (seulement 1% de la production de Vacqueyras)','.'],
     ['tout simplement délicieux', '.']
  ]).
description(hautes_cotes_de_beaune_2015,
  [
     ['sur les hauteurs de la Côte-de-Beaune, à l\'arrière de Saint-Romain','.'],
     ['magnifique Bourgogne gastronomique, dans un excellent rapport plaisir/prix', '.']
  ]).
description(pouilly_fuisse_2014,
  [
     ['un grand classique !','.']
  ]).
description(chablis_1_cru_montmains_2014,
  [
     ['le chardonnay s\'exprime avec verve et élégance sur ce terroir de 1er Cru','.'],
     ['un Chablis 1er Cru très racé, pour les amateurs de l\'AOC', '.']
  ]).
description(condrieu_2015,
  [
     ['carmi les plus grands vins blancs de France','.'],
     ['cette cuvée est issue d\'une petite propriété de 1,8 Ha à l\exposition parfaite et au terroir d\'exception', '.'],
     ['superbe', '.']
  ]).














