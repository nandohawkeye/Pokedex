import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/iten_info.dart';
import 'package:pokedex/src/modules/pokemon_details/widgets/iten_type.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';

class PokemonInfoAndTypes extends StatelessWidget {
  const PokemonInfoAndTypes({Key? key, this.pokemon}) : super(key: key);

  final PokemonDetailsModel? pokemon;

  @override
  Widget build(BuildContext context) {
    return pokemon == null
        ? SizedBox.fromSize()
        : AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: SizedBox(
                height: 50,
                child: NotificationListener<OverscrollNotification>(
                  onNotification: (notification) =>
                      notification.metrics.axisDirection != AxisDirection.left,
                  child: ListView(
                    padding: const EdgeInsets.only(left: 16),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...?pokemon?.types!
                          .map<Widget>((type) => ItemType(type: type))
                          .toList(),
                      pokemon!.experience == null
                          ? const SizedBox.shrink()
                          : ItemInfo(
                              label: 'Experiência',
                              value: '${pokemon!.experience}'),
                      pokemon!.height == null
                          ? const SizedBox.shrink()
                          : ItemInfo(
                              label: 'Altura', value: '${pokemon!.height}'),
                      pokemon!.weight == null
                          ? const SizedBox.shrink()
                          : ItemInfo(label: 'Peso', value: '${pokemon!.weight}')
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
