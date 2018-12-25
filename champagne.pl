nom(creman_loire_brut, 'Créman de Loire Brut').
nom(brut_reserve, 'Champagne Brut Réserve').
nom(extra_brut, 'Champagne Extra Brut').
nom(brut_oeil_perdrix, 'Champagne Brut Oeil de Perdrix').
nom(brut_rose_saignee, 'Champagne Brut Rosé de Saignée').
nom(brut_or_blanc, 'Champagne Brut Or Blanc').
nom(brut_prestige, 'Champagne Brut Prestige').

conseil(creman_loire_brut, oui).
conseil(brut_reserve, oui).
conseil(extra_brut, non).
conseil(brut_oeil_perdrix, non).
conseil(brut_rose_saignee, non).
conseil(brut_or_blanc, non).
conseil(brut_prestige, non).

accompagnement(creman_loire_brut, [canard, poulet]).
accompagnement(brut_reserve, [poisson, boeuf]).
accompagnement(extra_brut, [cavier, poisson]).
accompagnement(brut_oeil_perdrix, [grenouille]).
accompagnement(brut_rose_saignee, [canard, boeuf]).
accompagnement(brut_or_blanc, [pigeon]).
accompagnement(brut_prestige, [poisson, dinde, homard]).


vignoble(creman_loire_brut,champagne).
vignoble(brut_reserve,champagne).
vignoble(extra_brut,champagne).
vignoble(brut_oeil_perdrix,champagne).
vignoble(brut_rose_saignee,champagne).
vignoble(brut_or_blanc,champagne).
vignoble(brut_prestige,champagne).

prix(creman_loire_brut, 10.95).
prix(brut_reserve, 23.14).
prix(extra_brut, 24.27).
prix(brut_oeil_perdrix, 24.47).
prix(brut_rose_saignee, 25.23).
prix(brut_or_blanc, 25.64).
prix(brut_prestige, 29.22).


bouche(creman_loire_brut,
  [
     ['finesse et élégance en bouche, avec beaucoup de rondeur', '.']
  ]).
bouche(brut_reserve,
  [
     ['','.']
  ]).
bouche(extra_brut,
  [
     [amer,vert,'.']
  ]).
bouche(brut_oeil_perdrix,
  [
     ['grande intensité aromatique','.']
  ]).
bouche(brut_rose_saignee,
  [
     ['','.']
  ]).
bouche(brut_or_blanc,
  [
     ['bel équilibre fraîcheur-onctuosité','.']
  ]).
bouche(brut_prestige,
  [
     ['sa bouche mêle arômes de fruits secs et note miellée','.']
  ]).


nez(creman_loire_brut,
  [
     ['associe au nez la rondeur du chardonnay au caractère floral du chenin','.']
  ]).
nez(brut_reserve,
  [
     ['.']
  ]).
nez(extra_brut,
  [
     ['','.']
  ]).
nez(brut_oeil_perdrix,
  [
     ['','.']
  ]).
nez(brut_rose_saignee,
  [
     ['','.']
  ]).
nez(brut_or_blanc,
  [
     ['','.']
  ]).
nez(brut_prestige,
  [
     ['son nez est très complexe, puissant, bien évolué','.']
  ]).


description(creman_loire_brut,
  [
     ['vendanges manuelles', '.'],
     ['cépages chenin et chardonnay', '.'],
     ['méthode tradionnelle', '.'],
     ['très digeste', '.']
  ]).
description(brut_reserve,
  [
     ['cuvée de tradition, harmonieuse, souple et délicate à toute heure', '.']
  ]).
description(extra_brut,
  [
     ['la vérité, la finesse et l\'élégance à l\'état pur','.']
  ]).
description(brut_oeil_perdrix,
  [
     ['superbe "Blanc de Noirs" (100% pinot noir), avec la particularité d\'être issu de raisins surmaturés qui, pressurés, donnent cette exceptionnelle teinte ambrée, entre le blanc et le rosé','.']
  ]).
description(brut_rose_saignee,
  [
     ['on le dit croquant, craquant, gourmand et délicat','.'],
     ['grande harmonie'], '.'
  ]).
description(brut_or_blanc,
  [
     ['un champagne pour toutes les occasions','.']
  ]).
description(brut_prestige,
  [
     ['cette cuvée 100% Grand Cru Bouzy est remarquable pour sa finesse et sa puissance','.']
  ]).



























