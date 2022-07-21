// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:pokedex/src/core/constants/pokemon_stasts.dart';

Color? handleColorPokemonStat(String statName) {
  switch (statName) {
    case PokemonStatsName.hp:
      return Colors.green;
    case PokemonStatsName.attack:
      return Colors.red;
    case PokemonStatsName.specialAttack:
      return Colors.red;
    case PokemonStatsName.defense:
      return Colors.blue;
    case PokemonStatsName.specialDefense:
      return Colors.blue;
    case PokemonStatsName.speed:
      return Colors.orange;
  }
}
