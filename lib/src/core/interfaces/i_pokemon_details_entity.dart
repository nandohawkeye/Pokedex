import 'package:drift/drift.dart';

@DataClassName('PokemonDetail')
abstract class IPokemonDetailsEntity extends Table {
  IntColumn get id => integer().named('id')();
  TextColumn get name => text().named('name')();
  IntColumn get height => integer().nullable()();
  IntColumn get weight => integer().nullable()();
  IntColumn get experience => integer().nullable()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get animationFront => text().nullable()();
  TextColumn get animationBack => text().nullable()();
}
