class ModelRekomendasi {
  String gambar;
  String nama;
  String deskripsi;
  String link;
  int harga;
  int likes;
  bool favorite;

  ModelRekomendasi({
    required this.nama,
    required this.deskripsi,
    required this.gambar,
    required this.likes,
    required this.link,
    this.harga = 0,
    this.favorite = false,
  });
}

