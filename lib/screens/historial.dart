import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = '/history';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Recuperamos lo que venga por argumentos
    List<Map<String, dynamic>> results =
        ModalRoute.of(context)?.settings.arguments as List<Map<String, dynamic>>? ?? [];

    // Si no llega nada, simulamos datos de prueba
    if (results.isEmpty) {
      results = [
        {'riesgo': 25, 'fecha': '2025-09-26 12:30'},
        {'riesgo': 55, 'fecha': '2025-09-25 10:10'},
        {'riesgo': 80, 'fecha': '2025-09-20 09:45'},
      ];
    }

    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Historial de análisis'),
        backgroundColor: Colors.cyan.shade300,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: results.length,
        itemBuilder: (context, index) {
          final item = results[index];
          final riesgo = item['riesgo'] ?? 0;
          final fecha = item['fecha'] ?? 'Fecha desconocida';

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: Icon(
                Icons.analytics,
                color: riesgo < 40
                    ? Colors.green
                    : (riesgo < 70 ? Colors.orange : Colors.red),
                size: 36,
              ),
              title: Text('Riesgo: $riesgo%'),
              subtitle: Text('Fecha: $fecha'),
            ),
          );
        },
      ),
    );
  }
}
