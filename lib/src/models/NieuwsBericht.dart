// To parse this JSON data, do
//
//     final nieuwsBericht = nieuwsBerichtFromJson(jsonString);

import 'dart:convert';

List<NieuwsBericht> nieuwsBerichtFromJson(String str) => List<NieuwsBericht>.from(json.decode(str).map((x) => NieuwsBericht.fromJson(x)));

String nieuwsBerichtToJson(List<NieuwsBericht> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NieuwsBericht {
    String datum;
    String text;

    NieuwsBericht({
        this.datum,
        this.text,
    });

    factory NieuwsBericht.fromJson(Map<String, dynamic> json) => NieuwsBericht(
        datum: json["datum"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "datum": datum,
        "text": text,
    };
}
