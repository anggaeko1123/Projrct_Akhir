import 'dart:convert';

List<DataDummy> dataDummyFromJson(String str) => List<DataDummy>.from(json.decode(str).map((x) => DataDummy.fromJson(x)));

String dataDummyToJson(List<DataDummy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataDummy {
  DataDummy({
    required this.judul,
    required this.cover,
    required this.tahun,
    required this.kategori,
    required this.deskripsi,
    required this.isi,
    required this.rating,
    required this.id,
  });

  String judul;
  String cover;
  String tahun;
  String kategori;
  String deskripsi;
  String isi;
  String rating;
  String id;

  factory DataDummy.fromJson(Map<String, dynamic> json) => DataDummy(
    judul: json["judul"],
    cover: json["cover"],
    tahun: json["tahun"],
    kategori: json["kategori"],
    deskripsi: json["deskripsi"],
    isi: json["isi"],
    rating: json["rating"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "judul": judul,
    "cover": cover,
    "tahun": tahun,
    "kategori": kategori,
    "deskripsi": deskripsi,
    "isi": isi,
    "rating": rating,
    "id": id,
  };
}