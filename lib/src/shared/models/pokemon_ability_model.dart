class PokemonAbilityModel {
  PokemonAbilityModel({
    required this.pokemonName,
    required this.name,
    required this.isHidden,
  });

  final String pokemonName;
  final String name;
  final bool isHidden;

  factory PokemonAbilityModel.fromJson(
          Map<String, dynamic> json, String pokemonName) =>
      PokemonAbilityModel(
        pokemonName: pokemonName,
        isHidden: json['is_hidden'],
        name: json['ability']['name'],
      );
}
