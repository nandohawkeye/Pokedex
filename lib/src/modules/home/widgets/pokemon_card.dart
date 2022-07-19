import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/core/database/app_db.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final IPokemonEntityData pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/pokemon-details/${pokemon.name}'),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black38.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 15)
            ]),
        height: 40,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(pokemon.name,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}
