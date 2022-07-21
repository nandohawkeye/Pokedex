import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/src/core/constants/assets.dart';
import 'package:pokedex/src/modules/pokemon_details/pokemon_details_controller.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/pokemon_abilities.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/pokemon_info_and_types.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/pokemon_main_image.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/pokemon_moves.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/pokemon_stats.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/pokemons_animations.dart';
import 'package:pokedex/src/shared/widgets/pokeloader.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({Key? key, required this.pokemonName})
      : super(key: key);

  final String pokemonName;

  @override
  State<PokemonDetailsPage> createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  final PokemonDetailsController _controller =
      getIt<PokemonDetailsController>();

  @override
  void initState() {
    super.initState();
    _controller.getPokemon(widget.pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          widget.pokemonName,
          style: const TextStyle(color: Colors.black87),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  Assets.pokebolaBlack,
                  color: Colors.black45,
                )),
          )
        ],
      ),
      body: Obx(() => _controller.pokemon == null
          ? const Center(child: PokeLoader())
          : ListView(
              shrinkWrap: true,
              cacheExtent: MediaQuery.of(context).size.height,
              children: [
                PokemonMainImage(pokemonImage: _controller.pokemon?.imageUrl),
                PokemonInfoAndTypes(pokemon: _controller.pokemon),
                PokemonStats(pokemon: _controller.pokemon),
                PokemonAbilities(pokemon: _controller.pokemon),
                PokemonAnimations(pokemon: _controller.pokemon),
                PokemonMoves(pokemon: _controller.pokemon),
              ],
            )),
    );
  }
}
