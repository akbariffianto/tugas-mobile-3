import 'package:flutter/material.dart';
import 'core/session/session_manager.dart';
import 'modules/auth/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await SessionManager.isLoggedIn();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      debugShowCheckedModeBanner: false,
      home: LoginPage(), // NANTI akan diganti jadi `isLoggedIn ? DashboardPage() : LoginPage()`
    );
  }
}
