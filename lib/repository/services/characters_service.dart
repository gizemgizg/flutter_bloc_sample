import 'dart:convert';

import 'package:bloc_sample/repository/models/characters_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/one_character_model.dart';

class CharactersService {
  CharactersService({
    http.Client? httpClient,
    this.baseUrl = 'https://api.disneyapi.dev',
  }) : _httpClient = httpClient ?? http.Client();

  final String baseUrl;
  final Client _httpClient;

  Uri getUrl({
    required String url,
  }) {
    return Uri.parse('$baseUrl/$url').replace();
  }

  Future<CharactersModel> getAllCharacters() async {
    final response = await _httpClient.get(
   getUrl(url: "character")
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return CharactersModel.fromJson(
          json.decode(response.body),
        );
      } else {
        throw Exception;
      }
    } else {
      throw Exception;
    }
  }

  Future<OneCharacterModel> getCharacter({required int characterId}) async {
    final response = await _httpClient.get(
      getUrl(url: 'character/${characterId.toString()}'),
    );
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        return OneCharacterModel.fromJson(
          json.decode(response.body),
        );
      } else {
        throw Exception;
      }
    } else {
      throw Exception;
    }
  }
}
