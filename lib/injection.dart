import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configInjection() => $initGetIt(getIt, environment: Environment.dev);
