import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/src/core/constants/pokemon_stasts.dart';

IconData? handleIconPokemonStat(String statName) {
  switch (statName) {
    case PokemonStatsName.hp:
      return FontAwesomeIcons.solidSquarePlus;
    case PokemonStatsName.attack:
      return FontAwesomeIcons.solidHandBackFist;
    case PokemonStatsName.specialAttack:
      return FontAwesomeIcons.handFist;
    case PokemonStatsName.defense:
      return FontAwesomeIcons.shieldHalved;
    case PokemonStatsName.specialDefense:
      return FontAwesomeIcons.shield;
    case PokemonStatsName.speed:
      return FontAwesomeIcons.gaugeHigh;
  }
  return null;
}
