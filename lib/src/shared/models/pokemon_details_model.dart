import 'package:drift/drift.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/shared/models/pokemon_ability_model.dart';
import 'package:pokedex/src/shared/models/pokemon_move_model.dart';
import 'package:pokedex/src/shared/models/pokemon_stats_model.dart';
import 'package:pokedex/src/shared/models/pokemon_type_model.dart';

class PokemonDetailsModel {
  PokemonDetailsModel({
    this.name,
    this.height,
    this.id,
    this.weight,
    this.imageUrl,
    this.animationFront,
    this.animationBack,
    this.stats,
    this.abilities,
    this.types,
    this.moves,
    this.experience,
  });

  final String? name;
  final int? height;
  final int? id;
  final int? weight;
  final int? experience;
  final String? imageUrl;
  final String? animationFront;
  final String? animationBack;
  final List<PokemonStatsModel>? stats;
  final List<PokemonAbilityModel>? abilities;
  final List<PokemonTypeModel>? types;
  final List<PokemonMoveModel>? moves;

  IPokemonDetailsEntityCompanion toDrift() => IPokemonDetailsEntityCompanion(
        id: Value(id!),
        name: Value(name!),
        animationBack: Value(animationBack),
        animationFront: Value(animationFront),
        experience: Value(experience),
        imageUrl: Value(imageUrl),
        height: Value(height),
        weight: Value(weight),
      );

  List<IPokemonAbilitiesEntityCompanion>? abilitiesToDrift() {
    if (abilities == null || abilities!.isEmpty) {
      return null;
    } else {
      return abilities!.map((ability) => ability.toDrift()).toList();
    }
  }

  List<IPokemonStatsEntityCompanion>? statsToDrift() {
    if (stats == null || stats!.isEmpty) {
      return null;
    } else {
      return stats!.map((stat) => stat.toDrift()).toList();
    }
  }

  List<IPokemonTypeEntityCompanion>? typesToDrift() {
    if (types == null || types!.isEmpty) {
      return null;
    } else {
      return types!.map((type) => type.toDrift()).toList();
    }
  }

  List<IPokemonMoveEntityCompanion>? movesToDrift() {
    if (moves == null || moves!.isEmpty) {
      return null;
    } else {
      return moves!.map((move) => move.toDrift()).toList();
    }
  }

  factory PokemonDetailsModel.fromDrift(
          PokemonDetail detail,
          List<PokemonAbility>? abilities,
          List<PokemonMove>? moves,
          List<PokemonType>? types,
          List<PokemonStat>? stats) =>
      PokemonDetailsModel(
        id: detail.id,
        name: detail.name,
        animationBack: detail.animationBack,
        animationFront: detail.animationFront,
        experience: detail.experience,
        weight: detail.weight,
        height: detail.height,
        imageUrl: detail.imageUrl,
        abilities: abilities
            ?.map((ability) => PokemonAbilityModel.fromDrift(ability))
            .toList(),
        moves: moves?.map((move) => PokemonMoveModel.fromDrift(move)).toList(),
        types: types?.map((type) => PokemonTypeModel.fromDrift(type)).toList(),
        stats: stats?.map((stat) => PokemonStatsModel.fromDrift(stat)).toList(),
      );

  factory PokemonDetailsModel.fronJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        name: json['name'],
        id: json['id'],
        height: json['height'],
        weight: json['weight'],
        experience: json['base_experience'],
        imageUrl: json['sprites']['other']['official-artwork']['front_default'],
        animationFront: json['sprites']['versions']['generation-v']
            ['black-white']['animated']['front_default'],
        animationBack: json['sprites']['versions']['generation-v']
            ['black-white']['animated']['back_default'],
        stats: List<PokemonStatsModel>.from(json['stats']
            .map((s) => PokemonStatsModel.fronJson(s, json['name']))),
        abilities: List<PokemonAbilityModel>.from(json['abilities']
            .map((a) => PokemonAbilityModel.fromJson(a, json['name']))),
        types: List<PokemonTypeModel>.from(json['types']
            .map((t) => PokemonTypeModel.fronJson(t, json['name']))),
        moves: List<PokemonMoveModel>.from(json['moves']
            .map((m) => PokemonMoveModel.fromJson(m, json['name']))),
      );
}
