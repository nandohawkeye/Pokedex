import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_abilities_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_details_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_move_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_stats_entity.dart';
import 'package:pokedex/src/core/interfaces/i_pokemon_type_entity.dart';

class IPokemonAbilitiesEntityMock extends Mock
    implements IPokemonAbilitiesEntity {}

class IPokemonDetailsEntityMock extends Mock implements IPokemonDetailsEntity {}

class IPokemonMoveEntityMock extends Mock implements IPokemonMoveEntity {}

class IPokemonStatsEntityMock extends Mock implements IPokemonStatsEntity {}

class IPokemonTypeEntityMock extends Mock implements IPokemonTypeEntity {}

void main() {
  late IPokemonAbilitiesEntity ability;
  late IPokemonDetailsEntity details;
  late IPokemonMoveEntity move;
  late IPokemonStatsEntity stat;
  late IPokemonTypeEntity type;
  setUp(() {
    ability = IPokemonAbilitiesEntityMock();
    details = IPokemonDetailsEntityMock();
    move = IPokemonMoveEntityMock();
    stat = IPokemonStatsEntityMock();
    type = IPokemonTypeEntityMock();
  });

  test('Ability should be a extension of table', () {
    expect(ability, isA<Table>());
  });

  test('Details should be a extension of table', () {
    expect(details, isA<Table>());
  });

  test('Move should be a extension of table', () {
    expect(move, isA<Table>());
  });

  test('Stat should be a extension of table', () {
    expect(stat, isA<Table>());
  });

  test('Type should be a extension of table', () {
    expect(type, isA<Table>());
  });
}
