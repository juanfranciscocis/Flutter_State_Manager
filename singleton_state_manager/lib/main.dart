import 'package:flutter/material.dart';

import 'pages/page1.dart';
import 'pages/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/pagina1',
      routes: {
        '/pagina1': (context) => const Page1(),
        '/pagina2': (context) => const Page2(),
      },
    );
  }
}
