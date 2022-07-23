// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_abilities_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_details_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_move_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_stats_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_type_entity.dart';
import 'package:pokedex/src/shared/failures/failure_local_db.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/models/pokemon_with_type_model.dart';
import 'package:stream_transform/stream_transform.dart';

part 'app_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'pokemon.sqlite'));

    return NativeDatabase(file);
  });
}

@singleton
@DriftDatabase(tables: [
  IPokemonDetailsEntity,
  IPokemonAbilitiesEntity,
  IPokemonMoveEntity,
  IPokemonTypeEntity,
  IPokemonStatsEntity
])
class AppDB extends _$AppDB {
  AppDB() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<Either<IFailure, List<PokemonWithTypeModel>>>
      getAllPokemonsCaptured() async {
    try {
      final pokemons = await (select(iPokemonDetailsEntity)).get();
      final types = await (select(iPokemonTypeEntity)).get();

      return right(pokemons
          .map((pokemon) => PokemonWithTypeModel(
                pokemon,
                types.firstWhere((type) => type.pokemonName == pokemon.name,
                    orElse: () => PokemonType(
                        id: 1, name: 'normal', pokemonName: pokemon.name)),
              ))
          .toList());
    } catch (error, st) {
      return left(FailureLocalDB(
        mensage: error.toString(),
        stackTrace: st.toString(),
      ));
    }
  }

  Future<Either<IFailure, PokemonDetailsModel>> getPokemomCaptured(
      String pokemonName) async {
    try {
      final detail = await (select(iPokemonDetailsEntity)
            ..where((tbl) => tbl.name.equals(pokemonName)))
          .getSingleOrNull();

      if (detail == null) {
        return left(FailureLocalDB(mensage: 'Without Pokemom'));
      }

      final types = await (select(iPokemonTypeEntity)
            ..where((tbl) => tbl.pokemonName.equals(pokemonName)))
          .get();
      final abilities = await (select(iPokemonAbilitiesEntity)
            ..where((tbl) => tbl.pokemonName.equals(pokemonName)))
          .get();
      final moves = await (select(iPokemonMoveEntity)
            ..where((tbl) => tbl.pokemonName.equals(pokemonName)))
          .get();
      final stats = await (select(iPokemonStatsEntity)
            ..where((tbl) => tbl.pokemonName.equals(pokemonName)))
          .get();

      return right(PokemonDetailsModel.fromDrift(
        detail,
        abilities,
        moves,
        types,
        stats,
      ));
    } catch (error, st) {
      return left(FailureLocalDB(
        mensage: error.toString(),
        stackTrace: st.toString(),
      ));
    }
  }

  Stream<List<PokemonDetail>> watchPokemons() =>
      select(iPokemonDetailsEntity).watch();

  Stream<List<PokemonDetailsModel>> watchPokemonsCaptured() {
    final queryDetails = select(iPokemonDetailsEntity).watch();
    final queryAbilities = select(iPokemonAbilitiesEntity).watch();
    final queryMoves = select(iPokemonMoveEntity).watch();
    final queryTypes = select(iPokemonTypeEntity).watch();
    final queryStats = select(iPokemonStatsEntity).watch();

    return queryAbilities
        .concurrentAsyncExpand<List<PokemonDetailsModel>>((abilities) {
      return queryMoves
          .concurrentAsyncExpand<List<PokemonDetailsModel>>((moves) {
        return queryTypes
            .concurrentAsyncExpand<List<PokemonDetailsModel>>((types) {
          return queryStats
              .concurrentAsyncExpand<List<PokemonDetailsModel>>((stats) {
            return queryDetails.map((details) => details
                .map((detail) => PokemonDetailsModel.fromDrift(
                    detail,
                    abilities
                        .where((ability) => ability.name == detail.name)
                        .toList(),
                    moves.where((move) => move.name == detail.name).toList(),
                    types.where((type) => type.name == detail.name).toList(),
                    stats.where((stat) => stat.name == detail.name).toList()))
                .toList());
          });
        });
      });
    });
  }

  Future<Either<IFailure, bool>> pokemonIsSave(String pokemonName) async {
    try {
      final pokemon = await (select(iPokemonDetailsEntity)
            ..where((tbl) => tbl.name.equals(pokemonName)))
          .getSingleOrNull();

      if (pokemon == null) {
        return right(false);
      } else {
        return right(true);
      }
    } catch (error, st) {
      return left(FailureLocalDB(
        mensage: error.toString(),
        stackTrace: st.toString(),
      ));
    }
  }

  Future<Either<IFailure, void>> deletePokemon(String pokemonName) async {
    try {
      await (delete(iPokemonDetailsEntity)
            ..where((tbl) => tbl.name.equals(pokemonName)))
          .go();

      await (delete(iPokemonAbilitiesEntity)
            ..where((tbl) => tbl.name.equals(pokemonName)))
          .go();

      await (delete(iPokemonMoveEntity)
            ..where((tbl) => tbl.name.equals(pokemonName)))
          .go();

      await (delete(iPokemonTypeEntity)
            ..where((tbl) => tbl.name.equals(pokemonName)))
          .go();

      await (delete(iPokemonStatsEntity)
            ..where((tbl) => tbl.name.equals(pokemonName)))
          .go();

      return right(null);
    } catch (error, st) {
      return left(FailureLocalDB(
        mensage: error.toString(),
        stackTrace: st.toString(),
      ));
    }
  }

  Future<Either<IFailure, void>> insertPokemon({
    required IPokemonDetailsEntityCompanion pokemonDetail,
    List<IPokemonAbilitiesEntityCompanion>? abilities,
    List<IPokemonMoveEntityCompanion>? moves,
    List<IPokemonTypeEntityCompanion>? types,
    List<IPokemonStatsEntityCompanion>? stats,
  }) async {
    try {
      await into(iPokemonDetailsEntity).insert(pokemonDetail);

      if (abilities != null && abilities.isNotEmpty) {
        await batch((batchAbilities) =>
            batchAbilities.insertAll(iPokemonAbilitiesEntity, abilities));
      }

      if (moves != null && moves.isNotEmpty) {
        await batch(
            (batchMoves) => batchMoves.insertAll(iPokemonMoveEntity, moves));
      }

      if (types != null && types.isNotEmpty) {
        await batch(
            (batchTypes) => batchTypes.insertAll(iPokemonTypeEntity, types));
      }

      if (stats != null && stats.isNotEmpty) {
        await batch(
            (batchStats) => batchStats.insertAll(iPokemonStatsEntity, stats));
      }

      return right(null);
    } catch (error, st) {
      return left(FailureLocalDB(
        mensage: error.toString(),
        stackTrace: st.toString(),
      ));
    }
  }

  @disposeMethod
  dispose() async => await close();
}
