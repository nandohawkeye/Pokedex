import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/core/database/app_db.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final IPokemonEntityData pokemon;

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
      onTap: () => context.push('/pokemon-details/${pokemon.name}'),
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
          pokemon.name,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ),
    );
  }
}
