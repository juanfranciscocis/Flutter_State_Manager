import 'package:singleton_state_manager/models/usuario.dart';

class _UsuarioService { //make it private for the singleton
  Usuario? _usuario;

  //Getters and setters
  Usuario? get usuario => _usuario;

  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario? usuario) {
  _usuario = usuario;
  }
}

final usuarioService = _UsuarioService(); //Singleton instance
