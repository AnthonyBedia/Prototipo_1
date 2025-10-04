import 'package:flutter/material.dart';

class SurveyStep6 extends StatefulWidget {
  static const routeName = '/survey-step6';
  const SurveyStep6({super.key});

  @override
  State<SurveyStep6> createState() => _SurveyStep6State();
}

class _SurveyStep6State extends State<SurveyStep6> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController capacidadController = TextEditingController();
  String estadoSalud = 'Regular';

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    );
  }

  @override
  void dispose() {
    capacidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> prevArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Estado general de salud'),
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
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    const Text(
                      'En una escala de 0 a 100, ¿cómo calificaría su capacidad para realizar sus actividades diarias?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: capacidadController,
                      keyboardType: TextInputType.number,
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Ingrese un valor';
                        final n = int.tryParse(v);
                        if (n == null || n < 0 || n > 100) return 'Ingrese un número entre 0 y 100';
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'En general, ¿cómo diría que es su salud actual?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    RadioListTile<String>(
                      title: const Text('Muy buena'),
                      value: 'Muy buena',
                      groupValue: estadoSalud,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => estadoSalud = v!),
                    ),
                    RadioListTile<String>(
                      title: const Text('Buena'),
                      value: 'Buena',
                      groupValue: estadoSalud,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => estadoSalud = v!),
                    ),
                    RadioListTile<String>(
                      title: const Text('Regular'),
                      value: 'Regular',
                      groupValue: estadoSalud,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => estadoSalud = v!),
                    ),
                    RadioListTile<String>(
                      title: const Text('Mala'),
                      value: 'Mala',
                      groupValue: estadoSalud,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => estadoSalud = v!),
                    ),
                    RadioListTile<String>(
                      title: const Text('Muy mala'),
                      value: 'Muy mala',
                      groupValue: estadoSalud,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => estadoSalud = v!),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Anterior'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              backgroundColor: Colors.cyan.shade300,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                final Map<String, dynamic> merged = Map.from(prevArgs);
                                merged['capacidadDiaria'] = int.parse(capacidadController.text);
                                merged['estadoSalud'] = estadoSalud;

                                // Último paso -> ir a resultados
                                Navigator.pushNamed(context, '/results', arguments: merged);
                              }
                            },
                            child: const Text('Finalizar'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
