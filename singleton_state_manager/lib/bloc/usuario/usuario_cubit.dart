
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









}