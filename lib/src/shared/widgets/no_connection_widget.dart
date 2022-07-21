import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/core/constants/assets_lottie.dart';

class NoConnectionWidget extends StatelessWidget {
  const NoConnectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 200),
        SizedBox(
            height: 200,
            width: 200,
            child: Lottie.asset(AssetsLottie.noConnection)),
        const SizedBox(height: 12),
        const Text('Sem conexão!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
      ],
    ));
  }
}
