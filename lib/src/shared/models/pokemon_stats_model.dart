class PokemonStatsModel {
  PokemonStatsModel({
    required this.pokemonName,
    required this.baseStat,
    required this.effort,
    required this.name,
  });

  final String pokemonName;
  final int baseStat;
  final int effort;
  final String name;

  factory PokemonStatsModel.fronJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonStatsModel(
        pokemonName: pokemonName,
        baseStat: json['base_stat'],
        effort: json['effort'],
        name: json['stat']['name'],
      );
}
