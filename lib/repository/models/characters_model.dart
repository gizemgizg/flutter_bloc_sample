// To parse this JSON data, do
//
//     final charactersModel = charactersModelFromJson(jsonString);

import 'dart:convert';

CharactersModel charactersModelFromJson(String str) => CharactersModel.fromJson(json.decode(str));

String charactersModelToJson(CharactersModel data) => json.encode(data.toJson());

class CharactersModel {
    Info info;
    List<Datum> data;

    
    CharactersModel({
        required this.info,
        required this.data,
    });

    factory CharactersModel.fromJson(Map<String, dynamic> json) => CharactersModel(
        info: Info.fromJson(json["info"]),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}


class Datum {
    int id;
    List<String> films;
    List<dynamic> shortFilms;
    List<String> tvShows;
    List<String> videoGames;
    List<String> parkAttractions;
    List<dynamic> allies;
    List<dynamic> enemies;
    String sourceUrl;
    String name;
    String? imageUrl;
    DateTime createdAt;
    DateTime updatedAt;
    String url;
    int v;

    Datum({
        required this.id,
        required this.films,
        required this.shortFilms,
        required this.tvShows,
        required this.videoGames,
        required this.parkAttractions,
        required this.allies,
        required this.enemies,
        required this.sourceUrl,
        required this.name,
        this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
        required this.url,
        required this.v,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        films: List<String>.from(json["films"].map((x) => x)),
        shortFilms: List<dynamic>.from(json["shortFilms"].map((x) => x)),
        tvShows: List<String>.from(json["tvShows"].map((x) => x)),
        videoGames: List<String>.from(json["videoGames"].map((x) => x)),
        parkAttractions: List<String>.from(json["parkAttractions"].map((x) => x)),
        allies: List<dynamic>.from(json["allies"].map((x) => x)),
        enemies: List<dynamic>.from(json["enemies"].map((x) => x)),
        sourceUrl: json["sourceUrl"],
        name: json["name"],
        imageUrl: json["imageUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        url: json["url"],
        v: json["__v"],
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
        "sourceUrl": sourceUrl,
        "name": name,
        "imageUrl": imageUrl,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "url": url,
        "__v": v,
    };
}

class Info {
    int count;
    int totalPages;
    dynamic previousPage;
    String nextPage;

    Info({
        required this.count,
        required this.totalPages,
        required this.previousPage,
        required this.nextPage,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        totalPages: json["totalPages"],
        previousPage: json["previousPage"],
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "totalPages": totalPages,
        "previousPage": previousPage,
        "nextPage": nextPage,
    };
}
