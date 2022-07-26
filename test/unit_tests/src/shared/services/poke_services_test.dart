import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/shared/services/poke_service.dart';

import '../../../../mocks/list_all_pokemons_mock.dart';
import '../../../../mocks/pokemon_details_model_mock.dart';
import '../../../../mocks/server_failure_mock.dart';

class PokeServicesMock extends Mock implements PokeService {}

void main() {
  late PokeService pokeService;
  setUp(() {
    pokeService = PokeServicesMock();
  });

  test('should be a list of pokemon\'s name in getallPokemons', () async {
    when(() => pokeService.getAllPokemons())
        .thenAnswer((_) async => Right(listAllPokemons));

    final result = await pokeService.getAllPokemons();

    expect(result, Right(listAllPokemons));
  });

  test('should be a serverFailure in getallPokemons', () async {
    when(() => pokeService.getAllPokemons())
        .thenAnswer((_) async => Left(serverFailureMock));

    final result = await pokeService.getAllPokemons();

    expect(result, Left(serverFailureMock));
  });

  test('should be a PokemonModel in getPokemon', () async {
    when(() => pokeService.getPokemon('pikachu'))
        .thenAnswer((_) async => Right(pokemon));

    final result = await pokeService.getPokemon('pikachu');

    expect(result, Right(pokemon));
  });

  test('should be a serverFailure in getPokemon', () async {
    when(() => pokeService.getPokemon('pikachu'))
        .thenAnswer((_) async => Left(serverFailureMock));

    final result = await pokeService.getPokemon('pikachu');

    expect(result, Left(serverFailureMock));
  });
}
