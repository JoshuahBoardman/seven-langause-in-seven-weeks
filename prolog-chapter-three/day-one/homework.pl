author(the_blade_itself, joe_abercrombie).
author(before_they_are_hanged, joe_abercrombie).
author(a_little_hatred, joe_abercrombie).

author(way_of_kings, brandon_sanderson).
author(mist_born, brandon_sanderson).
author(the_emperors_soul, brandon_sanderson).

author(gardens_of_the_moon, steven_erikson).


instrument(celeina_ann, guitar).
instrument(faraz_anwar, guitar).
instrument(gem_archer, guitar).
 
instrument(burt_bacharach, keyboard).
instrument(michelle_branch, keyboard).

instrument(henry_adler, drummer).

genera(celeina_ann, genera_one).
genera(burt_bacharach, genera_one).

genera(henry_adler, genera_two).
genera(gem_archer, genera_two).

genera(michelle_branch, genera_three).
genera(faraz_anwar, genera_three).

musician(Instrument, Genera) :- instrument(Musician, Instrument), genera(Musician, Genera).
