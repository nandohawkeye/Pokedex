import 'package:flutter/material.dart';
import 'package:pokedex/src/shared/models/pokemon_move_model.dart';

class ItenMove extends StatelessWidget {
  const ItenMove({Key? key, required this.move}) : super(key: key);

  final PokemonMoveModel move;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.cyan,
      Colors.amber,
      Colors.amber,
      Colors.orange,
    ];

    final Color color = (colors..shuffle()).first;

    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color.withOpacity(0.15),
        ),
        child: Text(
          move.name,
          style: const TextStyle(fontSize: 16),
        ));
  }
}
