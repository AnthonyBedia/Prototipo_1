// FILE: lib/screens/survey_step3.dart
import 'package:flutter/material.dart';

class SurveyStep3 extends StatefulWidget {
  static const routeName = '/survey-step3';
  const SurveyStep3({super.key});

  @override
  State<SurveyStep3> createState() => _SurveyStep3State();
}

class _SurveyStep3State extends State<SurveyStep3> {
  final _formKey = GlobalKey<FormState>();

  bool diagnosedOtherDisease = false;
  final TextEditingController diseaseController = TextEditingController();

  bool familyCancer = false;
  final TextEditingController familyCountController = TextEditingController();

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
    diseaseController.dispose();
    familyCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Recibir datos previos (si vienen de steps anteriores)
    final Map<String, dynamic> prevArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Antecedentes médicos y familiares'),
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
                      '¿Le han diagnosticado alguna otra enfermedad importante?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(diagnosedOtherDisease ? 'Sí' : 'No'),
                      value: diagnosedOtherDisease,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => diagnosedOtherDisease = v),
                    ),
                    if (diagnosedOtherDisease) ...[
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: diseaseController,
                        decoration: _inputDecoration('Especifique la enfermedad'),
                        validator: (v) => (v == null || v.isEmpty) ? 'Por favor indique la enfermedad' : null,
                      ),
                    ],

                    const SizedBox(height: 16),
                    const Text(
                      '¿Algún familiar cercano ha tenido cáncer de esófago?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(familyCancer ? 'Sí' : 'No'),
                      value: familyCancer,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => familyCancer = v),
                    ),
                    if (familyCancer) ...[
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: familyCountController,
                        decoration: _inputDecoration('¿Cuántos familiares?'),
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Ingrese un número';
                          if (int.tryParse(v) == null) return 'Ingrese un número válido';
                          return null;
                        },
                      ),
                    ],

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
                                // Merge previous args con respuestas de este step
                                final Map<String, dynamic> merged = Map.from(prevArgs);
                                merged['diagnosedOtherDisease'] = diagnosedOtherDisease;
                                merged['otherDiseaseName'] = diseaseController.text;
                                merged['familyEsophagealCancer'] = familyCancer;
                                merged['familyCancerCount'] = familyCancer
                                    ? int.tryParse(familyCountController.text) ?? 0
                                    : 0;

                                Navigator.pushNamed(context, '/survey-step4', arguments: merged);
                              }
                            },
                            child: const Text('Siguiente'),
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
