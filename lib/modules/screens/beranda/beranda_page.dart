import 'package:flutter/material.dart';
import 'package:tugas_tpm_3/modules/screens/beranda/menu/situs_rekomendasi_page.dart';
import 'package:tugas_tpm_3/modules/screens/beranda/menu/tracking_lbs_page.dart';
import 'package:tugas_tpm_3/core/session/session_manager.dart';

import 'menu/jenis_bilangan_page.dart';
import 'menu/konversi_waktu_page.dart';
import 'menu/stopwatch_page.dart';

class BerandaPage extends StatelessWidget {
  final List<_MenuItem> _menuItems = [
    _MenuItem("Stopwatch", Icons.timer, StopwatchPage()),
    _MenuItem("Jenis Bilangan", Icons.calculate, JenisBilanganPage()),
    _MenuItem("Tracking Lokasi", Icons.location_on, TrackingLBSPage()),
    _MenuItem("Konversi Waktu", Icons.access_time, KonversiWaktuPage()),
    _MenuItem("Situs Rekomendasi", Icons.link, SitusRekomendasiPage()),
  ];

  BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda")),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            color: Colors.blue.shade50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome,",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  SessionManager.getUsername() ?? "User",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
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
