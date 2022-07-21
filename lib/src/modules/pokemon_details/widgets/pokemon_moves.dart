import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/iten_move.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({Key? key, this.pokemon}) : super(key: key);

  final PokemonDetailsModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return pokemon == null || pokemon!.moves == null || pokemon!.moves!.isEmpty
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
                        'Movimentos',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: pokemon!.moves!
                          .map<Widget>((move) => ItenMove(move: move))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
