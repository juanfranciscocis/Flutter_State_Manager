import 'dart:async';

import 'package:singleton_state_manager/models/usuario.dart';

class _UsuarioService { //make it private for the singleton
  Usuario? _usuario;

  final StreamController<Usuario>_usuarioStreamController = StreamController<Usuario>.broadcast(); //broadcast to listen


  //Getters and setters
  Usuario? get usuario => _usuario;

  bool get existeUsuario => (_usuario != null) ? true : false;

  set usuario(Usuario? usuario) {
    _usuario = usuario;
    _usuarioStreamController.add(usuario!);
  }

  set edad(int edad) {
    _usuario!.edad = edad;
    _usuarioStreamController.add(_usuario!);
  }

  void addProfesion(String p){
    _usuario!.profesiones.add(p);
    _usuarioStreamController.add(_usuario!);
    print(_usuario!.profesiones);
  }

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  dispose(){
    _usuarioStreamController.close();
  }

}

final usuarioService = _UsuarioService(); //Singleton instance
