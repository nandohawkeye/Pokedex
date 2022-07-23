import 'package:drift/drift.dart';

@DataClassName('PokemonMove')
abstract class IPokemonMoveEntity extends Table {
  TextColumn get pokemonName => text().nullable()();
  TextColumn get name => text().nullable()();
  IntColumn get id => integer().autoIncrement()();
}
