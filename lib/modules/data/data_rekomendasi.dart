import 'package:tugas_tpm_3/modules/model/model_rekomendasi.dart';

class DataRekomendasi {
  static List<ModelRekomendasi> games = [
    ModelRekomendasi(
      nama: "Mobile Legends",
      deskripsi:
          "Game MOBA (Multiplayer Online Battle Arena) yang sangat populer di platform mobile. Pemain mengontrol karakter pahlawan dan bertarung dalam tim untuk menghancurkan basis lawan, sambil mempertahankan basis mereka sendiri. Setiap hero memiliki kemampuan unik, dan permainan memerlukan strategi tim yang baik.",
      gambar: "assets/images/ml.jpg",
      likes: 768,
      harga: 0,
      link: "https://play.google.com/store/apps/details?id=com.mobile.legends",
    ),
    ModelRekomendasi(
      nama: "Stardew Valley",
      deskripsi:
          "Game simulasi bertani di mana pemain mengelola sebuah pertanian yang diturunkan kepada mereka. Pemain dapat menanam tanaman, merawat hewan, menjelajahi gua untuk mencari bahan berharga, serta berinteraksi dengan penduduk desa dan membangun hubungan.",
      gambar: "assets/images/stardew.jpg",
      likes: 1079,
      harga: 66000,
      link:
          "https://play.google.com/store/apps/details?id=com.chucklefish.stardewvalley",
    ),
    ModelRekomendasi(
      nama: "Block Blast",
      deskripsi:
          "Game puzzle yang menyenangkan di mana pemain menyusun balok warna-warni untuk membentuk baris atau kolom penuh, yang akan menghilang dan memberikan skor. Game ini menantang pemain untuk berpikir cepat dan strategis dalam mengatur balok.",
      gambar: "assets/images/block.jpg",
      likes: 548,
      harga: 0,
      link: "https://play.google.com/store/apps/details?id=com.block.juggle",
    ),
    ModelRekomendasi(
      nama: "Last War",
      deskripsi:
          "Game strategi real-time di mana pemain membangun basis, mengumpulkan sumber daya, melatih pasukan, dan bertempur melawan pemain lain atau musuh AI. Tujuannya adalah untuk mengalahkan lawan dan menguasai dunia permainan.",
      gambar: "assets/images/lastwar.jpg",
      likes: 50,
      harga: 0,
      link: "https://play.google.com/store/apps/details?id=com.fun.lastwar.gp",
    ),
    ModelRekomendasi(
      nama: "Free Fire",
      deskripsi:
          "Game battle royale di mana 50 pemain terjun ke sebuah pulau dan bertarung hingga hanya satu pemain atau tim yang tersisa. Pemain harus mengumpulkan senjata dan perlengkapan sambil menghindari zona yang semakin mengecil, dengan tujuan bertahan hidup.",
      gambar: "assets/images/ff.jpg",
      likes: 7,
      harga: 0,
      link: "https://play.google.com/store/apps/details?id=com.dts.freefireth",
    ),
  ];
}
