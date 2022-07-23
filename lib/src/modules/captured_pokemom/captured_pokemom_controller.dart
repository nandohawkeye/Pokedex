import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';

@LazySingleton()
class CapturedPokemomController extends GetxController {
  CapturedPokemomController(this._db);

  final AppDB _db;

  final _pokemon = Rx<PokemonDetailsModel?>(null);

  PokemonDetailsModel? get pokemon => _pokemon.value;

  final _pokemonIsSave = Rx<bool>(true);
  bool get pokemonIsSave => _pokemonIsSave.value;

  final _failure = Rx<IFailure?>(null);
  IFailure? get failure => _failure.value;

  void setFailure(IFailure failure) => _failure.value = failure;
  void setPokemon(PokemonDetailsModel pokemon) => _pokemon.value = pokemon;

  void init(String pokemonName) async {
    await getPokemon(pokemonName);
  }

  void changeSavePokemon() async {
    if (_pokemonIsSave.value) {
      await removePokemon();
    } else {
      await savePokemom();
    }
  }

  Future<void> savePokemom() async {
    await _db
        .insertPokemon(
          pokemonDetail: _pokemon.value!.toDrift(),
          abilities: _pokemon.value!.abilitiesToDrift(),
          moves: _pokemon.value!.movesToDrift(),
          stats: _pokemon.value!.statsToDrift(),
          types: _pokemon.value!.typesToDrift(),
        )
        .then((result) => result.fold(
                (_) => AsukaSnackbar.warning("Erro ao salvar pokemon").show(),
                (_) {
              _pokemonIsSave.value = true;
              AsukaSnackbar.success("Pokemon capturado!").show();
            }));
  }

  Future<void> removePokemon() async {
    await _db.deletePokemon(_pokemon.value!.name!).then((result) => result.fold(
            (_) => AsukaSnackbar.warning("Erro ao soltar pokemon").show(), (_) {
          _pokemonIsSave.value = false;
          AsukaSnackbar.success("Pokemon solto!").show();
        }));
  }

  Future<void> getPokemon(String pokemonName) async {
    _failure.value = null;
    _pokemon.value = null;
    final result = await _db.getPokemomCaptured(pokemonName);
    result.fold(setFailure, setPokemon);
  }
}
