import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/iten_ablitity.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({Key? key, this.pokemon}) : super(key: key);

  final PokemonDetailsModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return pokemon == null ||
            pokemon!.abilities == null ||
            pokemon!.abilities!.isEmpty
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
                        'Habilidades',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pokemon!.abilities!
                          .map<Widget>(
                              (ability) => ItenAbility(ability: ability))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
