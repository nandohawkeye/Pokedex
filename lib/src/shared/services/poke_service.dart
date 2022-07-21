import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/src/core/constants/pokedex_const.dart';
import 'package:pokedex/src/core/interfaces/i_client_http.dart';
import 'package:pokedex/src/core/interfaces/i_failure.dart';
import 'package:pokedex/src/shared/failures/server_failute.dart';
import 'package:pokedex/src/shared/models/pokemon_details_model.dart';
import 'package:pokedex/src/shared/models/pokemon_model.dart';

@Injectable()
class PokeService {
  PokeService(this._client);

  final IClientHttp _client;

  Future<Either<IFailure, List<PokemonModel>>> getAllPokemons() async {
    final result = await _client.get(PokedexConsts.endPointAll);

    return result.fold((failure) => left(failure), (data) {
      if (data.statusCode != 200) {
        return left(
            ServerFailure(mensage: 'erro status code: ${data.statusCode}'));
      }

      if (data.data == null) {
        return left(ServerFailure(mensage: 'Empty data'));
      }

      return right(List<PokemonModel>.from(
          data.data!['results'].map((p) => PokemonModel.fromJson(p))));
    });
  }

  Future<Either<IFailure, PokemonDetailsModel>> getPokemon(
      String pokemonName) async {
    final result = await _client.get('${PokedexConsts.endPoint}$pokemonName');

    return result.fold((failure) => left(failure), (data) {
      if (data.statusCode != 200) {
        return left(
            ServerFailure(mensage: 'erro status code: ${data.statusCode}'));
      }

      if (data.data == null) {
        return left(ServerFailure(mensage: 'Empty data'));
      }

      return right(PokemonDetailsModel.fronJson(data.data!));
    });
  }
}