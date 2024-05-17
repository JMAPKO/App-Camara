
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class provider with ChangeNotifier{
  XFile? _imagenFile;
  dynamic _imagenError; // dynamic es un tipo de dato para los errores

  Widget _verImagen(){
    if (_imagenFile!=null){
      return Image.file(File(_imagenFile!.path)); //
    }else if (_imagenError!=null){
      return Text("Existe un error en el archivo: ${_imagenError}");
    }
    else {
      return Text("No hay ninguna imagen cargada", textAlign: TextAlign.center, style: TextStyle(fontSize: 20),);
    }
  }

  dynamic get imagenError => _imagenError;

  set imagenError(dynamic value) {
    _imagenError = value;
  }

  XFile? get imagenFile => _imagenFile;

  set imagenFile(XFile? value) {
    _imagenFile = value;
  }

  Widget verImagen() {
    if (_imagenFile != null) {
      return Image.file(File(_imagenFile!.path)); //image.file
    } else if (_imagenError != null) {
      return Text("Existe un error en el archivo: ${_imagenError}");
    }
    else {
      return Text("No hay ninguna imagen cargada", textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),);
    }
  }

  Future OnButtonImagen(ImageSource source) async{
    try{
      _imagenFile = await ImagePicker().pickImage(source: source);
      notifyListeners();
    }catch(e){
      _imagenError = e;
      notifyListeners();
    }
  }


}