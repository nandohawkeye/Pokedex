import 'package:flutter/material.dart';
import 'package:pokedex/src/core/constants/pokemon_types.dart';

Color? handleColorTypepokemon(String type) {
  switch (type) {
    case Pokemontypes.fire:
      return Colors.red[400]!;
    case Pokemontypes.normal:
      return Colors.grey;
    case Pokemontypes.water:
      return Colors.blue;
    case Pokemontypes.grass:
      return Colors.green;
    case Pokemontypes.electric:
      return Colors.amber;
    case Pokemontypes.ice:
      return Colors.blueAccent;
    case Pokemontypes.fighting:
      return Colors.orange;
    case Pokemontypes.poison:
      return Colors.purple;
    case Pokemontypes.ground:
      return Colors.brown;
    case Pokemontypes.flying:
      return Colors.blueGrey;
    case Pokemontypes.psychic:
      return Colors.blueGrey;
    case Pokemontypes.bug:
      return Colors.green[800]!;
    case Pokemontypes.rock:
      return Colors.brown[800]!;
    case Pokemontypes.ghost:
      return Colors.grey[800]!;
    case Pokemontypes.dark:
      return Colors.black45;
    case Pokemontypes.dragon:
      return Colors.red[700]!;
    case Pokemontypes.steel:
      return Colors.grey;
    case Pokemontypes.fairy:
      return Colors.pink[400];
    default:
      Colors.grey;
  }
  return null;
}
