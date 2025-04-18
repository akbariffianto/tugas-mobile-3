import 'package:flutter/material.dart';
import 'screens/beranda/beranda_page.dart';
import 'screens/anggota/anggota_page.dart';
import 'screens/bantuan/bantuan_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    BerandaPage(),
    AnggotaPage(),
    BantuanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Anggota'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
        ],
      ),
    );
  }
}
