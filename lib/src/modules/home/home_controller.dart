import 'dart:async';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/services/connectivity_service.dart';
import 'package:pokedex/src/shared/services/poke_service.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';

@LazySingleton()
class HomeController extends GetxController {
  HomeController(this._pokeService, this._connectivityService);

  final PokeService _pokeService;
  final ConnectivityService _connectivityService;

  final _pokemons = Rx<List<String>?>(null);
  List<String>? get pokemons => _pokemons.value
      ?.where(
          (p) => p.toUpperCase().contains(_pokemonSearch.value.toUpperCase()))
      .toList();
  bool get hasPokemons =>
      _pokemons.value != null && _pokemons.value!.isNotEmpty;

  final _failure = Rx<IFailure?>(null);
  IFailure? get failure => _failure.value;

  final _pokemon = Rx<PokemonDetailsModel?>(null);
  PokemonDetailsModel? get pokemon => _pokemon.value;

  final _isConnected = Rx<bool>(true);
  bool get isConnected => _isConnected.value;

  final _pokemonSearch = Rx<String>('');

  late StreamSubscription subscriptionIsconnected;

  void onChangeSearchPokemon(String value) => _pokemonSearch.value = value;

  init() async {
    _isConnected.value = await _connectivityService.getConnected();
    if (_isConnected.value) {
      await getAllPokemons();
    }

    subscriptionIsconnected =
        _connectivityService.isConnectedStream().listen((event) async {
      _isConnected.value = event;
      if (_isConnected.value) {
        await getAllPokemons();
      }
    });
  }

  void setFailure(IFailure failure) => _failure.value = failure;
  void setPokemon(PokemonDetailsModel pokemon) => _pokemon.value = pokemon;
  void setPokemons(List<String> pokemons) => _pokemons.value = pokemons;

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

  @disposeMethod
  @override
  void dispose() {
    _isConnected.close();
    super.dispose();
  }
}
