

part of 'usuario_cubit.dart'; // ES UNA PARTE DE MI CUBIT

@immutable
abstract class UsuarioState {}

//PRIMER ESTADO -> INICIAL
class UsuarioInitial extends UsuarioState{
  final bool existeUsuario = false;

  @override
  String toString() => 'UsuarioInitial: existeUsuario: false';
}

//SEGUNDO ESTADO -> EXISTE USUARIO
class UsuarioActivo extends UsuarioState{
  final bool existeUsuario = true;
  late final Usuario usuario;

  UsuarioActivo(this.usuario);

}

