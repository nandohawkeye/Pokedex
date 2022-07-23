import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/core/constants/route_paths.dart';
import 'package:pokedex/src/shared/utils/handle_type_pokemon_color.dart';
import 'package:pokedex/src/shared/models/pokemon_with_type_model.dart';

class CapturedPokemonsCard extends StatelessWidget {
  const CapturedPokemonsCard({Key? key, required this.pokemon})
      : super(key: key);

  final PokemonWithTypeModel pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.push('${RoutePaths.capturedPokemon}/${pokemon.detail.name}'),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                  color: handleColorTypePokemon(pokemon.type!.name!)!
                      .withOpacity(0.35)),
            ]),
        child: Hero(
            tag: pokemon.detail.imageUrl!,
            child: CachedNetworkImage(imageUrl: pokemon.detail.imageUrl!)),
      ),
    );
  }
}
