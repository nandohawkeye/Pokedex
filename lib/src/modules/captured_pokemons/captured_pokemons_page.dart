import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/core/constants/assets_lottie.dart';

class CapturedPokemonsPage extends StatelessWidget {
  const CapturedPokemonsPage({Key? key}) : super(key: key);

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
      body: Center(
        child: SizedBox(
          height: 200,
          width: 200,
          child: Lottie.asset(AssetsLottie.empty),
        ),
      ),
    );
  }
}
