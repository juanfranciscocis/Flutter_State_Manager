

import 'package:flutter/cupertino.dart';
import 'package:singleton_state_manager/models/usuario.dart';

class UsuarioService with ChangeNotifier{

  Usuario? _usuario;

  UsuarioService(this._usuario);

  Usuario? get usuario => _usuario;

  set usuario(Usuario? usuario){
    this._usuario = usuario;
    notifyListeners();
  }

  bool get existeUsuario => _usuario != null ? true : false;

  set edad(int? edad){
    this._usuario!.edad = edad;
    notifyListeners();
  }

  set profesion(String profesion){
    this._usuario!.profesiones.add(profesion);
    notifyListeners();
  }

  void removerUsuario(){
    this._usuario = null;
    notifyListeners();
  }


}