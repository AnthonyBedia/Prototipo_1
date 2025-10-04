// FILE: lib/screens/survey_step4.dart
import 'package:flutter/material.dart';

class SurveyStep4 extends StatefulWidget {
  static const routeName = '/survey-step4';
  const SurveyStep4({super.key});

  @override
  State<SurveyStep4> createState() => _SurveyStep4State();
}

class _SurveyStep4State extends State<SurveyStep4> {
  final _formKey = GlobalKey<FormState>();

  bool diagnosedCancer = false;
  final TextEditingController yearController = TextEditingController();
  String whoDiagnosed = 'Médico general';
  String stillHasCancer = 'No lo sé';

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
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> prevArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Diagnóstico y estado actual'),
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
                      '¿Le han diagnosticado cáncer de esófago?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(diagnosedCancer ? 'Sí' : 'No'),
                      value: diagnosedCancer,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => diagnosedCancer = v),
                    ),
                    if (diagnosedCancer) ...[
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: yearController,
                        decoration: _inputDecoration('¿En qué año le dieron el diagnóstico?'),
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (diagnosedCancer && (v == null || v.isEmpty)) {
                            return 'Ingrese el año del diagnóstico';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '¿Quién le dio el diagnóstico?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      RadioListTile<String>(
                        title: const Text('Médico general'),
                        value: 'Médico general',
                        groupValue: whoDiagnosed,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => whoDiagnosed = v!),
                      ),
                      RadioListTile<String>(
                        title: const Text('Especialista'),
                        value: 'Especialista',
                        groupValue: whoDiagnosed,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => whoDiagnosed = v!),
                      ),
                      RadioListTile<String>(
                        title: const Text('Hospital'),
                        value: 'Hospital',
                        groupValue: whoDiagnosed,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => whoDiagnosed = v!),
                      ),
                      RadioListTile<String>(
                        title: const Text('No recuerdo'),
                        value: 'No recuerdo',
                        groupValue: whoDiagnosed,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => whoDiagnosed = v!),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '¿Actualmente sigue teniendo cáncer según su médico?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      RadioListTile<String>(
                        title: const Text('Sí'),
                        value: 'Sí',
                        groupValue: stillHasCancer,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => stillHasCancer = v!),
                      ),
                      RadioListTile<String>(
                        title: const Text('No'),
                        value: 'No',
                        groupValue: stillHasCancer,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => stillHasCancer = v!),
                      ),
                      RadioListTile<String>(
                        title: const Text('No lo sé'),
                        value: 'No lo sé',
                        groupValue: stillHasCancer,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => stillHasCancer = v!),
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
                                final Map<String, dynamic> merged = Map.from(prevArgs);
                                merged['diagnosedCancer'] = diagnosedCancer;
                                merged['diagnosisYear'] = diagnosedCancer ? yearController.text : null;
                                merged['whoDiagnosed'] = whoDiagnosed;
                                merged['stillHasCancer'] = stillHasCancer;

                                Navigator.pushNamed(context, '/survey-step5', arguments: merged);
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
