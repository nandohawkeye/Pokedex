import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';

class PokemonAnimations extends StatelessWidget {
  const PokemonAnimations({Key? key, this.pokemon}) : super(key: key);

  final PokemonDetailsModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return pokemon == null ||
            (pokemon!.animationFront == null && pokemon!.animationBack == null)
        ? const SizedBox.shrink()
        : AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.transparent,
                      ),
                      child: const Text(
                        'Animações',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        pokemon!.animationBack == null
                            ? const SizedBox.shrink()
                            : CachedNetworkImage(
                                imageUrl: pokemon!.animationBack!),
                        const SizedBox(width: 8),
                        pokemon!.animationFront == null
                            ? const SizedBox.shrink()
                            : CachedNetworkImage(
                                imageUrl: pokemon!.animationFront!),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
