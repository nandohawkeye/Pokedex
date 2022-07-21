// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/core/database/app_db.dart' as _i3;
import 'src/core/interfaces/i_client_http.dart' as _i5;
import 'src/modules/home/home_controller.dart' as _i9;
import 'src/modules/pokemon_details/pokemon_details_controller.dart' as _i8;
import 'src/shared/services/connectivity_service.dart' as _i4;
import 'src/shared/services/dio_client.dart' as _i6;
import 'src/shared/services/poke_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppDB>(_i3.AppDB());
  gh.singleton<_i4.ConnectivityService>(_i4.ConnectivityService());
  gh.factory<_i5.IClientHttp>(() => _i6.DioClient());
  gh.factory<_i7.PokeService>(() => _i7.PokeService(get<_i5.IClientHttp>()));
  gh.lazySingleton<_i8.PokemonDetailsController>(
      () => _i8.PokemonDetailsController(get<_i7.PokeService>()));
  gh.lazySingleton<_i9.HomeController>(() => _i9.HomeController(
      get<_i7.PokeService>(), get<_i4.ConnectivityService>()));
  return get;
}
