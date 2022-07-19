import 'package:drift/drift.dart';
import 'package:pokedex/src/core/database/app_db.dart';

class PokemonModel {
  PokemonModel({required this.name, required this.url});

  final String name;
  final String url;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      PokemonModel(name: json['name'], url: json['url']);

  IPokemonEntityCompanion toCompanion({int? id}) => id != null
      ? IPokemonEntityCompanion(
          name: Value(name), url: Value(url), id: Value(id))
      : IPokemonEntityCompanion(name: Value(name), url: Value(url));

  Map<String, dynamic> toJson() => {'name': name, 'url': url};
}
