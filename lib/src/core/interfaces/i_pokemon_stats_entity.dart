import 'package:drift/drift.dart';

@DataClassName('PokemonStat')
abstract class IPokemonStatsEntity extends Table {
  TextColumn get pokemonName => text().nullable()();
  TextColumn get name => text().nullable()();
  IntColumn get id => integer().autoIncrement()();
  IntColumn get baseStat => integer().nullable()();
  IntColumn get effort => integer().nullable()();
}
