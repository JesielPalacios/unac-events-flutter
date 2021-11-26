import 'dart:math';

import 'package:taller_vehicular/screens/inicio/models/date_model.dart';
import 'package:taller_vehicular/screens/inicio/models/event_type_model.dart';
import 'package:taller_vehicular/screens/inicio/models/events_model.dart';

List<DateModel> getDates() {
  List<DateModel> dates = <DateModel>[];
  DateModel dateModel = new DateModel();

  //1
  dateModel.date = "10";
  dateModel.weekDay = "Dom";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "11";
  dateModel.weekDay = "Lun";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "12";
  dateModel.weekDay = "Mar";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "13";
  dateModel.weekDay = "Mier";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "14";
  dateModel.weekDay = "Jue";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "15";
  dateModel.weekDay = "Vier";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "16";
  dateModel.weekDay = "Sab";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "17";
  dateModel.weekDay = "Dom";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "18";
  dateModel.weekDay = "Lun";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "19";
  dateModel.weekDay = "Mar";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "20";
  dateModel.weekDay = "Mier";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "21";
  dateModel.weekDay = "Jue";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "23";
  dateModel.weekDay = "Vier";
  dates.add(dateModel);
  dateModel = new DateModel();

  //1
  dateModel.date = "24";
  dateModel.weekDay = "Sab";
  dates.add(dateModel);
  dateModel = new DateModel();

  return dates;
}

List<EventTypeModel> getEventTypes() {
  List<EventTypeModel> events = [];
  EventTypeModel eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "./assets/baseline_addchart_white_48dp.png";
  eventModel.eventType = "Big Data";
  events.add(eventModel);
  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath =
      "./assets/baseline_precision_manufacturing_white_48dp.png";
  eventModel.eventType = "Block Chain";
  events.add(eventModel);
  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "./assets/baseline_psychology_white_48dp.png";
  eventModel.eventType = "Machine Learning";
  events.add(eventModel);
  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "./assets/baseline_sports_soccer_white_48dp.png";
  eventModel.eventType = "Data Analitics";
  events.add(eventModel);
  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "./assets/sports.png";
  eventModel.eventType = "Sports";
  events.add(eventModel);
  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "./assets/concert.png";
  eventModel.eventType = "Industry";
  events.add(eventModel);
  eventModel = new EventTypeModel();

  //1
  eventModel.imgAssetPath = "./assets/education.png";
  eventModel.eventType = "Education";
  events.add(eventModel);
  eventModel = new EventTypeModel();

  return events;
}

List<EventsModel> getEvents() {
  List<EventsModel> events = <EventsModel>[];
  EventsModel eventsModel = new EventsModel();

  //1
  eventsModel.imgeAssetPath = "./assets/tileimg.png";
  eventsModel.date = "Nov 5, 2021";
  eventsModel.desc = "Inteligencia social y Ciber Seguridad";
  eventsModel.address = "Sala Interamericana.";
  events.add(eventsModel);
  eventsModel = new EventsModel();

  //2
  eventsModel.imgeAssetPath = "./assets/second.png";
  eventsModel.date = "Nov 7, 2021";
  eventsModel.desc = "Tensorflow js para principiantes.";
  eventsModel.address = "LDS Sal 406 4rtop P.";
  events.add(eventsModel);
  eventsModel = new EventsModel();

  //3
  eventsModel.imgeAssetPath = "./assets/music_event.png";
  eventsModel.date = "Non 12, 2021";
  eventsModel.desc = "Dataware House y lagos de datos";
  eventsModel.address = "Edif. Central Chapman.";
  events.add(eventsModel);
  eventsModel = new EventsModel();

  //1
  eventsModel.imgeAssetPath = "./assets/tileimg.png";
  eventsModel.date = "Nov 5, 2021";
  eventsModel.desc = "Inteligencia social y Ciber Seguridad";
  eventsModel.address = "Sala Interamericana.";
  events.add(eventsModel);
  eventsModel = new EventsModel();

  //2
  eventsModel.imgeAssetPath = "./assets/second.png";
  eventsModel.date = "Nov 7, 2021";
  eventsModel.desc = "Tensorflow js para principiantes.";
  eventsModel.address = "LDS Sal 406 4rto Piso.";
  events.add(eventsModel);
  eventsModel = new EventsModel();

  //3
  eventsModel.imgeAssetPath = "./assets/music_event.png";
  eventsModel.date = "Non 12, 2021";
  eventsModel.desc = "Dataware House y lagos de datos";
  eventsModel.address = "Auditorio G.W Chapman";
  events.add(eventsModel);
  eventsModel = new EventsModel();

  return events;
}
