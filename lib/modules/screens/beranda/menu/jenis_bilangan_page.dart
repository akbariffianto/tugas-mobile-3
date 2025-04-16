import 'package:flutter/material.dart';

class JenisBilanganPage extends StatefulWidget {
  @override
  _JenisBilanganPageState createState() => _JenisBilanganPageState();
}

class _JenisBilanganPageState extends State<JenisBilanganPage> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";

  void _cekBilangan() {
    final input = _controller.text.trim();
    if (input.isEmpty) {
      setState(() {
        _hasil = "Masukkan bilangan terlebih dahulu.";
      });
      return;
    }

    final num? number = num.tryParse(input);

    if (number == null) {
      setState(() {
        _hasil = "Input bukan bilangan valid.";
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jenis Bilangan")),
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
                  labelText: "Masukkan bilangan",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _cekBilangan, child: Text("Cek")),
                  SizedBox(width: 10),
                  ElevatedButton(onPressed: _reset, child: Text("Reset")),
                ],
              ),
              SizedBox(height: 30),
              Text(
                _hasil,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
