import 'package:flutter/material.dart';

import '../repository/models/characters_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Datum data;
  const CharacterDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text("Character Details Screen"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Character Name: ${data.name}"),
            const SizedBox(
              height: 30,
            ),
            const Text("Films"),
            const Divider(
              indent: 50,
              endIndent: 50,
              color: Colors.red,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.films.length,
              itemBuilder: (context, index) {
                return Center(child: Text(data.films[index]));
              },
            ),
            Center(
              child: Image.network(data.imageUrl ?? ""),
            ),
          ],
        ));
  }
}
