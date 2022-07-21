import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/core/constants/route_paths.dart';
import 'package:pokedex/src/modules/captured_pokemons/captured_pokemons_page.dart';
import 'package:pokedex/src/modules/home/home_page.dart';
import 'package:pokedex/src/modules/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex/src/modules/splash/splash_page.dart';
part 'routes.g.dart';

final router = GoRouter(routes: $appRoutes);

@TypedGoRoute<SplashRoute>(path: RoutePaths.splash)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context) => const SplashPage();
}

@TypedGoRoute<HomeRoute>(path: RoutePaths.home)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context) => const HomePage();
}

@TypedGoRoute<PokemonDetailsRoute>(
    path: '${RoutePaths.pokemonDetails}/:pokemonName')
class PokemonDetailsRoute extends GoRouteData {
  const PokemonDetailsRoute(this.pokemonName);

  final String pokemonName;

  @override
  Widget build(BuildContext context) =>
      PokemonDetailsPage(pokemonName: pokemonName);
}

@TypedGoRoute<CapturedPokemons>(path: RoutePaths.capturedPokemons)
class CapturedPokemons extends GoRouteData {
  const CapturedPokemons();

  @override
  Widget build(BuildContext context) => const CapturedPokemonsPage();
}
