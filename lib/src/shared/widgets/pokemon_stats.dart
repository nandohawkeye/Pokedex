import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/widgets/iten_stat.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({Key? key, this.pokemon}) : super(key: key);

  final PokemonDetailsModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return pokemon == null || pokemon!.stats == null || pokemon!.stats!.isEmpty
        ? const SizedBox.shrink()
        : AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                        'Estatísticas',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ...pokemon!.stats!
                        .map<Widget>((stat) => ItenStat(stat: stat))
                        .toList()
                  ],
                ),
              ),
            ),
          );
  }
}
