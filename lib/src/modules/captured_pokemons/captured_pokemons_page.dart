import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex/injection.dart';
import 'package:pokedex/src/modules/captured_pokemons/captured_pokemons_controller.dart';
import 'package:pokedex/src/modules/captured_pokemons/widgets/gridview_captured_pokemons.dart';
import 'package:pokedex/src/shared/widgets/empty_widget.dart';
import 'package:pokedex/src/shared/widgets/error_widget.dart';
import 'package:pokedex/src/shared/widgets/pokeloader.dart';

class CapturedPokemonsPage extends StatefulWidget {
  const CapturedPokemonsPage({Key? key}) : super(key: key);

  @override
  State<CapturedPokemonsPage> createState() => _CapturedPokemonsPageState();
}

class _CapturedPokemonsPageState extends State<CapturedPokemonsPage> {
  final _controller = getIt<CapturedPokemonsController>();

  @override
  void initState() {
    super.initState();
    _controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Obx(
        () => _controller.failure != null
            ? Center(
                child: ErroWidget(
                failure: _controller.failure,
                onRetry: () => _controller.getPokemons(),
              ))
            : _controller.pokemons == null
                ? const PokeLoader()
                : _controller.pokemons!.isEmpty
                    ? const EmptyWidget()
                    : GridViewCapturedPokemons(
                        pokemons: _controller.pokemons!,
                      ),
      ),
    );
  }
}
