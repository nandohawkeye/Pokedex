import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/modules/home/home_page.dart';
import 'package:pokedex/src/modules/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex/src/modules/splash/splash_page.dart';
part 'routes.g.dart';

final router = GoRouter(routes: $appRoutes);

@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context) => const SplashPage();
}

@TypedGoRoute<HomeRoute>(path: '/home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context) => const HomePage();
}

@TypedGoRoute<PokemonDetailsRoute>(path: '/pokemon-details/:pokemonName')
class PokemonDetailsRoute extends GoRouteData {
  const PokemonDetailsRoute(this.pokemonName);

  final String pokemonName;

  @override
  Widget build(BuildContext context) =>
      PokemonDetailsPage(pokemonName: pokemonName);
}
