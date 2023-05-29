import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_manager/bloc/usuario/usuario_cubit.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: BlocBuilder<UsuarioCubit,UsuarioState>(builder: (BuildContext context, state){
        print(state);
        if (state is UsuarioInitial) {
          return const Center(child: Text('No hay usuario seleccionado'));
        }else{
          return InformacionUsuario();
        }
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
  const InformacionUsuario({
    super.key,
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
            title: Text('Nombre'),
          ),
          ListTile(
            title: Text('Edad'),
          ),
          const SizedBox(height: 20),

          Text('Profesiones',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(
            title: Text('Profesion 1'),
          ),
          ListTile(
            title: Text('Profesion 2'),
          ),
          ListTile(
            title: Text('Profesion 3'),
          ),
        ],
      ),

    );
  }
}
