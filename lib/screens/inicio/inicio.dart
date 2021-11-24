import 'package:flutter/material.dart';
import 'package:taller_vehicular/screens/commonDrawer.dart';

class EstructuraInicio extends StatefulWidget {
  static String ruta = "/inicio";

  @override
  State<StatefulWidget> createState() {
    return _EstructuraInicio();
  }
}

class _EstructuraInicio extends State<EstructuraInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
        ),
        drawer: CommonDrawer.obtenerDrawer(context),
        body: Container(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Inicio de la aplicación."),
            ],
          )),
        ));
  }
}
