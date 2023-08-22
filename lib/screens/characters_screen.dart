import 'package:bloc_sample/bloc/all_characters/all_characters_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCharactersBloc, AllCharactersState>(
        builder: (context, state) {
      return Scaffold(
          backgroundColor: Colors.orangeAccent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Disney Characters",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.80,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: state.status.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : state.status.isSuccess
                            ? Center(
                                child: ListView.separated(
                                itemBuilder: (itemBuilder, index) {
                                  return InkWell(
                                    onTap: () => state.getCharactersDetails(
                                        index, context, state.charactersModel),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: NetworkImage(state
                                                .charactersModel
                                                .data[index]
                                                .imageUrl ??
                                            "https://i.pinimg.com/originals/49/7e/6e/497e6ef3eed5fa24b8f722a5cec94504.jpg"),
                                        backgroundColor: Colors.transparent,
                                      ),
                                      title: Text(state
                                          .charactersModel.data[index].name),
                                    ),
                                  );
                                },
                                itemCount: state.charactersModel.data.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                              ))
                            : state.status.isError
                                ? const Center(
                                    child: Text("Error"),
                                  )
                                : const SizedBox()),
              )
            ],
          ));
    });
  }
}
