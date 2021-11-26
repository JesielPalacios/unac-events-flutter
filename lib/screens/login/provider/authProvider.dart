import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:taller_vehicular/screens/login/model/authResponse.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  Future<AuthResponse> obtenerToken(String email, String password) async {
    // var url = Uri.parse("http://10.0.2.2:8282/api/usuario/login");
    var url = Uri.parse("http://192.168.1.72:4000/api/auth/login");

    var responseHttp =
        await http.post(url, body: {'correo': email, 'contrasena': password});

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);
    // print(jsonResponse); // Esto me imprime la respuesta de la API

    AuthResponse authResponse = AuthResponse(jsonResponse);

    return authResponse;
  }

  cerrarSesion() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.remove('token');

    // String? token = await prefs.getString('token');

    // bool existeToken = token == null ? false : true;

    // return existeToken;
  }

  validarSesion() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = await _prefs.getString('token');

    bool existeToken = token == null ? false : true;

    return existeToken;
  }
}
// admin@localhost.com
