import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';
import '../services/usuario_service.dart';

class Page2 extends StatelessWidget {

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Theme.of(context).colorScheme.primary;
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
        appBar: AppBar(
          title: usuarioService.existeUsuario
              ? Text('Page 2 - ${usuarioService.usuario!.nombre}', style: TextStyle(color: Colors.white),)
              : Text('Page 2', style: TextStyle(color: Colors.white),),
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 50,
          //back button, white
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
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
                    final usuarioService = Provider.of<UsuarioService>(context, listen: false); //listen false para que no se redibuje
                    usuarioService.usuario = Usuario(nombre: 'Juan');



                }),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Cambiar Edad", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                    final usuarioService = Provider.of<UsuarioService>(context, listen: false); //listen false para que no se redibuje
                    usuarioService.usuario!.edad = 30;
                }),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Añadir Profesion", style: TextStyle(color: Colors.white),),
                  onPressed: () {

                    final usuarioService = Provider.of<UsuarioService>(context, listen: false); //listen false para que no se redibuje
                    usuarioService.profesion = "Ingeniero";
                    usuarioService.profesion = "Programador";
                    usuarioService.profesion = "Carpintero";




                }),

                

                ],
        )));
  }
}
