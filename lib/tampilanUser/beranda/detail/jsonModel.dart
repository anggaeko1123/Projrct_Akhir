class DataModel{
  int? id;
  String? judul;
  String? cover;
  String? tahun_terbit;
  String? kategoribuku;
  String? rating;
  String? deskripsi;
  String? isi;

  DataModel(
      {
        this.id,
        this.judul,
        this.cover,
        this.tahun_terbit,
        this.kategoribuku,
        this.rating,
        this.deskripsi,
        this.isi
      }
      );

  DataModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    judul = json['judul'];
    cover = json['cover'];
    tahun_terbit = json['tahun_terbit'];
    kategoribuku = json['kategoribuku'];
    rating = json['rating'];
    deskripsi = json['deskripsi'];
    isi = json['isi'];
  }
}