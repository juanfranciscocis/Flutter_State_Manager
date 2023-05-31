import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_manager/bloc/user/user_bloc.dart';
import 'package:singleton_state_manager/models/usuario.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocBuilder<UserBloc,UserState>( //CADA VEZ QUE HAY UN CAMBIO EN EL ESTADO SE REDIBUJA EL BLOCKBUILDER
        builder: (context, state) {
          return state.existUser ? InformacionUsuario(usuario: state.user!) : Center(child: Text("NO HAY USUARIO"),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/pagina2'),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

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
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          const SizedBox(height: 20),

          Text('Profesiones',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ...?usuario.profesiones?.map((profesion) => ListTile(title: Text(profesion))).toList(),
        ],
      ),

    );
  }
}
