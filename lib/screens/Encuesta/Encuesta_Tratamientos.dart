import 'package:flutter/material.dart';

class SurveyStep5 extends StatefulWidget {
  static const routeName = '/survey-step5';
  const SurveyStep5({super.key});

  @override
  State<SurveyStep5> createState() => _SurveyStep5State();
}

class _SurveyStep5State extends State<SurveyStep5> {
  final _formKey = GlobalKey<FormState>();

  bool preSurgeryTreatment = false;
  bool hadSurgery = false;
  bool hadRadiotherapy = false;
  bool hadChemotherapy = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> prevArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Tratamientos y evolución'),
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
                      '¿Ha recibido tratamiento contra el cáncer antes de una cirugía? (quimio o radio antes de operar)',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(preSurgeryTreatment ? 'Sí' : 'No'),
                      value: preSurgeryTreatment,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => preSurgeryTreatment = v),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '¿Se ha sometido a una cirugía por el cáncer?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(hadSurgery ? 'Sí' : 'No'),
                      value: hadSurgery,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => hadSurgery = v),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '¿Ha recibido radioterapia?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(hadRadiotherapy ? 'Sí' : 'No'),
                      value: hadRadiotherapy,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => hadRadiotherapy = v),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '¿Ha recibido quimioterapia?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(hadChemotherapy ? 'Sí' : 'No'),
                      value: hadChemotherapy,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => hadChemotherapy = v),
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
                                merged['preSurgeryTreatment'] = preSurgeryTreatment;
                                merged['hadSurgery'] = hadSurgery;
                                merged['hadRadiotherapy'] = hadRadiotherapy;
                                merged['hadChemotherapy'] = hadChemotherapy;

                                Navigator.pushNamed(context, '/survey-step6', arguments: merged);
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
