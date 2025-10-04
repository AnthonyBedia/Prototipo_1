import 'package:flutter/material.dart';
import 'screens/Bienvenido.dart';
import 'screens/login.dart';
import 'screens/registrar.dart';
import 'screens/menu.dart';
import 'screens/Encuesta/Encuesta_Datos_Personales.dart';
import 'screens/Encuesta/Encuesta_Habitos.dart';
import 'screens/Encuesta/Encuesta_Antecedentes.dart';
import 'screens/Encuesta/Encuesta_Diagnostico.dart';
import 'screens/Encuesta/Encuesta_Tratamientos.dart';
import 'screens/Encuesta/Encuesta_Estado.dart';
import 'screens/resultados.dart';
import 'screens/historial.dart';
import 'screens/editar_perfil.dart';


void main() {
  runApp(const PrototipoApp());
}


class PrototipoApp extends StatelessWidget {
  const PrototipoApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prototipo Grupo 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: Bienvenido.routeName,
      routes: {
        Bienvenido.routeName: (_) => const Bienvenido(),
        Login.routeName: (_) => const Login(),
        RegisterScreen.routeName: (_) => const RegisterScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        SurveyStep1.routeName: (ctx) => const SurveyStep1(),
        SurveyStep2.routeName: (ctx) => const SurveyStep2(),
        SurveyStep3.routeName: (ctx) => const SurveyStep3(),
        SurveyStep4.routeName: (ctx) => const SurveyStep4(),
        SurveyStep5.routeName: (ctx) => const SurveyStep5(),
        SurveyStep6.routeName: (ctx) => const SurveyStep6(),
        ResultsScreen.routeName: (_) => const ResultsScreen(),
        HistoryScreen.routeName: (_) => const HistoryScreen(),
        ProfileScreen.routeName: (_) => const ProfileScreen(),
      },
    );
  }
}