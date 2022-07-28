import 'package:drift/drift.dart';
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

const IPokemonDetailsEntityCompanion pokemonDetail =
    IPokemonDetailsEntityCompanion(
  id: Value(1),
  name: Value('bulbasaur'),
  animationBack: Value('animation_back.gif'),
  animationFront: Value('animation_front.gif'),
  experience: Value(64),
  imageUrl: Value('image_url.png'),
  height: Value(7),
  weight: Value(69),
);

const IPokemonAbilitiesEntityCompanion ability =
    IPokemonAbilitiesEntityCompanion(
  id: Value(1),
  isHidden: Value(true),
  name: Value('overgrow'),
  pokemonName: Value('bulbasaur'),
);

const IPokemonMoveEntityCompanion move = IPokemonMoveEntityCompanion(
  id: Value(1),
  name: Value('razor-wind'),
  pokemonName: Value('bulbasaur'),
);

const IPokemonTypeEntityCompanion type = IPokemonTypeEntityCompanion(
  id: Value(1),
  name: Value('grass'),
  pokemonName: Value('bulbasaur'),
);

const IPokemonStatsEntityCompanion stat = IPokemonStatsEntityCompanion(
  baseStat: Value(45),
  effort: Value(1),
  id: Value(1),
  name: Value('hp'),
  pokemonName: Value('bulbasaur'),
);

Stream<List<PokemonDetail>> pokemonsWatchMock =
    Stream<List<PokemonDetail>>.fromIterable([
  [
    PokemonDetail(id: 1, name: 'bulbasaur'),
    PokemonDetail(id: 2, name: 'ivysaur')
  ]
]);

Stream<List<PokemonDetailsModel>> pokemonsModels =
    Stream<List<PokemonDetailsModel>>.fromIterable([pokemons]);
