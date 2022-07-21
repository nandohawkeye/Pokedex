// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'src/core/database/app_db.dart' as _i3;
import 'src/core/interfaces/i_client_http.dart' as _i4;
import 'src/modules/home/home_controller.dart' as _i8;
import 'src/modules/pokemon_details/pokemon_details_controller.dart' as _i7;
import 'src/shared/services/dio_client.dart' as _i5;
import 'src/shared/services/poke_service.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppDB>(_i3.AppDB());
  gh.factory<_i4.IClientHttp>(() => _i5.DioClient());
  gh.factory<_i6.PokeService>(() => _i6.PokeService(get<_i4.IClientHttp>()));
  gh.lazySingleton<_i7.PokemonDetailsController>(
      () => _i7.PokemonDetailsController(get<_i6.PokeService>()));
  gh.lazySingleton<_i8.HomeController>(
      () => _i8.HomeController(get<_i6.PokeService>(), get<_i3.AppDB>()));
  return get;
}
