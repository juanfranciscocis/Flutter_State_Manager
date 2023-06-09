import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Page 2'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 50,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  //add the color but make it more transparent
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Establecer Usuario", style: TextStyle(color: Colors.white),),
                  onPressed: () {

                }),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Cambiar Edad", style: TextStyle(color: Colors.white),),
                  onPressed: () {

                }),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Añadir Profesion", style: TextStyle(color: Colors.white),),
                  onPressed: () {

                }),

                

                ],
        )));
  }
}
