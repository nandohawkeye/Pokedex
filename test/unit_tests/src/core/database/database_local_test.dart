import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/shared/failures/failure_local_db.dart';

import '../../../../mocks/database_mocks.dart';
import '../../../../mocks/pokemon_details_model_mock.dart';

class DBMock extends Mock implements AppDB {}

final FailureLocalDB failure = FailureLocalDB(mensage: 'Error in local DB');

void main() {
  late AppDB appDB;
  setUp(() {
    appDB = DBMock();
  });

  test('should be a list of PokemonWithTypeModel', () async {
    when(() => appDB.getAllPokemonsCaptured())
        .thenAnswer((_) async => Right(pokemonsWithTypes));

    final result = await appDB.getAllPokemonsCaptured();

    expect(result, Right(pokemonsWithTypes));
  });

  test('should be a FailureLocalDB in getAllPokemons', () async {
    when(() => appDB.getAllPokemonsCaptured())
        .thenAnswer((_) async => Left(failure));

    final result = await appDB.getAllPokemonsCaptured();

    expect(result, Left(failure));
  });

  test('should be a PokemonDetailsModel', () async {
    when(() => appDB.getPokemomCaptured('bulbasaur'))
        .thenAnswer((_) async => Right(pokemon));

    final result = await appDB.getPokemomCaptured('bulbasaur');

    expect(result, Right(pokemon));
  });

  test('should be a PokemonDetailsModel in getPokemonCaptured', () async {
    when(() => appDB.getPokemomCaptured('bulbasaur'))
        .thenAnswer((_) async => Left(failure));

    final result = await appDB.getPokemomCaptured('bulbasaur');

    expect(result, Left(failure));
  });

  test('should be a list of pokemonDetails in Stream', () async {
    when(() => appDB.watchPokemons()).thenAnswer((_) => pokemonsWatchMock);

    final result = appDB.watchPokemons();

    expect(result, pokemonsWatchMock);
  });

  test('should be a list of pokemonDetailsModel in Stream', () async {
    when(() => appDB.watchPokemonsCaptured()).thenAnswer((_) => pokemonsModels);

    final result = appDB.watchPokemonsCaptured();

    expect(result, pokemonsModels);
  });
}
