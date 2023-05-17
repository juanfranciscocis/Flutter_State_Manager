import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
      child: Text(
        'Page 1',
        style: Theme.of(context).textTheme.headline1,
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.pushNamed(context, '/pagina2'),
      child: const Icon(Icons.arrow_forward),
    ),
    );
  }
}
