import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KonversiWaktuPage extends StatefulWidget {
  const KonversiWaktuPage({Key? key}) : super(key: key);

  @override
  _KonversiWaktuPageState createState() => _KonversiWaktuPageState();
}

class _KonversiWaktuPageState extends State<KonversiWaktuPage> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";
  String _satuan = "Tahun";
  bool _isCalculated = false;

  final Map<String, double> _konversiDetik = {
    "Tahun": 31557600.0,
    "Bulan": 2629800.0,
    "Minggu": 604800.0,
    "Hari": 86400.0,
    "Jam": 3600.0,
    "Menit": 60.0,
    "Detik": 1.0,
    "Milidetik": 0.001,
  };

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _konversiWaktu() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _hasil = "Masukkan nilai waktu terlebih dahulu.";
        _isCalculated = false;
      });
      return;
    }

    final double? nilai = double.tryParse(input);
    if (nilai == null) {
      setState(() {
        _hasil = "Input harus berupa angka.";
        _isCalculated = false;
      });
      return;
    }

    if (nilai < 0) {
      setState(() {
        _hasil = "Nilai waktu tidak bisa negatif.";
        _isCalculated = false;
      });
      return;
    }

    // Konversi input waktu ke detik berdasarkan satuan yang dipilih
    double totalDetik = nilai * _konversiDetik[_satuan]!;

    Map<String, double> results = {};

    for (String unit in _konversiDetik.keys) {
      double value = totalDetik / _konversiDetik[unit]!;
      results[unit] = value;
    }

    setState(() {
      StringBuffer buffer = StringBuffer();
      buffer.writeln("Hasil Konversi:");

      _konversiDetik.keys.forEach((unit) {
        String formattedValue;
        if (results[unit]! < 0.01 && results[unit]! > 0) {
          formattedValue = results[unit]!.toStringAsExponential(2);
        } else {
          formattedValue = results[unit]!.toStringAsFixed(
              unit == "Milidetik" ? 0 : (results[unit]! < 1 ? 4 : 2));
        }
        buffer.writeln("• $unit: $formattedValue");
      });

      _hasil = buffer.toString();
      _isCalculated = true;
    });
  }

  void _reset() {
    _controller.clear();
    setState(() {
      _hasil = "";
      _satuan = "Tahun";
      _isCalculated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Konversi Waktu"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Masukkan Nilai Waktu",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _controller,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        decoration: const InputDecoration(
                          labelText: "Nilai",
                          border: OutlineInputBorder(),
                          hintText: "Contoh: 1.5",
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d*\.?\d*')),
                        ],
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        value: _satuan,
                        decoration: const InputDecoration(
                          labelText: "Satuan Waktu",
                          border: OutlineInputBorder(),
                        ),
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
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _konversiWaktu,
                              icon: const Icon(Icons.calculate),
                              label: const Text("Konversi"),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _reset,
                              icon: const Icon(Icons.refresh),
                              label: const Text("Reset"),
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_hasil.isNotEmpty)
                Card(
                  elevation: 4,
                  color:
                      _isCalculated ? Colors.blue.shade50 : Colors.red.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _isCalculated ? "Hasil Konversi" : "Peringatan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _isCalculated
                                ? Colors.blue.shade800
                                : Colors.red.shade800,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _hasil,
                          style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: _isCalculated
                                ? Colors.black87
                                : Colors.red.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
