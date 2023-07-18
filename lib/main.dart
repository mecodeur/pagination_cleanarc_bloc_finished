import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/features/home/presentation/home_page.dart';

import 'core/services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(titlePage: 'Products',),
    );
  }
}

