import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:singleton_state_manager/models/usuario.dart';

import '../services/usuario_service.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                usuarioService.removerUsuario();
              },
              icon: const Icon(Icons.logout, color: Colors.white),
            ),
          )
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuario: usuarioService.usuario!,)
          : Center(child: Text('No hay usuario seleccionado')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/pagina2'),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  Usuario usuario;

  InformacionUsuario({
    super.key,
    required this.usuario,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: usuario.edad != null ? Text('Edad: ${usuario.edad}') : Text('Edad: No especificada'),
          ),
          const SizedBox(height: 20),

          Text('Profesiones',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(
            title: usuario.profesiones.length >0 ? Text(usuario.profesiones[0]) :Text('Profesion 1'),
          ),
          ListTile(
            title: usuario.profesiones.length >0 ? Text(usuario.profesiones[1]) :Text('Profesion 2'),
          ),
          ListTile(
            title: usuario.profesiones.length >0 ? Text(usuario.profesiones[2]) :Text('Profesion 3'),
          ),

          ...usuario.profesiones.map((e) => ListTile(title: Text(e))).toList(), //UNA MEJOR FORMA DE HACERLO!!!!
        ],
      ),

    );
  }
}
