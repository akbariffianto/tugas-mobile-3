import 'package:flutter/material.dart';

class KonversiWaktuPage extends StatefulWidget {
  @override
  _KonversiWaktuPageState createState() => _KonversiWaktuPageState();
}

class _KonversiWaktuPageState extends State<KonversiWaktuPage> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";
  String _satuan = "Tahun";

  final Map<String, int> _konversiDetik = {
    "Tahun": 31536000, // 365 * 24 * 60 * 60
    "Bulan": 2592000, // 30 * 24 * 60 * 60
    "Hari": 86400,
    "Jam": 3600,
    "Menit": 60,
    "Detik": 1,
  };

  void _konversiWaktu() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _hasil = "Masukkan nilai waktu terlebih dahulu.";
      });
      return;
    }

    final double? nilai = double.tryParse(input);
    if (nilai == null || nilai < 0) {
      setState(() {
        _hasil = "Input tidak valid.";
      });
      return;
    }

    int totalDetik = (nilai * _konversiDetik[_satuan]!).round();

    int tahun = totalDetik ~/ _konversiDetik["Tahun"]!;
    int sisaTahun = totalDetik % _konversiDetik["Tahun"]!;
    int bulan = sisaTahun ~/ _konversiDetik["Bulan"]!;
    int sisaBulan = sisaTahun % _konversiDetik["Bulan"]!;
    int hari = sisaBulan ~/ _konversiDetik["Hari"]!;
    int jam = (sisaBulan % _konversiDetik["Hari"]!) ~/ _konversiDetik["Jam"]!;
    int menit = (totalDetik % 3600) ~/ 60;
    int detik = totalDetik % 60;

    setState(() {
      _hasil = """
Konversi Waktu:
- Tahun: $tahun
- Bulan: $bulan
- Hari: $hari
- Jam: $jam
- Menit: $menit
- Detik: $detik
""";
    });
  }

  void _reset() {
    _controller.clear();
    setState(() {
      _hasil = "";
      _satuan = "Tahun";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konversi Waktu")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "Masukkan nilai waktu",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              DropdownButton<String>(
                value: _satuan,
                items: _konversiDetik.keys.map((satuan) {
                  return DropdownMenuItem(
                    value: satuan,
                    child: Text(satuan),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _satuan = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: _konversiWaktu, child: Text("Konversi")),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: _reset, child: Text("Reset")),
                ],
              ),
              SizedBox(height: 30),
              Text(
                _hasil,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
