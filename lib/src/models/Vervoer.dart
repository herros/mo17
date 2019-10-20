// To parse this JSON data, do
//
//     final vervoer = vervoerFromJson(jsonString);

import 'dart:convert';

List<Vervoer> vervoerFromJson(String str) => List<Vervoer>.from(json.decode(str).map((x) => Vervoer.fromJson(x)));

String vervoerToJson(List<Vervoer> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vervoer {
    String datum;
    String text;

    Vervoer({
        this.datum,
        this.text,
    });

    factory Vervoer.fromJson(Map<String, dynamic> json) => Vervoer(
        datum: json["datum"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "datum": datum,
        "text": text,
    };
}
