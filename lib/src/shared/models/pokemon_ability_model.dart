import 'package:drift/drift.dart';
import 'package:pokedex/src/core/database/app_db.dart';

class PokemonAbilityModel {
  PokemonAbilityModel({
    required this.pokemonName,
    required this.name,
    required this.isHidden,
  });

  final String pokemonName;
  final String name;
  final bool isHidden;

  IPokemonAbilitiesEntityCompanion toDrift() =>
      IPokemonAbilitiesEntityCompanion(
        isHidden: Value(isHidden),
        name: Value(name),
        pokemonName: Value(pokemonName),
      );

  factory PokemonAbilityModel.fromDrift(PokemonAbility ability) =>
      PokemonAbilityModel(
        isHidden: ability.isHidden!,
        name: ability.name!,
        pokemonName: ability.pokemonName!,
      );

  factory PokemonAbilityModel.fromJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonAbilityModel(
        pokemonName: pokemonName,
        isHidden: json['is_hidden'],
        name: json['ability']['name'],
      );
}
