//ESTADO ACTUAL Y PROCESA LOS ESTADOS!
// BLOC -> BUSINESS LOGIC COMPONENT!!!

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/usuario.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserBloc(): super(const UserInitalState()){
    //MANEJO DE EVENTOS
    on<ActivateUser>((event, emit) {
      print("ActivateUser Called");
      emit(UserSetState(event.user));
    });

    on<ChangeUserAge>((event,emit){
      print("ChangeUserAge Called");
      if(!state.existUser)return; //SI NO EXISTE EL USUARIO NO HAGO NADA
      final newUser = state.user!.copyWith(edad: event.age);
      emit(UserSetState(newUser));
    });
  }



}