// COMO SE ENCUENTRA EL ESTADO DEL APP: EJ-> SI ESTA CARGANDO, SI ESTA LOGUEADO, SI HAY UN ERROR, ETC


part of 'user_bloc.dart';

@immutable
abstract class UserState{//ME SIRVE PARA CREAR UNA CLASE QUE MANEJA LOS ESTADOS DE LA APP
  final bool existUser;
  final Usuario? user;

  const UserState({
      this.existUser = false,
      this.user
  });
}

//ESTADO INICIAL
class UserInitalState extends UserState{
  const UserInitalState() : super(existUser: false, user: null); //CUANDO SE CREA UNA INSTANCIA DE ESTA CLASE, SE VA A CREAR CON ESTOS VALORES
}