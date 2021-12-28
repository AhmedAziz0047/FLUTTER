// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

filghtsModel FILGHTSFOMJSON(String str) => filghtsModel.fromJson(json.decode(str));

String FLIGHTSTOJSON(filghtsModel data) => json.encode(data.toJson());

class filghtsModel {
    filghtsModel({
        required this.country,
        required this.dateAller,
        required this.dateRetour,
        required this.prix,
        required this.photo,
        required this.remainingSeats,
    });

    String country;
    String dateAller;
    String dateRetour;
    int prix;
    String photo;
    int remainingSeats;

    factory filghtsModel.fromJson(Map<String, dynamic> json) => filghtsModel(
        country: json["country"],
        dateAller: json["date_aller"],
        dateRetour: json["date_retour"],
        prix: json["prix"],
        photo: json["photo"],
        remainingSeats: json["Remaining_Seats"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "date_aller": dateAller,
        "date_retour": dateRetour,
        "prix": prix,
        "photo":photo,
        "Remaining_Seats": remainingSeats,
    };
}
