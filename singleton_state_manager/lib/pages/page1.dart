import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        'Page 1',
        style: Theme.of(context).textTheme.headline1,
      ),
    )
    );
  }
}
