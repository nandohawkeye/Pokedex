import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/widgets/pokeloader.dart';

class PokemonBottomSheet extends StatelessWidget {
  const PokemonBottomSheet({Key? key, this.pokemon}) : super(key: key);

  final PokemonDetailsModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 275),
      padding: const EdgeInsets.all(16),
      height: 400,
      color: Colors.transparent,
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38.withOpacity(0.25),
                      offset: const Offset(0, 5),
                      blurRadius: 15,
                    )
                  ]),
              child: pokemon == null
                  ? const PokeLoader()
                  : pokemon!.imageUrl == null
                      ? const Icon(
                          Icons.image_not_supported,
                          size: 130,
                          color: Colors.grey,
                        )
                      : CachedNetworkImage(imageUrl: pokemon!.imageUrl!),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Button(
                color: Colors.red,
                onTap: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              const SizedBox(width: 30),
              _Button(
                color: Colors.blue,
                onTap: () => Navigator.pop(context, true),
                icon: const Icon(
                  Icons.visibility,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button(
      {Key? key, required this.onTap, required this.color, required this.icon})
      : super(key: key);

  final Function() onTap;
  final Color color;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(2000),
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.25),
                offset: const Offset(0, 0),
                blurRadius: 15,
              )
            ]),
        child: icon,
      ),
    );
  }
}
