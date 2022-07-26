import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/widgets/custom_snackbar.dart';

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
    await verifyPokemonIsSave(pokemonName);
  }

  Future<void> verifyPokemonIsSave(String pokemonName) async {
    final result = await _db.pokemonIsSave(pokemonName);

    result.fold((_) => callSnackbarError("Erro ao verificar Pokemon capturado"),
        (value) => _pokemonIsSave.value = value);
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
            (_) => callSnackbarError("Erro ao salvar pokemon"),
            (_) => successChangeIsSavePokemon(true, 'Pokemon capturado!')));
  }

  Future<void> removePokemon() async {
    await _db.deletePokemon(_pokemon.value!.name!).then((result) => result.fold(
        (_) => callSnackbarError('Erro ao soltar pokemon'),
        (_) => successChangeIsSavePokemon(false, "Pokemon solto!")));
  }

  Future<void> getPokemon(String pokemonName) async {
    _failure.value = null;
    _pokemon.value = null;
    final result = await _db.getPokemomCaptured(pokemonName);
    result.fold(setFailure, setPokemon);
  }

  void callSnackbarError(String mensage) => CustomSnackbar.error(mensage);

  void successChangeIsSavePokemon(bool status, String mensage) {
    _pokemonIsSave.value = status;
    CustomSnackbar.success(mensage);
  }
}
