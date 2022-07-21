import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pokedex/src/core/constants/pokemon_types.dart';

IconData? handleColorTypePokemon(String type) {
  switch (type) {
    case Pokemontypes.fire:
      return FontAwesomeIcons.fireFlameCurved;
    case Pokemontypes.normal:
      return FontAwesomeIcons.paw;
    case Pokemontypes.water:
      return FontAwesomeIcons.droplet;
    case Pokemontypes.grass:
      return FontAwesomeIcons.leaf;
    case Pokemontypes.electric:
      return FontAwesomeIcons.bolt;
    case Pokemontypes.ice:
      return FontAwesomeIcons.solidSnowflake;
    case Pokemontypes.fighting:
      return FontAwesomeIcons.handFist;
    case Pokemontypes.poison:
      return FontAwesomeIcons.biohazard;
    case Pokemontypes.ground:
      return FontAwesomeIcons.mountain;
    case Pokemontypes.flying:
      return FontAwesomeIcons.dove;
    case Pokemontypes.psychic:
      return FontAwesomeIcons.brain;
    case Pokemontypes.bug:
      return FontAwesomeIcons.bug;
    case Pokemontypes.rock:
      return FontAwesomeIcons.mountain;
    case Pokemontypes.ghost:
      return FontAwesomeIcons.ghost;
    case Pokemontypes.dark:
      return FontAwesomeIcons.solidMoon;
    case Pokemontypes.dragon:
      return FontAwesomeIcons.dragon;
    case Pokemontypes.steel:
      return FontAwesomeIcons.gear;
    case Pokemontypes.fairy:
      return FontAwesomeIcons.hatWizard;
    default:
      Colors.grey;
  }
  return null;
}
