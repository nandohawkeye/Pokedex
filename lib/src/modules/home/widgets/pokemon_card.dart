import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/core/constants/route_paths.dart';
import 'package:pokedex/src/shared/utils/text_utils.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemonName, required this.onTap})
      : super(key: key);

  final String pokemonName;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.cyan,
      Colors.amber,
      Colors.amber,
      Colors.black87,
      Colors.orange,
      Colors.grey,
      Colors.brown
    ];

    final Color color = (colors..shuffle()).first;

    return InkWell(
      onTap: () => onTap(pokemonName),
      onLongPress: () =>
          context.push('${RoutePaths.pokemonDetails}/$pokemonName'),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.10),
                offset: const Offset(0, 5),
                blurRadius: 20,
              )
            ]),
        height: 40,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          captalize(pokemonName),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ),
    );
  }
}
