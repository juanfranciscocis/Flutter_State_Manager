
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

//USUARIO STATE VA A SER PARTE DE MI CUBIT
part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  //UsuarioCubit() : super(0); //EMPIEZA EN EL VALOR QUE QUEREMOS SI ES UN ENTERO

  UsuarioCubit() : super(UsuarioInitial()); //CUANDO SE LLAME AL CONSTRUCTOR, VOY A TENER UN ESTADO INICIAL, QUE VIENE DE USAURIO STATE










}