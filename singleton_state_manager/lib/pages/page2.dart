import 'package:flutter/material.dart';
import 'package:singleton_state_manager/services/usuario_service.dart';

import '../models/usuario.dart';

class Page2 extends StatelessWidget {

  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    Color buttonColor = Theme.of(context).colorScheme.primary;
    return Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: usuarioService.usuarioStream,
            builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
              return snapshot.hasData ? Text('Page 2 - ${snapshot.data!.nombre}',style:TextStyle(color: Colors.white)) : Text('Page 2',style:TextStyle(color: Colors.white));
            },


          ),
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

                    final usuario = Usuario(
                      nombre: 'Juan',
                    );
                    usuarioService.usuario = usuario;

                }),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Cambiar Edad", style: TextStyle(color: Colors.white),),
                  onPressed: () {

                      usuarioService.edad = 30;

                }),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Añadir Profesion", style: TextStyle(color: Colors.white),),
                  onPressed: () {
                        usuarioService.addProfesion("Ingeniero");
                        usuarioService.addProfesion("Medico");
                        usuarioService.addProfesion("Abogado");
                }),

                

                ],
        )));
  }
}
