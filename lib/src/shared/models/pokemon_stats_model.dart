import 'package:drift/drift.dart';
import 'package:pokedex/src/core/database/app_db.dart';

class PokemonStatsModel {
  PokemonStatsModel({
    required this.pokemonName,
    required this.baseStat,
    required this.effort,
    required this.name,
  });

  final String pokemonName;
  final int baseStat;
  final int effort;
  final String name;

  IPokemonStatsEntityCompanion toDrift() => IPokemonStatsEntityCompanion(
        baseStat: Value(baseStat),
        effort: Value(effort),
        name: Value(name),
        pokemonName: Value(pokemonName),
      );

  factory PokemonStatsModel.fromDrift(PokemonStat stat) => PokemonStatsModel(
        name: stat.name!,
        pokemonName: stat.pokemonName!,
        effort: stat.effort!,
        baseStat: stat.baseStat!,
      );

  factory PokemonStatsModel.fronJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonStatsModel(
        pokemonName: pokemonName,
        baseStat: json['base_stat'],
        effort: json['effort'],
        name: json['stat']['name'],
      );
}
