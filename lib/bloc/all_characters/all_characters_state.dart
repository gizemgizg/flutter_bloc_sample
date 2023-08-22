part of 'all_characters_bloc.dart';

enum AllCharactersStatus { initial, success, error, loading }

extension AllCharactersStatusX on AllCharactersStatus {
  bool get isInitial => this == AllCharactersStatus.initial;
  bool get isSuccess => this == AllCharactersStatus.success;
  bool get isError => this == AllCharactersStatus.error;
  bool get isLoading => this == AllCharactersStatus.loading;
}

class AllCharactersState {
  AllCharactersState({
    this.status = AllCharactersStatus.initial,
    CharactersModel? charactersModels,
  }) : charactersModel = charactersModels ??
            CharactersModel(
                data: [],
                info: Info(
                    count: 0, nextPage: '', previousPage: null, totalPages: 0));

  final CharactersModel charactersModel;
  final AllCharactersStatus status;

  @override
  List<Object?> get props => [status, charactersModel];

  AllCharactersState copyWith({
    CharactersModel? charactersModel,
    AllCharactersStatus? status,
  }) {
    return AllCharactersState(
      charactersModels: charactersModel ?? this.charactersModel,
      status: status ?? this.status,
    );
  }

  void getCharactersDetails(
      int index, BuildContext context, CharactersModel charactersModel) {
    final data = charactersModel.data.elementAt(index);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(
                  data: data,
                )));
  }
}
