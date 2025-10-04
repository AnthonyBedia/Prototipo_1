import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = '/results';
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> answers =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    // Simulamos un cálculo de riesgo (ejemplo: porcentaje aleatorio o basado en algunos campos)
    final int edad = int.tryParse(answers['edad']?.toString() ?? '0') ?? 0;
    int riesgo = 20; // valor base
    if (edad > 50) riesgo += 20;
    if (answers['haFumado'] == true) riesgo += 20;
    if (answers['consumeAlcohol'] == true) riesgo += 15;
    if (answers['familyEsophagealCancer'] == true) riesgo += 25;
    if (riesgo > 100) riesgo = 100;

    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Resultados'),
        backgroundColor: Colors.cyan.shade300,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Análisis de Riesgo',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  // Círculo con porcentaje
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          value: riesgo / 100,
                          strokeWidth: 12,
                          backgroundColor: Colors.grey.shade300,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            riesgo < 40
                                ? Colors.green
                                : (riesgo < 70 ? Colors.orange : Colors.red),
                          ),
                        ),
                      ),
                      Text(
                        '$riesgo%',
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    riesgo < 40
                        ? 'Riesgo bajo'
                        : (riesgo < 70 ? 'Riesgo moderado' : 'Riesgo alto'),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: riesgo < 40
                          ? Colors.green
                          : (riesgo < 70 ? Colors.orange : Colors.red),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Recomendaciones:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: ListView(
                      children: [
                        if (answers['haFumado'] == true)
                          const ListTile(
                            leading: Icon(Icons.smoke_free, color: Colors.red),
                            title: Text('Deje de fumar o reduzca el consumo.'),
                          ),
                        if (answers['consumeAlcohol'] == true)
                          const ListTile(
                            leading: Icon(Icons.no_drinks, color: Colors.orange),
                            title: Text('Reduzca la ingesta de alcohol.'),
                          ),
                        if (answers['capacidadDiaria'] != null &&
                            answers['capacidadDiaria'] < 50)
                          const ListTile(
                            leading: Icon(Icons.fitness_center, color: Colors.blue),
                            title: Text('Mejore su capacidad física con actividad moderada.'),
                          ),
                        const ListTile(
                          leading: Icon(Icons.local_hospital, color: Colors.cyan),
                          title: Text('Consulte a un especialista para chequeos regulares.'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: Colors.cyan.shade300,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: const Text('Volver al menú'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
