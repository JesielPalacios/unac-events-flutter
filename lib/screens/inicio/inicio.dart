import 'package:flutter/material.dart';
import 'package:taller_vehicular/screens/commonDrawer.dart';
import 'package:taller_vehicular/screens/inicio/models/date_model.dart';
import 'package:taller_vehicular/screens/inicio/models/event_type_model.dart';
import 'package:taller_vehicular/screens/inicio/models/events_model.dart';

class EstructuraInicio extends StatefulWidget {
  static String ruta = "/inicio";

  @override
  State<StatefulWidget> createState() => _EstructuraInicio();
}

class _EstructuraInicio extends State<EstructuraInicio> {

    List<DateModel> dates = new List<DateModel>();
  List<EventTypeModel> eventsType = new List();
  List<EventsModel> events = new List<EventsModel>();

  String todayDateIs = "12";
  
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
