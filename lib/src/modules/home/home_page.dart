import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/src/modules/home/home_controller.dart';
import 'package:pokedex/src/modules/home/widgets/pokemon_card.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pokedex'),
      ),
      body: Obx(() => _controller.hasPokemons
          ? GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                mainAxisExtent: 50,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              itemCount: _controller.pokemons!.length,
              itemBuilder: (context, index) =>
                  PokemonCard(pokemon: _controller.pokemons![index]))
          : Container(color: Colors.blue)),
    );
  }
}
