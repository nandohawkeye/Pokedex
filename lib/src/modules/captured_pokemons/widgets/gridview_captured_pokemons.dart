import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/src/modules/captured_pokemons/widgets/captured_pokemons_card.dart';
import 'package:pokedex/src/shared/models/pokemon_with_type_model.dart';

class GridViewCapturedPokemons extends StatelessWidget {
  const GridViewCapturedPokemons({Key? key, required this.pokemons})
      : super(key: key);

  final List<PokemonWithTypeModel> pokemons;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
          cacheExtent: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            mainAxisExtent: 150,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
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
                    child: CapturedPokemonsCard(pokemon: pokemons[index]),
                  ),
                ),
              )),
    );
  }
}
