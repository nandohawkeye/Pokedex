import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/modules/home/home_service.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';

@LazySingleton()
class HomeController extends GetxController {
  HomeController(this._homeService, this._appDB);

  final _pokemons = Rx<List<IPokemonEntityData>?>(null);

  final AppDB _appDB;
  final HomeService _homeService;

  List<IPokemonEntityData>? get pokemons => _pokemons.value;
  bool get hasPokemons =>
      _pokemons.value != null && _pokemons.value!.isNotEmpty;

  final _failure = Rx<IFailure?>(null);
  IFailure? get failure => _failure.value;

  final _pokemon = Rx<PokemonDetailsModel?>(null);
  PokemonDetailsModel? get pokemon => _pokemon.value;

  init() async {
    _pokemons.bindStream(_appDB.watchEmployees);
    await getAllPokemons();
  }

  Future<void> getAllPokemons() async {
    _failure.value = null;
    final result = await _homeService.getAllPokemons();
    result.fold((failure) {
      _failure.value = failure;
    }, (data) {
      final list = data.map((e) => e.toCompanion()).toList();
      _appDB.insertAllPokemons(list);
      _failure.value = null;
    });
  }

  Future<void> getPokemon(String pokemonName) async {
    _pokemon.value = null;
    final result = await _homeService.getPokemon(pokemonName);
    result.fold((failure) {
      _failure.value = failure;
    }, (data) {
      _pokemon.value = data;
    });
  }
}
