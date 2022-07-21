import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/services/poke_service.dart';

@LazySingleton()
class PokemonDetailsController extends GetxController {
  PokemonDetailsController(this._pokeService);

  final PokeService _pokeService;

  final _pokemon = Rx<PokemonDetailsModel?>(null);
  PokemonDetailsModel? get pokemon => _pokemon.value;

  final _failure = Rx<IFailure?>(null);
  IFailure? get failure => _failure.value;

  void setFailure(IFailure failure) => _failure.value = failure;
  void setPokemon(PokemonDetailsModel pokemon) => _pokemon.value = pokemon;

  Future<void> getPokemon(String pokemonName) async {
    _failure.value = null;
    _pokemon.value = null;
    final result = await _pokeService.getPokemon(pokemonName);
    result.fold(setFailure, setPokemon);
  }
}
