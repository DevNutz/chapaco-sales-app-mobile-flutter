import 'package:chapacosales/pages/login_page.dart';
import 'package:chapacosales/providers/product_provider.dart';
import 'package:chapacosales/providers/table_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => TableProvider()..initializeTables()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
