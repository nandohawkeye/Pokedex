import 'package:drift/drift.dart';

@DataClassName('PokemonType')
abstract class IPokemonTypeEntity extends Table {
  TextColumn get pokemonName => text().nullable()();
  TextColumn get name => text().nullable()();
  IntColumn get id => integer().autoIncrement()();
}
