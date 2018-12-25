nom(trois_etoiles, 'Cognac Trois Etoiles').
nom(fine_champagne, 'Cognac "Fine Champagne"').
nom(grande_champagne, 'Cognac "Grande Champagne"').

conseil(trois_etoiles, non).
conseil(fine_champagne, oui).
conseil(grande_champagne, non).

accompagnement(trois_etoiles, []).
accompagnement(fine_champagne, []).
accompagnement(grande_champagne, []).


vignoble(trois_etoiles,cognac).
vignoble(fine_champagne,cognac).
vignoble(grande_champagne,cognac).

prix(trois_etoiles, 20.87).
prix(fine_champagne, 22.26).
prix(grande_champagne, 32.28).

bouche(trois_etoiles,
  [
     ['le style est soyeux, avec un très beau fruit, et des notes d\'épices et d\'écorce d\'orange', '.']
  ]).
bouche(fine_champagne,
  [
     ['la puissance et la personnalité sont au rendez-vous, avec en plus de la finesse','.']
  ]).
bouche(grande_champagne,
  [
     ['la bouche est ample, avec des nuances de fruits confits, de pain d\'épices et une grande persistance','.']
  ]).


nez(trois_etoiles,
  [
     ['.']
  ]).
nez(fine_champagne,
  [
     ['.']
  ]).
nez(grande_champagne,
  [
     ['le nez est intense, complexe, et témoigne d\'une rare finesse','.']
  ]).

description(trois_etoiles,
  [
     ['', '.']
  ]).
description(fine_champagne,
  [
     ['', '.']
  ]).
description(grande_champagne,
  [
     ['','.']
  ]).








