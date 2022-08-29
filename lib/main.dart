import 'package:alpha_app/authentication/dashboard.dart';
import 'package:alpha_app/authentication/login_page.dart';
import 'package:alpha_app/authentication/register_page.dart';
import 'package:alpha_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const LoginPage(),
      routes: {
        '/register':(context)=>const RegisterPage(),
        '/dashboard':(context)=>const Dashboard(),
      },
    );
  }
}
