import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/src/core/constants/assets_images.dart';
import 'package:pokedex/src/core/constants/route_paths.dart';
import 'package:pokedex/src/modules/home/home_controller.dart';
import 'package:pokedex/src/modules/home/widgets/header_home.dart';
import 'package:pokedex/src/modules/home/widgets/pokemon_bottomsheet.dart';
import 'package:pokedex/src/modules/home/widgets/pokemons_gridview.dart';
import 'package:pokedex/src/modules/home/widgets/textformfield_home.dart';
import 'package:pokedex/src/shared/widgets/error_widget.dart';
import 'package:pokedex/src/shared/widgets/no_connection_widget.dart';
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
        context.push('${RoutePaths.pokemonDetails}/$pokemonName');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const HeaderHome(),
          Obx(() => !_controller.isConnected
              ? const NoConnectionWidget()
              : _controller.failure != null
                  ? ErroWidget(
                      failure: _controller.failure,
                      onRetry: () => _controller.getAllPokemons(),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormFieldHome(
                              onChanged: _controller.onChangeSearchPokemon),
                          Expanded(
                            child: _controller.hasPokemons
                                ? PokemonsGridView(
                                    onTap: callBottomsheet,
                                    pokemons: _controller.pokemons!,
                                  )
                                : const PokeLoader(),
                          )
                        ],
                      ),
                    )),
        ],
      ),
      floatingActionButton: AnimationConfiguration.synchronized(
        child: ScaleAnimation(
          child: FloatingActionButton(
            onPressed: () => context.push(RoutePaths.capturedPokemons),
            backgroundColor: Colors.red,
            child: Image.asset(AssetsImages.pokebola, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
