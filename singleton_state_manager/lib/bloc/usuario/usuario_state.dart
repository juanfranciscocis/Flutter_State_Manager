

part of 'usuario_cubit.dart'; // ES UNA PARTE DE MI CUBIT

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState{
  final bool existeUsuario = false;

  @override
  String toString() => 'UsuarioInitial: existeUsuario: false';
}

