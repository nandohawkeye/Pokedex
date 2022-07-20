class PokemonMoveModel {
  PokemonMoveModel({
    required this.pokemonName,
    required this.name,
  });

  final String pokemonName;
  final String name;

  factory PokemonMoveModel.fromJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonMoveModel(
        pokemonName: pokemonName,
        name: json['move']['name'],
      );
}
