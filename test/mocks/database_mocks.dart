import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/models/pokemon_with_type_model.dart';

final List<PokemonWithTypeModel> pokemonsWithTypes = [
  PokemonWithTypeModel(PokemonDetail(id: 1, name: 'bulbasaur'),
      PokemonType(id: 1, name: 'grass', pokemonName: 'bulbasaur')),
  PokemonWithTypeModel(PokemonDetail(id: 1, name: 'ivysaur'),
      PokemonType(id: 1, name: 'grass', pokemonName: 'ivysaur'))
];

final List<PokemonDetailsModel> pokemons = [
  PokemonDetailsModel(),
  PokemonDetailsModel()
];

Stream<List<PokemonDetail>> pokemonsWatchMock =
    Stream<List<PokemonDetail>>.fromIterable([
  [
    PokemonDetail(id: 1, name: 'bulbasaur'),
    PokemonDetail(id: 2, name: 'ivysaur')
  ]
]);

Stream<List<PokemonDetailsModel>> pokemonsModels =
    Stream<List<PokemonDetailsModel>>.fromIterable([pokemons]);
