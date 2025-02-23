import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyPortfolioWeb()));
}

class MyPortfolioWeb extends StatelessWidget {
  const MyPortfolioWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router();
  }
}
