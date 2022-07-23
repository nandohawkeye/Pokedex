import 'package:drift/drift.dart';
import 'package:pokedex/src/core/database/app_db.dart';

class PokemonTypeModel {
  PokemonTypeModel({
    required this.pokemonName,
    required this.name,
  });

  final String pokemonName;
  final String name;

  IPokemonTypeEntityCompanion toDrift() => IPokemonTypeEntityCompanion(
        pokemonName: Value(pokemonName),
        name: Value(name),
      );

  factory PokemonTypeModel.fromDrift(PokemonType type) => PokemonTypeModel(
        name: type.name!,
        pokemonName: type.pokemonName!,
      );

  factory PokemonTypeModel.fronJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonTypeModel(
        pokemonName: pokemonName,
        name: json['type']['name'],
      );
}
