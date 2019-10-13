// To parse this JSON data, do
//
//     final uitslag = uitslagFromJson(jsonString);

import 'dart:convert';

List<Uitslag> uitslagFromJson(String str) => List<Uitslag>.from(json.decode(str).map((x) => Uitslag.fromJson(x)));

String uitslagToJson(List<Uitslag> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Uitslag {
    String datum;
    String home;
    String away;
    String uitslag;

    Uitslag({
        this.datum,
        this.home,
        this.away,
        this.uitslag,
    });

    factory Uitslag.fromJson(Map<String, dynamic> json) => Uitslag(
        datum: json["datum"],
        home: json["home"],
        away: json["away"],
        uitslag: json["uitslag"],
    );

    Map<String, dynamic> toJson() => {
        "datum": datum,
        "home": home,
        "away": away,
        "uitslag": uitslag,
    };
}