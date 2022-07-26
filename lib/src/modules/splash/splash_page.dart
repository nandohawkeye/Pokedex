import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/src/core/constants/assets_images.dart';
import 'package:pokedex/src/core/constants/hero_tags.dart';
import 'package:pokedex/src/core/constants/route_paths.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1))
        .then((_) => context.go(RoutePaths.home));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          )),
      body: Material(
          color: Colors.transparent,
          child: Hero(
            tag: HeroTags.logo,
            child: Container(
              alignment: Alignment.center,
              color: Colors.white,
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                AssetsImages.logo,
                width: (MediaQuery.of(context).size.width / 3) * 2,
              ),
            ),
          )),
    );
  }
}
