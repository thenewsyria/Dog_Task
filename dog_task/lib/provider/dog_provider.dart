// dog_provider.dart

import 'package:dog_task/model/dog_model.dart';
import 'package:dog_task/service/dog_service.dart';
import 'package:flutter/material.dart';

class DogProvider extends ChangeNotifier {
  final DogService dogService;

  DogProvider(this.dogService);

  DogResponse? _randomDogByBreed;
  List<DogResponse>? _dogsByBreed;
  DogResponse? _randomDogByBreedAndSubBreed;
  List<DogResponse>? _dogsByBreedAndSubBreed;

  DogResponse? get randomDogByBreed => _randomDogByBreed;
  List<DogResponse>? get dogsByBreed => _dogsByBreed;
  DogResponse? get randomDogByBreedAndSubBreed => _randomDogByBreedAndSubBreed;
  List<DogResponse>? get dogsByBreedAndSubBreed => _dogsByBreedAndSubBreed;

  void fetchRandomDogByBreed(String breed) async {
    _randomDogByBreed = await dogService.fetchRandomDogByBreed(breed);
    notifyListeners();
  }

  void fetchDogsByBreed(String breed) async {
    _dogsByBreed = await dogService.fetchDogsByBreed(breed);
    notifyListeners();
  }

  void fetchRandomDogByBreedAndSubBreed(String breed, String subBreed) async {
    _randomDogByBreedAndSubBreed =
        await dogService.fetchRandomDogByBreedAndSubBreed(breed, subBreed);
    notifyListeners();
  }

  void fetchDogsByBreedAndSubBreed(String breed, String subBreed) async {
    _dogsByBreedAndSubBreed =
        await dogService.fetchDogsByBreedAndSubBreed(breed, subBreed);
    notifyListeners();
  }
}
