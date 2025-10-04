import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> data = {};

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.grey.shade200,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade100,
      appBar: AppBar(
        title: const Text('Registrar'),
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
                      decoration: _inputDecoration('Nombres'),
                      onSaved: (v) => data['nombres'] = v ?? '',
                      validator: (v) => (v == null || v.isEmpty) ? 'Ingrese nombres' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: _inputDecoration('Apellido paterno'),
                      onSaved: (v) => data['apPaterno'] = v ?? '',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: _inputDecoration('Apellido materno'),
                      onSaved: (v) => data['apMaterno'] = v ?? '',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: _inputDecoration('Correo'),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (v) => data['correo'] = v ?? '',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: _inputDecoration('Celular'),
                      keyboardType: TextInputType.phone,
                      onSaved: (v) => data['celular'] = v ?? '',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: _inputDecoration('Contraseña'),
                      obscureText: true,
                      onSaved: (v) => data['pass'] = v ?? '',
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: _inputDecoration('Confirmar contraseña'),
                      obscureText: true,
                      onSaved: (v) => data['pass2'] = v ?? '',
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
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.pushReplacementNamed(context, '/');
                          }
                        },
                        child: const Text('Registrarme'),
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