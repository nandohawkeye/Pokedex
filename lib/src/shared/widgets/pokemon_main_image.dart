import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PokemonMainImage extends StatelessWidget {
  const PokemonMainImage({Key? key, this.pokemonImage}) : super(key: key);

  final String? pokemonImage;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: FadeInAnimation(
        child: SizedBox(
          height: 300,
          child: pokemonImage == null
              ? const Icon(
                  Icons.image_not_supported,
                  size: 130,
                  color: Colors.grey,
                )
              : Hero(
                  tag: pokemonImage!,
                  child: CachedNetworkImage(imageUrl: pokemonImage!)),
        ),
      ),
    );
  }
}
