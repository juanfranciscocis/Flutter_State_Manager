import 'package:flutter/material.dart';
import 'package:singleton_state_manager/models/usuario.dart';
import 'package:singleton_state_manager/services/usuario_service.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
          return snapshot.hasData ? InformacionUsuario(usuario: usuarioService.usuario,) : Center(child: Text('No hay informacion de usuario'),);
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/pagina2'),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario? usuario;
  const InformacionUsuario({
    super.key, required this.usuario,
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
            title: Text('Nombre: ${usuario!.nombre}'),
          ),
          ListTile(

            title: Text('Edad: ${usuario!.edad ?? 'No tiene edad'}'),
          ),
          const SizedBox(height: 20),

          Text('Profesiones',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(
            title: Text(usuario!.profesiones.length > 0 ? usuario!.profesiones[0] : 'No tiene profesiones'),
          ),
          ListTile(
            title: Text(usuario!.profesiones.length > 0 ? usuario!.profesiones[1] : 'No tiene profesiones'),
          ),
          ListTile(
            title: Text(usuario!.profesiones.length > 0 ? usuario!.profesiones[2] : 'No tiene profesiones'),
          ),
        ],
      ),

    );
  }
}
