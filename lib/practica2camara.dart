import 'package:camara_gps/practica2provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

void main(){
  runApp(_camara());
}

class _camara extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Camara - PROVIDER",
      theme: ThemeData(useMaterial3: false),
      home: ChangeNotifierProvider(
          create: (context) => provider(),
          child: Page1(title: "App - camaraProvider")),
    );
  }
}

class Page1 extends StatelessWidget{
  final String title;
  Page1({Key? key, required this.title}): super(key: key);

  Widget build (BuildContext context){

    final pro = Provider.of<provider>(context);

    return CupertinoPageScaffold(
          child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height*0.6 ,
              width: MediaQuery.of(context).size.height*0.7,
              margin: EdgeInsets.all(15),
              child: pro.verImagen(),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                    onPressed: (){
                      pro.OnButtonImagen(ImageSource.gallery);
                    },
                    child: Icon(Icons.library_add),
                ),
                Padding(padding: EdgeInsets.all(8)),
                FloatingActionButton(
                    onPressed: (){
                      pro.OnButtonImagen(ImageSource.camera);
                    },
                    child: Icon(Icons.camera_alt),
                )
              ],
            ),
          )

    );
  }
}