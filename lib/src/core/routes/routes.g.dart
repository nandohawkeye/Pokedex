// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<GoRoute> get $appRoutes => [
      $homeRoute,
      $pokemonDetailsRoute,
    ];

GoRoute get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
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
