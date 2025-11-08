import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'categorias_imc.dart';

void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculadora de IMC",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const CalculadoraIMC(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final TextEditingController _alturaController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  String _resultado = '';
  String _categoria = '';
  double? _imcCalculado;
  String _generoSelecionado = 'Masculino';

  void _calcularIMC() {
    final alturaText = _alturaController.text;
    final pesoText = _pesoController.text;

    if (alturaText.isEmpty || pesoText.isEmpty) {
      _mostrarErro("Preencha altura e peso.");
      return;
    }

    final alturaCm = double.tryParse(alturaText);
    final peso = double.tryParse(pesoText);

    if (alturaCm == null || alturaCm <= 0) {
      _mostrarErro("Altura inválida.");
      return;
    }
    if (peso == null || peso <= 0) {
      _mostrarErro("Peso inválido.");
      return;
    }

    final alturaM = alturaCm / 100;
    final imc = peso / (alturaM * alturaM);

    setState(() {
      _imcCalculado = imc;
      _resultado = "Seu IMC é ${imc.toStringAsFixed(2)}";
      _categoria = _definirCategoria(imc);
    });
  }

  String _definirCategoria(double imc) {
    if (imc < 18.5) return "Abaixo do peso";
    if (imc < 25) return "Peso normal";
    if (imc < 30) return "Sobrepeso";
    if (imc < 35) return "Obesidade Grau I";
    if (imc < 40) return "Obesidade Grau II";
    return "Obesidade Grau III";
  }

  void _mostrarErro(String mensagem) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Erro"),
        content: Text(mensagem),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _selecionarGenero(String genero) {
    setState(() {
      _generoSelecionado = genero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de IMC"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _generoCard('Masculino', Icons.male, Colors.blueAccent),
                _generoCard('Feminino', Icons.female, Colors.pinkAccent),
              ],
            ),
            const SizedBox(height: 30),
            _inputField("Altura (cm)", _alturaController),
            const SizedBox(height: 16),
            _inputField("Peso (kg)", _pesoController),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _calcularIMC,
              child: const Text(
                "Calcular IMC",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            if (_resultado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(
                      _resultado,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _categoria,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _imcCalculado != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriasIMC(
                            imc: _imcCalculado!,
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text(
                "Ver categorias do IMC",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _generoCard(String genero, IconData icone, Color cor) {
    final isSelected = _generoSelecionado == genero;
    return GestureDetector(
      onTap: () => _selecionarGenero(genero),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? cor.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(
              icone,
              size: 50,
              color: isSelected ? cor : Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              genero,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
