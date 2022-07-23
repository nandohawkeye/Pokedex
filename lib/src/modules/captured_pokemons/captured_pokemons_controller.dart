import 'dart:async';

import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/database/app_db.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/models/pokemon_with_type_model.dart';

@LazySingleton()
class CapturedPokemonsController extends GetxController {
  CapturedPokemonsController(this._db);

  final AppDB _db;

  final _pokemons = Rx<List<PokemonWithTypeModel>?>(null);
  List<PokemonWithTypeModel>? get pokemons => _pokemons.value;

  final _failure = Rx<IFailure?>(null);
  IFailure? get failure => _failure.value;

  void _setFailure(IFailure failure) => _failure.value = failure;

  void _setPokemons(List<PokemonWithTypeModel> pokemons) =>
      _pokemons.value = pokemons;

  late StreamSubscription _subscriptionPokemons;

  void init() {
    _subscriptionPokemons =
        _db.watchPokemons().listen((_) async => getPokemons());
  }

  void getPokemons() async {
    final result = await _db.getAllPokemonsCaptured();
    result.fold(_setFailure, _setPokemons);
  }

  @disposeMethod
  @override
  void dispose() {
    _subscriptionPokemons.cancel();
    _pokemons.close();
    super.dispose();
  }
}
