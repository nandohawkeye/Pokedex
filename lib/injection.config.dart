// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/core/database/app_db.dart' as _i3;
import 'src/core/interfaces/i_client_http.dart' as _i7;
import 'src/modules/captured_pokemom/captured_pokemom_controller.dart' as _i4;
import 'src/modules/captured_pokemons/captured_pokemons_controller.dart' as _i5;
import 'src/modules/home/home_controller.dart' as _i11;
import 'src/modules/pokemon_details/pokemon_details_controller.dart' as _i10;
import 'src/shared/services/connectivity_service.dart' as _i6;
import 'src/shared/services/dio_client.dart' as _i8;
import 'src/shared/services/poke_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppDB>(_i3.AppDB(), dispose: (i) => i.dispose());
  gh.lazySingleton<_i4.CapturedPokemomController>(
      () => _i4.CapturedPokemomController(get<_i3.AppDB>()));
  gh.lazySingleton<_i5.CapturedPokemonsController>(
      () => _i5.CapturedPokemonsController(get<_i3.AppDB>()),
      dispose: (i) => i.dispose());
  gh.singleton<_i6.ConnectivityService>(_i6.ConnectivityService());
  gh.factory<_i7.IClientHttp>(() => _i8.DioClient());
  gh.factory<_i9.PokeService>(() => _i9.PokeService(get<_i7.IClientHttp>()));
  gh.lazySingleton<_i10.PokemonDetailsController>(() =>
      _i10.PokemonDetailsController(get<_i9.PokeService>(), get<_i3.AppDB>()));
  gh.lazySingleton<_i11.HomeController>(
      () => _i11.HomeController(
          get<_i9.PokeService>(), get<_i6.ConnectivityService>()),
      dispose: (i) => i.dispose());
  return get;
}
