import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.id,
    required this.judul,
    required this.cover,
    required this.tahun,
    required this.kategori,
    required this.deskripsi,
    required this.isi,
    required this.rating,
  });

  String id;
  String judul;
  String cover;
  String tahun;
  String kategori;
  String deskripsi;
  String isi;
  String rating;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    id: json["id"],
    judul: json["judul"],
    cover: json["cover"],
    tahun: json["tahun"],
    kategori: json["kategori"],
    deskripsi: json["deskripsi"],
    isi: json["isi"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "judul": judul,
    "cover": cover,
    "tahun": tahun,
    "kategori": kategori,
    "deskripsi": deskripsi,
    "isi": isi,
    "rating": rating,
  };
}
