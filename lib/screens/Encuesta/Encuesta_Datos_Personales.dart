// FILE: lib/screens/survey_step1.dart
import 'package:flutter/material.dart';

class SurveyStep1 extends StatefulWidget {
  static const routeName = '/survey-step1';
  const SurveyStep1({super.key});

  @override
  State<SurveyStep1> createState() => _SurveyStep1State();
}

class _SurveyStep1State extends State<SurveyStep1> {
  final _formKey = GlobalKey<FormState>();
  String sexo = 'Masculino';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Encuesta - Datos Personales'),
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
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Edad'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    const Text('Sexo:'),
                    RadioListTile<String>(
                      title: const Text('Masculino'),
                      value: 'Masculino',
                      groupValue: sexo,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => sexo = v!),
                    ),
                    RadioListTile<String>(
                      title: const Text('Femenino'),
                      value: 'Femenino',
                      groupValue: sexo,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => sexo = v!),
                    ),
                    RadioListTile<String>(
                      title: const Text('Prefiero no decirlo'),
                      value: 'Prefiero no decirlo',
                      groupValue: sexo,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => sexo = v!),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'País de nacimiento'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Ciudad actual'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Peso (kg)'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Altura (cm)'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Raza / grupo étnico'),
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
                          Navigator.pushNamed(context, '/survey-step2');
                        },
                        child: const Text('Siguiente'),
                      ),
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
