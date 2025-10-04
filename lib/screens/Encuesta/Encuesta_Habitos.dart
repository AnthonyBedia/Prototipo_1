import 'package:flutter/material.dart';

class SurveyStep2 extends StatefulWidget {
  static const routeName = '/survey-step2';
  const SurveyStep2({super.key});

  @override
  State<SurveyStep2> createState() => _SurveyStep2State();
}

class _SurveyStep2State extends State<SurveyStep2> {
  final _formKey = GlobalKey<FormState>();

  bool haFumado = false;
  String? edadInicioFumar;
  bool fumaActualmente = false;
  String? anioDejoFumar;
  String? cigarrillosPorDia;

  bool consumeAlcohol = false;
  String frecuenciaAlcohol = 'Nunca';
  String? copasPorDia;

  bool tieneReflujo = false;
  bool tratamientoReflujo = false;
  String infeccionHpylori = 'No';

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
  Widget build(BuildContext context) {
    final Map<String, dynamic> prevArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Encuesta - Hábitos de vida'),
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
                    // 🔹 Ha fumado alguna vez
                    const Text(
                      '¿Ha fumado tabaco alguna vez?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(haFumado ? 'Sí' : 'No'),
                      value: haFumado,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => haFumado = v),
                    ),
                    if (haFumado) ...[
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: _inputDecoration('¿A qué edad comenzó a fumar?'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => edadInicioFumar = v,
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        '¿Actualmente fuma tabaco?',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SwitchListTile(
                        title: Text(fumaActualmente ? 'Sí' : 'No'),
                        value: fumaActualmente,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => fumaActualmente = v),
                      ),
                      if (!fumaActualmente) ...[
                        const SizedBox(height: 12),
                        TextFormField(
                          decoration: _inputDecoration('¿En qué año lo dejó?'),
                          keyboardType: TextInputType.number,
                          onChanged: (v) => anioDejoFumar = v,
                        ),
                      ],
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: _inputDecoration('¿Cuántos cigarrillos fuma/fumaba por día?'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => cigarrillosPorDia = v,
                      ),
                    ],

                    const SizedBox(height: 20),

                    // 🔹 Alcohol
                    const Text(
                      '¿Consume bebidas alcohólicas?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(consumeAlcohol ? 'Sí' : 'No'),
                      value: consumeAlcohol,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => consumeAlcohol = v),
                    ),
                    if (consumeAlcohol) ...[
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        value: frecuenciaAlcohol,
                        decoration: _inputDecoration('Frecuencia de consumo'),
                        items: const [
                          DropdownMenuItem(value: 'Nunca', child: Text('Nunca')),
                          DropdownMenuItem(value: 'Ocasionalmente', child: Text('Ocasionalmente')),
                          DropdownMenuItem(value: 'Una vez por semana', child: Text('Una vez por semana')),
                          DropdownMenuItem(value: 'Varias veces por semana', child: Text('Varias veces por semana')),
                          DropdownMenuItem(value: 'Todos los días', child: Text('Todos los días')),
                        ],
                        onChanged: (v) => setState(() => frecuenciaAlcohol = v ?? 'Nunca'),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        decoration: _inputDecoration('¿Cuántas copas por día?'),
                        keyboardType: TextInputType.number,
                        onChanged: (v) => copasPorDia = v,
                      ),
                    ],

                    const SizedBox(height: 20),

                    // 🔹 Reflujo
                    const Text(
                      '¿Le han dicho que tiene reflujo gastroesofágico?',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SwitchListTile(
                      title: Text(tieneReflujo ? 'Sí' : 'No'),
                      value: tieneReflujo,
                      activeColor: Colors.cyan.shade300,
                      onChanged: (v) => setState(() => tieneReflujo = v),
                    ),
                    if (tieneReflujo) ...[
                      SwitchListTile(
                        title: const Text('¿Ha recibido tratamiento para el reflujo?'),
                        value: tratamientoReflujo,
                        activeColor: Colors.cyan.shade300,
                        onChanged: (v) => setState(() => tratamientoReflujo = v),
                      ),
                    ],

                    const SizedBox(height: 20),

                    // 🔹 Helicobacter pylori
                    DropdownButtonFormField<String>(
                      value: infeccionHpylori,
                      decoration: _inputDecoration(
                          '¿Alguna vez le han dicho que tuvo infección por Helicobacter pylori?'),
                      items: const [
                        DropdownMenuItem(value: 'Sí', child: Text('Sí')),
                        DropdownMenuItem(value: 'No', child: Text('No')),
                        DropdownMenuItem(value: 'No lo sé', child: Text('No lo sé')),
                      ],
                      onChanged: (v) => setState(() => infeccionHpylori = v ?? 'No'),
                    ),

                    const SizedBox(height: 24),

                    // 🔹 Navegación
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Anterior'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan.shade300,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              final Map<String, dynamic> merged = Map.from(prevArgs);
                              merged['haFumado'] = haFumado;
                              merged['edadInicioFumar'] = edadInicioFumar;
                              merged['fumaActualmente'] = fumaActualmente;
                              merged['anioDejoFumar'] = anioDejoFumar;
                              merged['cigarrillosPorDia'] = cigarrillosPorDia;
                              merged['consumeAlcohol'] = consumeAlcohol;
                              merged['frecuenciaAlcohol'] = frecuenciaAlcohol;
                              merged['copasPorDia'] = copasPorDia;
                              merged['tieneReflujo'] = tieneReflujo;
                              merged['tratamientoReflujo'] = tratamientoReflujo;
                              merged['infeccionHpylori'] = infeccionHpylori;

                              Navigator.pushNamed(context, '/survey-step3', arguments: merged);
                            },
                            child: const Text('Siguiente'),
                          ),
                        ),
                      ],
                    )
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
