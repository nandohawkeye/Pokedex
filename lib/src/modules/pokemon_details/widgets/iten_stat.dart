import 'package:flutter/material.dart';
import 'package:pokedex/src/modules/pokemon_details/utils/handle_stat_pokemon_color.dart';
import 'package:pokedex/src/modules/pokemon_details/utils/handle_stat_pokemon_icon.dart';
import 'package:pokedex/src/shared/models/pokemon_stats_model.dart';
import 'package:pokedex/src/shared/utils/text_utils.dart';

class ItenStat extends StatelessWidget {
  const ItenStat({Key? key, required this.stat}) : super(key: key);

  final PokemonStatsModel stat;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Icon(
              handleIconPokemonStat(stat.name),
              color: handleColorPokemonStat(stat.name),
            ),
          ),
          Text(
            captalize('${stat.name} : '),
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            '${stat.baseStat}',
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(width: 6),
          Expanded(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation(
                          handleColorPokemonStat(stat.name)),
                      value: stat.baseStat / 100)))
        ],
      ),
    );
  }
}
