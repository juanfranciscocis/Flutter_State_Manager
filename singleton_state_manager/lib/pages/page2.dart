import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton_state_manager/bloc/user/user_bloc.dart';
import 'package:singleton_state_manager/models/usuario.dart';

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
                    //LLAMAMOS AL EVENTO
                    BlocProvider.of<UserBloc>(context,listen: false).add(ActivateUser(Usuario(nombre: 'Juan Cisneros', edad: 21)));

                }),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Cambiar Edad", style: TextStyle(color: Colors.white),),

                  onPressed: BlocProvider.of<UserBloc>(context).state.existUser ? (){
                    //LLAMAMOS AL EVENTO
                    BlocProvider.of<UserBloc>(context,listen: false).add(ChangeUserAge(25));

                }: null),

                const SizedBox(height: 20),

                MaterialButton(
                  color: buttonColor.withAlpha(230),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  child: Text("Añadir Profesion", style: TextStyle(color: Colors.white),),
                  onPressed: BlocProvider.of<UserBloc>(context).state.existUser ?() {
                    //LLAMAMOS AL EVENTO
                    BlocProvider.of<UserBloc>(context,listen: false).add(AddProfession());

                }:null),

                

                ],
        )));
  }
}
