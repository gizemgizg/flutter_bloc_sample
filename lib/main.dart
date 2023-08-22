import 'package:bloc_sample/bloc/all_characters/all_characters_bloc.dart';
import 'package:bloc_sample/repository/services/characters_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/characters_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Sample Bloc',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider(
            create: (context) => CharactersService(),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<AllCharactersBloc>(
                  create: (context) => AllCharactersBloc(
                    charactersService: context.read<CharactersService>(),
                  )..add(AllCharactersEvent()),
                ),
              ],
              child: const CharactersScreen(),
            )));
  }
}
