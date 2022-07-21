import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/models/pokemon_ability_model.dart';
import 'package:pokedex/src/shared/utils/text_utils.dart';

class ItenAbility extends StatelessWidget {
  const ItenAbility({Key? key, required this.ability}) : super(key: key);

  final PokemonAbilityModel ability;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        child: Text(
          captalize(ability.name),
          style: const TextStyle(fontSize: 16),
        ));
  }
}
