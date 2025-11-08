import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriasIMC extends StatelessWidget {
  final double imc; // Recebe o IMC calculado

  const CategoriasIMC({super.key, required this.imc});

  final List<Map<String, dynamic>> categorias = const [
    {"nome": "Abaixo do peso", "faixa": "< 18.5", "cor": Colors.lightBlueAccent},
    {"nome": "Peso normal", "faixa": "18.5 - 24.9", "cor": Colors.greenAccent},
    {"nome": "Sobrepeso", "faixa": "25 - 29.9", "cor": Colors.yellowAccent},
    {"nome": "Obesidade Grau I", "faixa": "30 - 34.9", "cor": Colors.orangeAccent},
    {"nome": "Obesidade Grau II", "faixa": "35 - 39.9", "cor": Colors.deepOrangeAccent},
    {"nome": "Obesidade Grau III", "faixa": "≥ 40", "cor": Colors.redAccent},
  ];

  String _categoriaDoIMC(double imc) {
    if (imc < 18.5) return "Abaixo do peso";
    if (imc < 25) return "Peso normal";
    if (imc < 30) return "Sobrepeso";
    if (imc < 35) return "Obesidade Grau I";
    if (imc < 40) return "Obesidade Grau II";
    return "Obesidade Grau III";
  }

  @override
  Widget build(BuildContext context) {
    final categoriaAtual = _categoriaDoIMC(imc);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Categorias do IMC"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Classificação do IMC",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  final categoria = categorias[index];
                  final isSelected = categoria["nome"] == categoriaAtual;

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? categoria["cor"].withOpacity(0.7)
                          : categoria["cor"].withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          categoria["nome"],
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          categoria["faixa"],
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
