import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camara',
      theme: ThemeData(useMaterial3: false,),
      home: _MyHome(title: "Camara - APP"),
    );
  }
}

 class _MyHome extends StatefulWidget{
  final String title;
  _MyHome({required this.title});

  @override
  State<_MyHome> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHome> {

  XFile? _imageFile; // hay que importar el Dart Imput output = io
  dynamic _ImageError; // todos los errores del try catch se asignan a esta variable. Al ser dinamica no necesita el ?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: _verImagen(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              onPressed: () {
                _botonImagen(ImageSource.gallery);
              },
            child: Icon(Icons.photo_library),
          ),
          Padding(padding: EdgeInsets.all(8)),
          FloatingActionButton(
              onPressed: () {
                _botonImagen(ImageSource.camera);
              },
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
    );
  }

  Widget _verImagen() {
    if (_imageFile != null) {
      return Image.file(File(_imageFile!.path));
    }
    else if (_ImageError != null) {
      return Text(
        "Hubo un error al cargar la imagen: ${_ImageError}",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
          "No hay ninguna imagen cargada", textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25),
          )
          ],
        ),
      );
    }
  }

  Future _botonImagen(ImageSource source) async {
    try {
      _imageFile = await ImagePicker().pickImage(source: source);
      setState(() {});
    }
    catch (e) {
      _ImageError = e;
    }
  }

}

