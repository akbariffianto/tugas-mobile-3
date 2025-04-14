import 'package:flutter/material.dart';
import 'menu/stopwatch_page.dart';
import 'menu/jenis_bilangan_page.dart';
// import 'menu/tracking_lbs_page.dart';
import 'menu/konversi_waktu_page.dart';
// import 'menu/situs_rekomendasi_page.dart';

class HomePage extends StatelessWidget {
  final List<_MenuItem> _menuItems = [
    _MenuItem("Stopwatch", Icons.timer, StopwatchPage()),
    _MenuItem("Jenis Bilangan", Icons.calculate, JenisBilanganPage()),
    // _MenuItem("Tracking Lokasi", Icons.location_on, TrackingLBSPage()),
    _MenuItem("Konversi Waktu", Icons.access_time, KonversiWaktuPage()),
    // _MenuItem("Situs Rekomendasi", Icons.link, SitusRekomendasiPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda")),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _menuItems.length,
        itemBuilder: (context, index) {
          final item = _menuItems[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Icon(item.icon, size: 32),
              title: Text(item.title),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item.page),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final Widget page;
  _MenuItem(this.title, this.icon, this.page);
}
