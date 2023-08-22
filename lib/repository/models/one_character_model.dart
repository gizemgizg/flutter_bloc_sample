
import 'dart:convert';

OneCharacterModel oneCharacterModelFromJson(String str) => OneCharacterModel.fromJson(json.decode(str));

String oneCharacterModelToJson(OneCharacterModel data) => json.encode(data.toJson());

class OneCharacterModel {
    Info info;
    Data data;

    OneCharacterModel({
        required this.info,
        required this.data,
    });

    factory OneCharacterModel.fromJson(Map<String, dynamic> json) => OneCharacterModel(
        info: Info.fromJson(json["info"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "data": data.toJson(),
    };
}

class Data {
    int id;
    List<String> films;
    List<String> shortFilms;
    List<String> tvShows;
    List<String> videoGames;
    List<String> parkAttractions;
    List<dynamic> allies;
    List<dynamic> enemies;
    String name;
    String imageUrl;
    String url;

    Data({
        required this.id,
        required this.films,
        required this.shortFilms,
        required this.tvShows,
        required this.videoGames,
        required this.parkAttractions,
        required this.allies,
        required this.enemies,
        required this.name,
        required this.imageUrl,
        required this.url,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        films: List<String>.from(json["films"].map((x) => x)),
        shortFilms: List<String>.from(json["shortFilms"].map((x) => x)),
        tvShows: List<String>.from(json["tvShows"].map((x) => x)),
        videoGames: List<String>.from(json["videoGames"].map((x) => x)),
        parkAttractions: List<String>.from(json["parkAttractions"].map((x) => x)),
        allies: List<dynamic>.from(json["allies"].map((x) => x)),
        enemies: List<dynamic>.from(json["enemies"].map((x) => x)),
        name: json["name"],
        imageUrl: json["imageUrl"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "films": List<dynamic>.from(films.map((x) => x)),
        "shortFilms": List<dynamic>.from(shortFilms.map((x) => x)),
        "tvShows": List<dynamic>.from(tvShows.map((x) => x)),
        "videoGames": List<dynamic>.from(videoGames.map((x) => x)),
        "parkAttractions": List<dynamic>.from(parkAttractions.map((x) => x)),
        "allies": List<dynamic>.from(allies.map((x) => x)),
        "enemies": List<dynamic>.from(enemies.map((x) => x)),
        "name": name,
        "imageUrl": imageUrl,
        "url": url,
    };
}

class Info {
    int count;

    Info({
        required this.count,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
    };
}
