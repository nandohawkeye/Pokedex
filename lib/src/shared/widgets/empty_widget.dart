import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/core/constants/assets_lottie.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset(AssetsLottie.empty),
            ),
            const SizedBox(height: 12),
            const Text('Nenhum Pokemon capturado',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                )),
          ],
        ),
      ),
    );
  }
}
