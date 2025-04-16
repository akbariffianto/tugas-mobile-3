import 'package:flutter/material.dart';
import '../../core/session/session_manager.dart';
import '../dashboard_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  void _login(BuildContext context) async {
    if (_controller.text.isNotEmpty) {
      //hrusnya disini cek kreden
      await SessionManager.login();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login berhasil!")),
      );
      // NANTI: Pindah ke Dashboard
      Navigator.pushReplacement(context,
      MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Nama atau Email"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
