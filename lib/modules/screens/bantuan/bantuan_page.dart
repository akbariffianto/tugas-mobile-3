import 'package:flutter/material.dart';

class BantuanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bantuan")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Instruksi Stopwatch
              Text("📋 Petunjuk Penggunaan Stopwatch:"),
              SizedBox(height: 10),
              Text("1. Start Stopwatch: Tekan tombol Start (ikon play) untuk memulai stopwatch."),
              Text("2. Stop Stopwatch: Tekan tombol Stop (ikon pause) untuk menghentikan stopwatch."),
              Text("3. Reset Stopwatch: Tekan tombol Reset (ikon refresh) untuk mengatur ulang stopwatch ke 00:00:00.00."),
              SizedBox(height: 20),

              // Instruksi Jenis Bilangan
              Text("📋 Petunjuk Penggunaan Jenis Bilangan:"),
              SizedBox(height: 10),
              Text("1. Masukkan Bilangan: Ketikkan bilangan atau angka desimal pada kolom input."),
              Text("2. Klik Tombol 'Cek': Tekan tombol Cek untuk mengetahui jenis bilangan tersebut."),
              Text("3. Jenis Bilangan yang Muncul: Hasil analisis akan menunjukkan apakah bilangan tersebut berupa Cacah, Bulat Positif, Bulat Negatif, atau Desimal."),
              Text("4. Tombol Reset: Tekan tombol Reset untuk menghapus input dan hasil analisis."),
              SizedBox(height: 20),

              // Instruksi Tracking LBS
              Text("📋 Petunjuk Penggunaan Tracking LBS:"),
              SizedBox(height: 10),
              Text("1. Buka Menu Tracking LBS: Pilih menu Tracking LBS di aplikasi untuk mulai melacak lokasi pengguna."),
              Text("2. Menunggu Lokasi Pengguna: Aplikasi akan otomatis mencari lokasi pengguna dan menampilkan peta."),
              Text("3. Melihat Lokasi Pengguna di Peta: Lokasi pengguna akan ditandai dengan ikon navigasi berwarna merah di peta."),
              Text("4. Pemutaran Arah Lokasi: Arah pengguna akan disesuaikan dengan heading mereka, sehingga ikon akan selalu menghadap ke arah yang benar."),
              Text("5. Pembaruan Lokasi Secara Otomatis: Lokasi pengguna akan terus terupdate secara otomatis saat bergerak."),
              Text("6. Tombol untuk Keluar: Kembali ke halaman sebelumnya setelah selesai menggunakan fitur ini."),
              SizedBox(height: 20),

              // Instruksi Konversi Waktu
              Text("📋 Petunjuk Penggunaan Konversi Waktu:"),
              SizedBox(height: 10),
              Text("1. Masukkan Nilai Waktu: Ketikkan nilai waktu yang ingin kamu konversi (contoh: 5, 3.14)."),
              Text("2. Pilih Satuan Waktu: Pilih satuan waktu yang sesuai (Tahun, Bulan, Hari, Jam, Menit, Detik)."),
              Text("3. Klik Tombol 'Konversi': Tekan tombol Konversi untuk melihat hasil konversi dalam berbagai satuan waktu."),
              Text("4. Lihat Hasil Konversi: Aplikasi akan menampilkan hasil konversi waktu dalam satuan lainnya seperti Tahun, Bulan, dll."),
              Text("5. Tombol Reset: Tekan tombol Reset untuk menghapus nilai input dan hasil konversi."),
              SizedBox(height: 20),

              // Instruksi Situs Rekomendasi
              Text("📋 Petunjuk Penggunaan Situs Rekomendasi:"),
              SizedBox(height: 10),
              Text("1. Buka Menu Situs Rekomendasi: Pilih menu Situs Rekomendasi di aplikasi untuk melihat daftar game rekomendasi."),
              Text("2. Navigasi Tab: Gunakan tab Rekomendasi untuk melihat game rekomendasi dan tab Favorit untuk melihat game favorit."),
              Text("3. Menandai Game sebagai Favorit: Tekan ikon hati untuk menambahkan atau menghapus game dari daftar favorit."),
              Text("4. Melihat Detail Game: Tekan gambar atau nama game untuk membuka halaman lebih lanjut atau mengunjungi link yang disediakan."),
              Text("5. Menghitung Harga Game: Di bawah deskripsi, harga game akan ditampilkan. Jika game gratis, akan muncul tulisan 'Gratis'."),
              SizedBox(height: 30),

              // Tombol Kembali
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                child: Text("Kembali"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
