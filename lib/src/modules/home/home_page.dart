import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/src/core/constants/assets.dart';
import 'package:pokedex/src/core/constants/hero_tags.dart';
import 'package:pokedex/src/modules/home/home_controller.dart';
import 'package:pokedex/src/modules/home/widgets/pokemon_bottomsheet.dart';
import 'package:pokedex/src/modules/home/widgets/pokemons_gridview.dart';
import 'package:pokedex/src/shared/widgets/pokeloader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = getIt<HomeController>();

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  void callBottomsheet(String pokemonName) async {
    _controller.getPokemon(pokemonName);
    await showModalBottomSheet<bool?>(
            context: context,
            backgroundColor: Colors.transparent,
            builder: (_) =>
                Obx(() => PokemonBottomSheet(pokemon: _controller.pokemon)))
        .then((value) {
      if (value != null && value) {
        context.push('/pokemon-details/$pokemonName');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 100,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          centerTitle: true,
          title: Material(
            color: Colors.transparent,
            child: Hero(
              tag: HeroTags.logo,
              child: Image.asset(
                Assets.logo,
                height: 80,
              ),
            ),
          )),
      body: Obx(() => _controller.hasPokemons
          ? PokemonsGridView(
              onTap: callBottomsheet,
              pokemons: _controller.pokemons!,
            )
          : const PokeLoader()),
    );
  }
}
