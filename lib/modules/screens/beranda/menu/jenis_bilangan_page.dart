import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JenisBilanganPage extends StatefulWidget {
  const JenisBilanganPage({Key? key}) : super(key: key);

  @override
  _JenisBilanganPageState createState() => _JenisBilanganPageState();
}

class _JenisBilanganPageState extends State<JenisBilanganPage> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";
  bool _isCalculated = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _cekBilangan() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _hasil = "Masukkan bilangan terlebih dahulu.";
        _isCalculated = false;
      });
      return;
    }

    final num? number = num.tryParse(input);

    if (number == null) {
      setState(() {
        _hasil = "Input bukan bilangan valid.";
        _isCalculated = false;
      });
      return;
    }

    List<String> jenis = [];

    if (number is int || number == number.roundToDouble()) {
      int intVal = number.toInt();
      if (intVal >= 0) jenis.add("Cacah");
      if (intVal > 0) jenis.add("Bulat Positif");
      if (intVal < 0) jenis.add("Bulat Negatif");
      if (_isPrima(intVal)) jenis.add("Prima");
    } else {
      jenis.add("Desimal");
    }

    setState(() {
      _hasil = "Jenis bilangan:\n- " + jenis.join("\n- ");
      _isCalculated = true;
    });
  }

  bool _isPrima(int n) {
    if (n <= 1) return false;
    for (int i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void _reset() {
    _controller.clear();
    setState(() {
      _hasil = "";
      _isCalculated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jenis Bilangan"),
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
                        "Masukkan Bilangan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _controller,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        decoration: const InputDecoration(
                          labelText: "Bilangan",
                          border: OutlineInputBorder(),
                          hintText: "Contoh: 23, -5, 3.14",
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^-?\d*\.?\d*')),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _cekBilangan,
                              icon: const Icon(Icons.search),
                              label: const Text("Cek"),
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
                          _isCalculated ? "Hasil Analisis" : "Peringatan",
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
