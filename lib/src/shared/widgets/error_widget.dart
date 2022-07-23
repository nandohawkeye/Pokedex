import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedex/src/core/constants/assets_lottie.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';

class ErroWidget extends StatelessWidget {
  const ErroWidget({Key? key, this.onRetry, this.failure}) : super(key: key);

  final Function()? onRetry;
  final IFailure? failure;

  @override
  Widget build(BuildContext context) {
    String errorMensage = failure?.mensage ?? '';
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            height: 200, width: 200, child: Lottie.asset(AssetsLottie.error)),
        const SizedBox(height: 12),
        Text('Ocorreu um erro $errorMensage',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            )),
        const SizedBox(height: 12),
        FittedBox(
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: onRetry,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.red[400]!,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red.withOpacity(0.25),
                          offset: const Offset(0, 5),
                          blurRadius: 15)
                    ]),
                height: 44,
                child: const Text('Tentar novamente',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white))),
          ),
        )
      ],
    ));
  }
}
