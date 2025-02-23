import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
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