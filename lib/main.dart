import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gsmg/providers/name.dart';
import 'package:gsmg/routes.dart';
import 'package:gsmg/services/authService.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      child: const Routes(),
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => NameProvider()),
      ],
    ),
  );
}
