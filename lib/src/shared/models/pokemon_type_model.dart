class PokemonTypeModel {
  PokemonTypeModel({
    required this.pokemonName,
    required this.name,
  });

  final String pokemonName;
  final String name;

  factory PokemonTypeModel.fronJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonTypeModel(
        pokemonName: pokemonName,
        name: json['type']['name'],
      );
}
