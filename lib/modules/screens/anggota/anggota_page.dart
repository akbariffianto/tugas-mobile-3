import 'package:flutter/material.dart';

class AnggotaPage extends StatelessWidget {
  final List<String> anggota = ['Fahmi', 'Dina', 'Reza'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daftar Anggota")),
      body: ListView.builder(
        itemCount: anggota.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(anggota[index][0])),
            title: Text(anggota[index]),
          );
        },
      ),
    );
  }
}
