// dog_service.dart

import 'dart:async';
import 'package:http/http.dart' as http;

class DogCeoApi {
  final http.Client client;

  DogCeoApi(this.client);

  Future<http.Response> getRandomDogByBreed(String breed) async {
    final uri = Uri.parse('https://dog.ceo/api/breed/$breed/images/random');
    return await client.get(uri);
  }

  Future<http.Response> getDogsByBreed(String breed) async {
    final uri = Uri.parse('https://dog.ceo/api/breed/$breed/images');

    return await client.get(uri);
  }

  Future<http.Response> getRandomDogByBreedAndSubBreed(
      String breed, String subBreed) async {
    final uri = Uri.parse('https://dog.ceo/api/breed/$breed/images');
    return await client.get(uri);
  }

  Future<http.Response> getDogsByBreedAndSubBreed(
      String breed, String subBreed) async {
    final uri = Uri.parse('https://dog.ceo/api/breed/$breed/images');
    return await client.get(uri);
  }
}
