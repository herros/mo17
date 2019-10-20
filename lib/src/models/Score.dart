// To parse this JSON data, do
//
//     final score = scoreFromJson(jsonString);

import 'dart:convert';

List<Score> scoreFromJson(String str) => List<Score>.from(json.decode(str).map((x) => Score.fromJson(x)));

String scoreToJson(List<Score> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Score {
    String name;
    int goals;
    dynamic assists;
    dynamic total;

    Score({
        this.name,
        this.goals,
        this.assists,
        this.total,
    });

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        name: json["name"],
        goals: json["goals"],
        assists: json["assists"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "goals": goals,
        "assists": assists,
        "total": total,
    };
}
