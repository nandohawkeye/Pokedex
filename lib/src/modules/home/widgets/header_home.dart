import 'package:flutter/material.dart';
import 'package:pokedex/src/core/constants/assets.dart';
import 'package:pokedex/src/core/constants/hero_tags.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Hero(
        tag: HeroTags.logo,
        child: Container(
          height: 100,
          width: double.infinity,
          alignment: Alignment.center,
          color: Colors.white,
          child: Image.asset(
            Assets.logo,
            height: 80,
          ),
        ),
      ),
    );
  }
}
