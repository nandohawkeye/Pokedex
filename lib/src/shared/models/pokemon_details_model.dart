import 'package:pokedex/src/shared/models/pokemon_ability_model.dart';
import 'package:pokedex/src/shared/models/pokemon_move_model.dart';
import 'package:pokedex/src/shared/models/pokemon_stats_model.dart';
import 'package:pokedex/src/shared/models/pokemon_type_model.dart';

class PokemonDetailsModel {
  PokemonDetailsModel({
    required this.name,
    required this.height,
    required this.id,
    required this.weight,
    required this.imageUrl,
    required this.animationFront,
    required this.animationBack,
    required this.stats,
    required this.abilities,
    required this.types,
    required this.moves,
  });

  final String? name;
  final int? height;
  final int? id;
  final int? weight;
  final String? imageUrl;
  final String? animationFront;
  final String? animationBack;
  final List<PokemonStatsModel>? stats;
  final List<PokemonAbilityModel>? abilities;
  final List<PokemonTypeModel>? types;
  final List<PokemonMoveModel>? moves;

  factory PokemonDetailsModel.fronJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        name: json['name'],
        id: json['id'],
        height: json['height'],
        weight: json['weight'],
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
