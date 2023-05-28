import 'dart:convert';

Ebooks eboooksFromJson(String str) => Ebooks.fromJson(json.decode(str));

String eboooksToJson(Ebooks data) => json.encode(data.toJson());

class Ebooks {
  Ebooks({
    required this.data,
  });

  final List<Datum> data;

  factory Ebooks.fromJson(Map<String, dynamic> json) => Ebooks(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.judul,
    required this.cover,
    required this.tahun,
    required this.kategori,
    required this.deskripsi,
    required this.isi,
    required this.rating,
  });

  final int id;
  final String judul;
  final String cover;
  final String tahun;
  final String kategori;
  final String deskripsi;
  final String isi;
  final String rating;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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