// ACCIONES QUE SE PUEDEN DISPARAR EN EL BLOC Y CAMBIAR EL ESTADO
part of 'user_bloc.dart';

@immutable
abstract class UserEvent {} //QUE EVENTOS VA A PODER ESPERAR

class ActivateUser extends UserEvent{
  final Usuario user;
  ActivateUser(this.user);
}