// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $splashRoute,
      $homeRoute,
      $pokemonDetailsRoute,
      $capturedPokemonRoute,
      $capturedPokemons,
    ];

GoRoute get $splashRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/home',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $pokemonDetailsRoute => GoRouteData.$route(
      path: '/pokemon-details/:pokemonName',
      factory: $PokemonDetailsRouteExtension._fromState,
    );

extension $PokemonDetailsRouteExtension on PokemonDetailsRoute {
  static PokemonDetailsRoute _fromState(GoRouterState state) =>
      PokemonDetailsRoute(
        state.params['pokemonName']!,
      );

  String get location => GoRouteData.$location(
        '/pokemon-details/${Uri.encodeComponent(pokemonName)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $capturedPokemonRoute => GoRouteData.$route(
      path: '/captured-pokemon/:pokemonName',
      factory: $CapturedPokemonRouteExtension._fromState,
    );

extension $CapturedPokemonRouteExtension on CapturedPokemonRoute {
  static CapturedPokemonRoute _fromState(GoRouterState state) =>
      CapturedPokemonRoute(
        state.params['pokemonName']!,
      );

  String get location => GoRouteData.$location(
        '/captured-pokemon/${Uri.encodeComponent(pokemonName)}',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}

GoRoute get $capturedPokemons => GoRouteData.$route(
      path: '/captured-pokemons',
      factory: $CapturedPokemonsExtension._fromState,
    );

extension $CapturedPokemonsExtension on CapturedPokemons {
  static CapturedPokemons _fromState(GoRouterState state) =>
      const CapturedPokemons();

  String get location => GoRouteData.$location(
        '/captured-pokemons',
      );

  void go(BuildContext context) => context.go(location, extra: this);

  void push(BuildContext context) => context.push(location, extra: this);
}
