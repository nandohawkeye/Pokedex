import 'package:drift/drift.dart';

@DataClassName('PokemonAbility')
abstract class IPokemonAbilitiesEntity extends Table {
  TextColumn get pokemonName => text().nullable()();
  TextColumn get name => text().nullable()();
  BoolColumn get isHidden => boolean().nullable()();
  IntColumn get id => integer().autoIncrement()();
}
