// dashboard_screen.dart

import 'package:dog_task/provider/dog_provider.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final DogProvider dogProvider;

  DashboardScreen(this.dogProvider);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Dashboard'),
      ),
      body: Column(
        children: [
          // Random dog by breed
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                dogProvider.fetchRandomDogByBreed('bulldog');
              },
              child: Text('Fetch random bulldog'),
            ),
          ),
          if (dogProvider.randomDogByBreed != null)
            Image.network(dogProvider.randomDogByBreed!.message),

          // Dogs by breed
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                dogProvider.fetchDogsByBreed('beagle');
              },
              child: Text('Fetch all beagles'),
            ),
          ),
          if (dogProvider.dogsByBreed != null)
            ListView.builder(
              itemCount: dogProvider.dogsByBreed!.length,
              itemBuilder: (context, index) {
                final dog = dogProvider.dogsByBreed![index];
                return Image.network(dog.message);
              },
            ),

          // Random dog by breed and sub breed
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                dogProvider.fetchRandomDogByBreedAndSubBreed(
                    'bulldog', 'french');
              },
              child: Text('Fetch random French Bulldog'),
            ),
          ),
          if (dogProvider.randomDogByBreedAndSubBreed != null)
            Image.network(dogProvider.randomDogByBreedAndSubBreed!.message),

          // Dogs by breed and sub breed
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                dogProvider.fetchDogsByBreedAndSubBreed('hound', 'basset');
              },
              child: Text('Fetch all Basset Hounds'),
            ),
          ),
          if (dogProvider.dogsByBreedAndSubBreed != null)
            ListView.builder(
              itemCount: dogProvider.dogsByBreedAndSubBreed!.length,
              itemBuilder: (context, index) {
                final dog = dogProvider.dogsByBreedAndSubBreed![index];
                return Image.network(dog.message);
              },
            ),
        ],
      ),
    );
  }
}
