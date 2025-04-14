import 'package:flutter/material.dart';
import '../../core/session/session_manager.dart';
import '../auth/login_page.dart';

class BantuanPage extends StatelessWidget {
  void _logout(BuildContext context) async {
    await SessionManager.logout();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bantuan")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("📋 Petunjuk Penggunaan:"),
            SizedBox(height: 8),
            Text("- Menu Beranda untuk fitur utama"),
            Text("- Menu Anggota untuk lihat tim"),
            Text("- Menu Bantuan ini untuk keluar"),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => _logout(context),
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
