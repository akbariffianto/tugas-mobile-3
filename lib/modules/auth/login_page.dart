import 'package:flutter/material.dart';
import '../../core/session/session_manager.dart';
import '../dashboard_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login(BuildContext context) async {
    // List of valid usernames
    final List<String> validUsernames = ['123220004', '123220028', '123220029'];
    final String correctPassword = '12345';

    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      // Check if username is in the valid list and password matches
      if (validUsernames.contains(_emailController.text) && 
          _passwordController.text == correctPassword) {
        await SessionManager.login();
        SessionManager.setUsername(_emailController.text); // Add this line
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Login berhasil!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Username atau password salah!")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Username dan password harus diisi!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Mengganti CircleAvatar dengan Text
            Text(
              "Login Here!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            // Email input field
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Username",  // Changed from "Email" to "Username"
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),  // Changed from email icon to person icon
              ),
            ),
            SizedBox(height: 20),
            // Password input field
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            // Tombol LOGIN dengan gradasi
            Container(
              width: double.infinity, // Membuat tombol mengisi lebar penuh
              height: 50, // Tinggi tetap untuk tombol
              child: ElevatedButton(
                onPressed: () => _login(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
