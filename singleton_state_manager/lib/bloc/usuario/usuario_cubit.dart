
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../models/usuario.dart';

//USUARIO STATE VA A SER PARTE DE MI CUBIT
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  //UsuarioCubit() : super(0); //EMPIEZA EN EL VALOR QUE QUEREMOS SI ES UN ENTERO

  UsuarioCubit() : super(UsuarioInitial()); //CUANDO SE LLAME AL CONSTRUCTOR, VOY A TENER UN ESTADO INICIAL, QUE VIENE DE USAURIO STATE

  void seleccionarUsuario(Usuario usuario) => emit(UsuarioActivo(usuario)); //EMIT ES UN METODO DE CUBIT QUE EMITE UN ESTADO

  void cambiarEdad(int edad) {
    final currentState = state; //ESTADO ACTUAL

    //NROMALMENTE LO MEJOR QUE TENEMOS QUE HACER ES REGRESAR UN NUEVO USAURIO CON EL CAMBIO, SI EL MODELO TIENE PROPIEDADES FINAL!!!
    // PERO ESTO TAMBIEN FUNCIONA, SI LAS PROPIEDADES NO SON FINAL
    /*
    if(currentState is UsuarioActivo){
      currentState.usuario.edad = edad;
      emit(UsuarioActivo(currentState.usuario));
    }
     */

    //PARA ESTO PUEDO MODIFICAR MI MODELO, USANDO COPYWITH
    if(currentState is UsuarioActivo){
      final usuarioActualizado = currentState.usuario.copyWith(edad: edad);
      emit(UsuarioActivo(usuarioActualizado));
    }
  }








}