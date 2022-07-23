import 'package:pokedex/src/core/database/app_db.dart';

class PokemonWithTypeModel {
  PokemonWithTypeModel(this.detail, this.type);

  final PokemonDetail detail;
  final PokemonType? type;
}
