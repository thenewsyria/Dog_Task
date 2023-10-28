import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dogImageUrl = '';

  // Function to fetch a random dog image by breed
  Future<void> fetchRandomDogImage() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        dogImageUrl = data['message'];
      });
    } else {
      // Handle error
      print('Failed to fetch a random dog image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Image Viewer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: fetchRandomDogImage,
              child: Text('Fetch Random Dog Image'),
            ),
            SizedBox(height: 20),
            if (dogImageUrl.isNotEmpty)
              Image.network(
                dogImageUrl,
                width: 200,
                height: 200,
              ),
          ],
        ),
      ),
    );
  }
}
