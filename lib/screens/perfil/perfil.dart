import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taller_vehicular/screens/commonDrawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

// Imports Dart
import 'dart:io';
import 'dart:convert';

class EstructuraPerfil extends StatefulWidget {
  static String ruta = "/perfil";

  @override
  State<StatefulWidget> createState() {
    return _EstructuraPerfil();
  }
}

class _EstructuraPerfil extends State<EstructuraPerfil> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String Imagen =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjeZlA20YvSshhUW08KhTPMSnJwZXYCT19YQ&usqp=CAU";
  String FotoSubida = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Perfil"),
        ),
        // drawer: CommonDrawer.obtenerDrawer(context),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                obtenerImagen(ImageSource.camera);
              },
              child: const Icon(
                Icons.camera_alt_outlined,
                color: Colors.red,
                size: 24.0,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                obtenerImagen(ImageSource.gallery);
              },
              child: const Icon(
                Icons.image_search_outlined,
                color: Colors.red,
                size: 24.0,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              width: MediaQuery.of(context).size.width *
                  0.5, // hay que jugar con el valor que esta despues del punto.
              height: MediaQuery.of(context).size.height *
                  0.4, // hay que jugar con el valor que esta despues del punto.
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(Imagen))),
            ),
            // const SizedBox(
            //   height: 5,
            // )
          ],
        ));
  }

  void obtenerImagen(ImageSource source) async {
    File img;
    var picture = await ImagePicker.platform.pickImage(source: source);

    if (picture != null) {
      img = File(picture.path);

      ImageResponse ir = await subirImagen(img);

      this.FotoSubida = ir.fileUploaded;

      if (FotoSubida != '') {
        setState(() {
          this.Imagen =
              "http://192.168.1.72:4000/api/foto/987654321/" + FotoSubida;
          this.FotoSubida = '';
        });
      }
    }
  }

  Future<ImageResponse> subirImagen(File img) async {
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.1.72:4000/api/fotos/"));

    var picture = await http.MultipartFile.fromPath("imagen", img.path);

    request.files.add(picture);

    Position position = await posicionGeografica();

    request.fields["longitud"] = position.longitude.toString();
    request.fields["latitud"] = position.latitude.toString();
    request.fields["altitud"] = position.altitude.toString();

    var response = await request.send();

    var responseData = await response.stream.toBytes();

    String rawResponse = utf8.decode(responseData);

    var jsonResponse = jsonDecode(rawResponse);

    print(rawResponse);

    ImageResponse ir = ImageResponse(jsonResponse);

    return ir;
  }

  Future<Position> posicionGeografica() async {
    bool servicioHabilidado = await Geolocator.isLocationServiceEnabled();
    //GPS esta encendido

    if (servicioHabilidado) {
      LocationPermission permisos = await Geolocator.checkPermission();

      if (permisos == LocationPermission.denied ||
          permisos == LocationPermission.deniedForever) {
        permisos = await Geolocator.requestPermission();
      }

      if (permisos == LocationPermission.whileInUse ||
          permisos == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation);
        return position;
      }
    }

    return Position(
        longitude: 0,
        latitude: 0,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0);
  }
}

class ImageResponse {
  String fileUploaded = "";

  ImageResponse(Map jsonResponse) {
    this.fileUploaded = jsonResponse["fileUploaded"];
  }
}
