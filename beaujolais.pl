nom(chriroubles_2013,'Chriroubles 2013').
nom(fleurie_2015,'Fleurie 2015').
nom(moulin_a_vent_2014,'Moulin-à-Vent 2014').

vignoble(chriroubles_2013,beaujolais).
vignoble(fleurie_2015,beaujolais).
vignoble(moulin_a_vent_2014,beaujolais).

prix(chriroubles_2013,8.41).
prix(fleurie_2015,11).
prix(moulin_a_vent_2014,11.4).

millesime(chriroubles_2013,2013).
millesime(fleurie_2015,2015).
millesime(moulin_a_vent_2014,2014).

bouche(chriroubles_2013,
  [
     ['sensation fruitée','.'],
	 ['nuance florale et minérale','.']
  ]).
bouche(fleurie_2015,
  [
     ['texture velours','.'],
	 ['générosité du fruit, des épices et nuances florales','.']	 
  ]).
bouche(moulin_a_vent_2014,
  [
     ['on retrouve de la complexité avec une jolie structure enrobée par le gras du vin','.']
  ]).

  

nez(chriroubles_2013,
  [
     ['tendrement parfumé','.'],
	 ['dominé par les fruits rouges (groseilles, fraises) et les épices','.']
  ]).
nez(fleurie_2015,
  [
     ['générosité du fruit, des épices et nuances florales','.']
  ]).
nez(moulin_a_vent_2014,
  [
     ['expressif, dominé par les fruits sauvages, la griotte et le sous-bois associés à une nuance de cire','.']
  ]).
  
  
  
robe(chriroubles_2013,
  [
     ['','.']
  ]).
robe(fleurie_2015,
  [
     ['colorée','.']
  ]).
robe(moulin_a_vent_2014,
  [
     ['grenat, aux effets rubis','.']
  ]).
  
  
description(chriroubles_2013,
  [
     ['terroir granitique et schisteux d\'origine volcanique','.'],
	 ['c\est dans cette région que le gamay donne le meilleur de lui-meme','.'],
	 ['beau souvenir d\'un vin tendre et expressif, au fruité harmonieux','.']
  ]).
description(fleurie_2015,
  [
     ['fleurie est la reine des Crus du Beaujolais','.'],
	 ['l\'harmonie règne','.'],
	 ['le souvenir est délicieux','.'],
	 ['coup de coeur','.'],
	 ['grand millésime!','.']
  ]).
description(moulin_a_vent_2014,
  [
     ['ce type de terroir est à l\'origine de gamay vineux, très concentrés','.'],
	 ['la finale, riche et harmonieuse, laisse un excellent souvenir','.']
  ]).