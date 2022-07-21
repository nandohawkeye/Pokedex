import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    return AnimationLimiter(
      child: GridView.builder(
          cacheExtent: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisExtent: 50,
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: pokemons.length,
          itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
                columnCount: 2,
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50,
                  horizontalOffset: 50,
                  child: FadeInAnimation(
                    child: PokemonCard(
                      onTap: onTap,
                      pokemon: pokemons[index],
                    ),
                  ),
                ),
              )),
    );
  }
}
