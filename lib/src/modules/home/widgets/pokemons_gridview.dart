import 'package:flutter/material.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/modules/home/widgets/pokemon_card.dart';

class PokemonsGridView extends StatelessWidget {
  const PokemonsGridView(
      {Key? key, required this.pokemons, required this.onTap})
      : super(key: key);

  final List<IPokemonEntityData> pokemons;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisExtent: 50,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) => PokemonCard(
              onTap: onTap,
              pokemon: pokemons[index],
            ));
  }
}
