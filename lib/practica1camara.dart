import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(_camara());
}

class _camara extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Practica - camara",
      theme: ThemeData(useMaterial3: false),
      home: _Home(title: "App - Photograph"),
    );
  }

}


class _Home extends StatefulWidget {
  final String title;

  _Home({Key? key, required this.title}) :super(key: key);

  _homeState createState() => _homeState();
}

class _homeState extends State<_Home>{

  XFile? _fotos;
  dynamic _errorsFoto;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: fotos(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _onButtonImagen(ImageSource.gallery);
            },
            child: Icon(Icons.library_add),
          ),
          Padding(padding: EdgeInsets.all(8)),
          FloatingActionButton(
              onPressed: () {
                _onButtonImagen(ImageSource.camera);
              },
            child: Icon(Icons.camera),
          )
        ],
      ),
    );
  }


  Widget fotos(){
  if (_fotos!=null){
    return Image.file(File(_fotos!.path));
  } else if(_errorsFoto != null) {
    return Text("hubo un fuerte error en la carga de la foto!, ${_errorsFoto}");
  }
  else {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("no hay foto cargada", style: TextStyle(fontSize: 25),)
        ],
      ),
    );
  }
  }

  Future _onButtonImagen(ImageSource source) async {
  try{
    _fotos = await ImagePicker().pickImage(source: source);
    setState(() {});
  } catch(e){
    _errorsFoto = e;
  }


}

}