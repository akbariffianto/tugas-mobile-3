import 'package:flutter/material.dart';

class AnggotaPage extends StatelessWidget {
  final List<Map<String, String>> anggota = [
    {
      'nama': 'Fahmi Kariem',
      'nim': '123220028',
    },
    {
      'nama': 'Windy Claudia N',
      'nim': '123220029',
    },
    {
      'nama': 'Akbar Ariffianto',
      'nim': '123220004',
    },
    {
      'nama': 'Teknologi Pemrograman Mobile',
      'nim': 'IF-D',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Anggota"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: anggota.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Text(
                      anggota[index]['nama']![0],
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    anggota[index]['nama']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    anggota[index]['nim']!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
