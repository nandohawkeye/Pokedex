import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/services/poke_service.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/models/pokemon_model.dart';

@LazySingleton()
class HomeController extends GetxController {
  HomeController(this._pokeService, this._appDB);

  final AppDB _appDB;
  final PokeService _pokeService;

  final _pokemons = Rx<List<IPokemonEntityData>?>(null);
  List<IPokemonEntityData>? get pokemons => _pokemons.value
      ?.where((p) =>
          p.name.toUpperCase().contains(_pokemonSearch.value.toUpperCase()))
      .toList();
  bool get hasPokemons =>
      _pokemons.value != null && _pokemons.value!.isNotEmpty;

  final _failure = Rx<IFailure?>(null);
  IFailure? get failure => _failure.value;

  final _pokemon = Rx<PokemonDetailsModel?>(null);
  PokemonDetailsModel? get pokemon => _pokemon.value;

  final _pokemonSearch = Rx<String>('');

  void onChangeSearchPokemon(String value) => _pokemonSearch.value = value;

  init() async {
    _pokemons.bindStream(_appDB.watchEmployees);
    await getAllPokemons();
  }

  void setFailure(IFailure failure) => _failure.value = failure;
  void setPokemon(PokemonDetailsModel pokemon) => _pokemon.value = pokemon;
  void setPokemons(List<PokemonModel> pokemons) {
    final list = pokemons.map((e) => e.toCompanion()).toList();
    _appDB.insertAllPokemons(list);
    _failure.value = null;
  }

  Future<void> getAllPokemons() async {
    _failure.value = null;
    final result = await _pokeService.getAllPokemons();
    result.fold(setFailure, setPokemons);
  }

  Future<void> getPokemon(String pokemonName) async {
    _failure.value = null;
    _pokemon.value = null;
    final result = await _pokeService.getPokemon(pokemonName);
    result.fold(setFailure, setPokemon);
  }
}
