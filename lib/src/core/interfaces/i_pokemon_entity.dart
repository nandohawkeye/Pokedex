import 'package:drift/drift.dart';

abstract class IPokemonEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().named('name')();
  TextColumn get url => text().named('url')();
}
