import 'package:drift/drift.dart';
import 'package:pokedex/src/core/database/app_db.dart';

class PokemonMoveModel {
  PokemonMoveModel({
    required this.pokemonName,
    required this.name,
  });

  final String pokemonName;
  final String name;

  IPokemonMoveEntityCompanion toDrift() => IPokemonMoveEntityCompanion(
        name: Value(name),
        pokemonName: Value(pokemonName),
      );

  factory PokemonMoveModel.fromDrift(PokemonMove move) => PokemonMoveModel(
        name: move.name!,
        pokemonName: move.pokemonName!,
      );

  factory PokemonMoveModel.fromJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonMoveModel(
        pokemonName: pokemonName,
        name: json['move']['name'],
      );
}
