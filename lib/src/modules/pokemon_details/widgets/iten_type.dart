import 'package:flutter/material.dart';
import 'package:pokedex/src/modules/pokemon_details/utils/handle_type_pokemon_color.dart';
import 'package:pokedex/src/modules/pokemon_details/utils/handle_type_pokemon_icon.dart';
import 'package:pokedex/src/shared/models/pokemon_type_model.dart';

class ItemType extends StatelessWidget {
  const ItemType({Key? key, required this.type}) : super(key: key);

  final PokemonTypeModel type;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: handleColorTypepokemon(type.name),
        ),
        child: Row(
          children: [
            Icon(handleColorTypePokemon(type.name),
                color: Colors.white, size: 20),
            const SizedBox(width: 4),
            Text(
              type.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ],
        ));
  }
}
