import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:media/auth/auth_logic.dart';
import 'package:media/auth/auth_method.dart';
import 'package:media/auth/toggle_page.dart';
import 'package:media/firebase_options.dart';
import 'package:media/login.dart';
import 'package:media/register.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider(
      create: (context) => authService(), child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPages(),
    );
  }
}
