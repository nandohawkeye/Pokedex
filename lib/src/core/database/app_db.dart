import 'dart:io';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_entity.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'pokemon.sqlite'));

    return NativeDatabase(file);
  });
}

@singleton
@DriftDatabase(tables: [IPokemonEntity])
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<IPokemonEntityData>> get watchEmployees =>
      (select(iPokemonEntity).watch());

  Future<List<IPokemonEntityData>> getPokemons() async =>
      await select(iPokemonEntity).get();

  Future<IPokemonEntityData> getpokemon(int id) async =>
      await (select(iPokemonEntity)..where((tbl) => tbl.id.equals(id)))
          .getSingle();

  Future<bool> updatePokemon(IPokemonEntityCompanion pokemon) async =>
      await update(iPokemonEntity).replace(pokemon);

  Future<int> insertPokemon(IPokemonEntityCompanion pokemon) async =>
      await into(iPokemonEntity).insert(pokemon);

  Future<void> insertAllPokemons(
          List<IPokemonEntityCompanion> pokemons) async =>
      await batch((batch) => batch.insertAll(iPokemonEntity, pokemons));

  Future<int> upsertPokemon(IPokemonEntityCompanion pokemon) =>
      into(iPokemonEntity).insertOnConflictUpdate(pokemon);

  Future<int> deletePokemon(int id) async =>
      await (delete(iPokemonEntity)..where((tbl) => tbl.id.equals(id))).go();
}
