import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_manager/bloc/usuario/usuario_cubit.dart';

import '../models/usuario.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1', style: TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 50,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: Colors.white,),
            onPressed: () {
              context.read<UsuarioCubit>().borrarUsuario();
            },
          ),
        ],
      ),
      body: BlocBuilder<UsuarioCubit,UsuarioState>(builder: (BuildContext context, state) { //BLOC BUILDER ES UN WIDGET QUE ME PERMITE ESCUCHAR LOS ESTADOS DE MI CUBIT
        print(state);
        if (state is UsuarioInitial) {
          return const Center(child: Text('No hay usuario seleccionado'));
        } else if (state is UsuarioActivo) { //COMO OBTENGO LAS PROPIEDADES DE ESE ESTADO?, DART TIENE QUE ENTENDER QUE ES UN ESTADO DE TIPO USUARIO ACTIVO
          final usuario = state.usuario;
          return InformacionUsuario(usuario: usuario,);
        }else{ //NULL SAFETY, NO SE PUEDE RETORNAR NULL POR ENDE RETORNAMOS EL WIDGET CENTER
          return const Center();
        }

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
            title: Text('Edad: ${usuario.edad}' ),
          ),
          const SizedBox(height: 20),
          Text('Profesiones Creados Con Map',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          //OTRA FORMA DE CREAR LOS LISTTILE, PARA QUE SEAN DINAMICOS!!!
          ...?usuario.profesiones?.map((profesion) => ListTile(title: Text(profesion))).toList(),
        ],
      ),

    );
  }
}
